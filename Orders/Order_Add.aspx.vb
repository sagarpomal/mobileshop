Imports System.Data

Partial Class Products_Suppliers_View
    Inherits System.Web.UI.Page

    Public OBJ1 As New Class1
    Public obj As System.Data.SqlClient.SqlDataReader
    Dim dt As New DataTable
    Public fl As Double
    Public Y As Double
    Dim i As Double
    Dim sub_total As Double
    Dim available As Integer

    Public Sub product_total()
        If txt_qty.Text <> "" And IsNumeric(txt_qty.Text) Then
            If txt_unit_cost.Text <> "" And IsNumeric(txt_unit_cost.Text) Then
                If txt_discount.Text <> "" And IsNumeric(txt_discount.Text) Then

                
                    sub_total = Convert.ToDouble(txt_qty.Text) * Convert.ToDouble(txt_unit_cost.Text)
                    txt_total_price.Text = sub_total - (sub_total * Convert.ToDouble(txt_discount.Text) / 100)

                End If
            End If
        End If

    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        txt_date.Text = Calendar1.SelectedDate
        Calendar1.Visible = False
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'txt_product_name.Focus()
        Dim cp As ContentPlaceHolder = DirectCast(Me.Master.Master.FindControl("MainContent"), ContentPlaceHolder)


        Dim li As System.Web.UI.HtmlControls.HtmlGenericControl

        li = cp.FindControl("id1")

        li.Attributes.Add("class", "active")

        If Not Page.IsPostBack Then
            'Response.Cookies("fl").Value = "0"
            fl = 1
            Y = 1
            dt.Columns.Add("product_id")
            dt.Columns.Add("product_name")
            dt.Columns.Add("cost_price")
            dt.Columns.Add("qty")
            dt.Columns.Add("discount")
            dt.Columns.Add("sub_total")
            dt.Columns.Add("total")

            'dt.Rows.Add(R)
            ViewState("CurrentTable") = dt
            GridView1.DataSource = dt
            GridView1.DataBind()

            Dim obj2 As System.Data.SqlClient.SqlDataReader
            cb_product_name.DataSourceID = SqlDataSource1.ID
            cb_product_name.DataBind()
            obj2 = OBJ1.getdata("select listprice from products where id = '" & cb_product_name.SelectedValue & "' and companyid = '" & Request.Cookies("CompanyID").Value & "' ")

            While obj2.Read
                txt_unit_cost.Text = obj2.Item("listprice")
            End While
            OBJ1.close_conn()

            
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("~/Orders/Order_List.aspx")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Calendar1.Visible = True
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim j As Double

        i = cb_product_name.SelectedValue

        If Y <> 1 Then
            Dim x As Integer = GridView1.Rows.Count
            If x > 0 Then
               
                For Each row1 As GridViewRow In GridView1.Rows
                    
                    If i = Convert.ToInt32(row1.Cells(0).Text) Then
                        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Product is Already added !')", True)

                        Y = 0
                        Exit For
                    Else
                        Y = 1
                    End If

                Next
               
            Else
                Y = 1
            End If
            
        End If
        'For Each row3 As GridViewRow In GridView1.Rows

        obj = OBJ1.getdata("select productid, available from inventory where productid = '" & cb_product_name.SelectedValue & "' ")
        If obj.HasRows Then
            If obj.HasRows Then
                While obj.Read
                    available = obj.Item("available")
                End While
            End If
        End If
        If available > 0 Then
            If Y = 1 Then
                Dim dtCurrentTable As DataTable = DirectCast(ViewState("CurrentTable"), DataTable)

                Dim R As DataRow = dtCurrentTable.NewRow
                R("product_id") = cb_product_name.SelectedValue
                R("product_name") = cb_product_name.SelectedItem
                R("cost_price") = txt_unit_cost.Text
                R("qty") = txt_qty.Text
                R("discount") = txt_discount.Text
                R("total") = txt_total_price.Text
                R("sub_total") = sub_total
                dtCurrentTable.Rows.Add(R)
                GridView1.DataSource = dtCurrentTable
                GridView1.DataBind()
                fl = 0
                txt_qty.Text = ""
                txt_unit_cost.Text = ""
                txt_total_price.Text = ""
                txt_discount.Text = ""
            End If

            Dim v As Double
            Dim w As Double
            For Each row2 As GridViewRow In GridView1.Rows
                v += Convert.ToDouble(row2.Cells(4).Text)
                w += Convert.ToDouble(row2.Cells(6).Text)
                txt_order_sub_total.Text = v
                txt_order_total.Text = w
            Next
        Else
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('No Stock Available !')", True)

        End If
        'Next





    End Sub

    Protected Sub txt_qty_TextChanged(sender As Object, e As EventArgs) Handles txt_qty.TextChanged, txt_unit_cost.TextChanged
        product_total()
    End Sub


    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        RequiredFieldValidator4.Validate()
        txt_date.ValidateRequestMode = UI.ValidateRequestMode.Enabled

        If GridView1.Rows.Count > 0 Then
            If chck_payment.Checked = False Then
                OBJ1.adddata("insert into orders(orderdate, ordersubtotal, ordertotal, isactive, companyid) values ('" & txt_date.Text & "', '" & txt_order_sub_total.Text & "', '" & txt_order_total.Text & "', '" & 0 & "', '" & Request.Cookies("companyid").Value & "')  ")
            Else
                OBJ1.adddata("insert into orders(orderdate, ordersubtotal, ordertotal, isactive, companyid) values ('" & txt_date.Text & "', '" & txt_order_sub_total.Text & "', '" & txt_order_total.Text & "', '" & 1 & "', '" & Request.Cookies("companyid").Value & "')  ")
            End If


            obj = OBJ1.getdata("select TOP 1 id from orders ORDER BY ID DESC")
            Dim order_id As Integer
            While obj.Read
                order_id = obj.Item(0)
            End While
            OBJ1.close_conn()

            Dim available1 As Integer

            For Each row3 As GridViewRow In GridView1.Rows
                obj = OBJ1.getdata("select productid, available from inventory where productid = '" & Convert.ToDouble(row3.Cells(0).Text) & "' ")
                If obj.HasRows Then
                    While obj.Read
                        available1 = obj.Item("available")
                    End While
                End If
                OBJ1.close_conn()
                MsgBox(available1)
                MsgBox(Convert.ToDouble(row3.Cells(2).Text))
                OBJ1.adddata("update inventory set available='" & available1 - (Convert.ToDouble(row3.Cells(2).Text)) & "' where productid = '" & Convert.ToDouble(row3.Cells(0).Text) & "' ")
                OBJ1.adddata("insert into orderdetails(quantity, unitprice, orderid, productid, companyid, discount, total_price) values ('" & Convert.ToDouble(row3.Cells(2).Text) & "', '" & Convert.ToDouble(row3.Cells(3).Text) & "','" & order_id & "', '" & Convert.ToDouble(row3.Cells(0).Text) & "' , '" & Request.Cookies("companyid").Value & "', '" & Convert.ToDouble(row3.Cells(5).Text) & "', '" & Convert.ToDouble(row3.Cells(6).Text) & "')  ")

                'Else
                '    OBJ1.close_conn()
                '    OBJ1.adddata("insert into inventory(productid, available) values('" & Convert.ToDouble(row3.Cells(0).Text) & "', '" & (Convert.ToDouble(row3.Cells(2).Text) + availalbe) & "')  ")
                '    OBJ1.adddata("insert into purchaseorderdetails(quantity, unitcost, purchaseorderid, productid, companyid) values ('" & Convert.ToDouble(row3.Cells(2).Text) & "', '" & Convert.ToDouble(row3.Cells(3).Text) & "','" & order_id & "', '" & Convert.ToDouble(row3.Cells(0).Text) & "' , '" & Request.Cookies("companyid").Value & "')  ")
                'Else
                ''ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('No Stock Available !')", True)
                'End If

            Next
            Response.Redirect("~/Orders/Order_List.aspx")
            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Purchase Done !')", True)
            'Response.Redirect("~/Purchases/Purchase_List.aspx")

        Else
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('No Product Selected !')", True)
        End If
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        'e.Row.Cells[0].Visible=false;
        e.Row.Cells(0).Visible = False
    End Sub

    Protected Sub GridView1_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles GridView1.RowDeleted

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub cb_product_name_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cb_product_name.SelectedIndexChanged
        obj = OBJ1.getdata("select listprice from products where id = '" & cb_product_name.SelectedValue & "' and companyid = '" & Request.Cookies("CompanyID").Value & "' ")

        While obj.Read
            txt_unit_cost.Text = obj.Item("listprice")
        End While
        OBJ1.close_conn()
    End Sub
End Class
