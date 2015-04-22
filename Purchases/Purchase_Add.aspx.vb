Imports System.Data

Partial Class Products_Suppliers_View
    Inherits System.Web.UI.Page

    Public OBJ1 As New Class1
    Public obj As System.Data.SqlClient.SqlDataReader
    Dim dt As New DataTable
    Public fl As Double
    Public Y As Double
    Dim i As Double

    Public Sub product_total()
        'If RequiredFieldValidator2.IsValid Then
        '    If RequiredFieldValidator4.IsValid Then
        '        If RangeValidator1.IsValid Then
        '            If RangeValidator2.IsValid Then

        '            End If
        '        End If
        '    End If
        'End If

        txt_total_price.Text = Convert.ToDouble(txt_qty.Text) * Convert.ToDouble(txt_unit_cost.Text)

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
            dt.Columns.Add("total")

            'Dim R As DataRow = dt.NewRow
            'R("product_id") = String.Empty
            'R("product_name") = String.Empty
            'R("cost_price") = String.Empty
            'R("qty") = String.Empty

            'R("total") = txt_total_price.Text

            'dt.Rows.Add(R)
            ViewState("CurrentTable") = dt
            GridView1.DataSource = dt
            GridView1.DataBind()
        End If
    End Sub

    'Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click, Button3.Click

    '    Dim button As Button = DirectCast(sender, Button)
    '    Dim buttonId As String = button.ID
    '    System.Threading.Thread.Sleep(3000)
    '    Page.Validate()
    '    If Page.IsValid() Then
    '        If Request.QueryString("ProID") <> "" Then
    '            'MsgBox(txt_category.Text)
    '            OBJ1.adddata("update products set productcode='" & txt_product_code.Text & "', productname='" & txt_product_name.Text & "', standardcost='" & txt_standard_cost.Text & "', listprice='" & txt_list_price.Text & "', supplierid='" & cb_supplier.SelectedValue & "', categoryid='" & cb_category.SelectedValue & "' where id='" & Request.QueryString("ProID") & "' ")
    '            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Product Updated !')", True)
    '            If buttonId = "Button2" Then
    '                Response.Redirect("~/Products/Product_List.aspx")
    '            ElseIf buttonId = "Button3" Then
    '                'txt_category.Text = ""
    '                txt_product_code.Text = ""
    '                txt_product_name.Text = ""
    '                txt_standard_cost.Text = ""
    '                txt_list_price.Text = ""
    '                cb_category.SelectedIndex = 0
    '                cb_supplier.SelectedIndex = 0

    '                Response.Redirect("~/Products/Products_Add.aspx")

    '            End If


    '        Else
    '            OBJ1.adddata("insert into products(productcode, productname, standardcost, listprice, supplierid, categoryid, companyID) values('" & txt_product_code.Text & "', '" & txt_product_name.Text & "', '" & txt_standard_cost.Text & "', '" & txt_list_price.Text & "', '" & cb_supplier.SelectedValue & "', '" & cb_category.SelectedValue & "', '" & Request.Cookies("CompanyId").Value & "') ")
    '            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Product Updated !')", True)
    '            If buttonId = "Button2" Then
    '                Response.Redirect("~/Products/Product_List.aspx")
    '            ElseIf buttonId = "Button3" Then
    '                'txt_category.Text = ""
    '                txt_product_code.Text = ""
    '                txt_product_name.Text = ""
    '                txt_standard_cost.Text = ""
    '                txt_list_price.Text = ""
    '                cb_category.SelectedIndex = 0
    '                cb_supplier.SelectedIndex = 0

    '                Response.Redirect("~/Products/Products_Add.aspx")

    '            End If

    '        End If


    '    End If
    '    'ksfdsaf()
    'End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("~/Purchases/Purchase_List.aspx")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Calendar1.Visible = True
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim j As Double

        i = cb_product_name.SelectedValue
        'Dim x As Integer = DataGridView1.RowCount - 1
        If Y <> 1 Then
            Dim x As Integer = GridView1.Rows.Count
            'MsgBox(x.ToString)
            Dim array1(x) As Double
            While x > 0
                For Each row1 As GridViewRow In GridView1.Rows
                    array1(x) = Convert.ToInt32(row1.Cells(0).Text)
                    'MsgBox(array1(x))
                Next
                x -= 1
            End While
            'MsgBox(array1(x))

            For Each j In array1

                If i = j Then
                    ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Product is Already added !')", True)

                    Y = 0
                Else
                    Y = 1
                End If
            Next
        End If

        If Y = 1 Then
            Dim dtCurrentTable As DataTable = DirectCast(ViewState("CurrentTable"), DataTable)

            Dim R As DataRow = dtCurrentTable.NewRow
            R("product_id") = cb_product_name.SelectedValue
            R("product_name") = cb_product_name.SelectedItem
            R("cost_price") = txt_unit_cost.Text
            R("qty") = txt_qty.Text

            R("total") = txt_total_price.Text

            dtCurrentTable.Rows.Add(R)
            GridView1.DataSource = dtCurrentTable
            GridView1.DataBind()
            fl = 0
            txt_qty.Text = ""
            txt_unit_cost.Text = ""
            txt_total_price.Text = ""
        End If
        'Dim d As Integer = DataGridView1.RowCount - 1
        'Dim c, g, f As Double
        'While d >= 0
        '    c += DataGridView1.Item("discount", d).Value
        '    g += DataGridView1.Item("sub_total", d).Value
        '    f += DataGridView1.Item("total", d).Value
        '    'g += DataGridView1.Item(8, d).Value * DataGridView1.Item(9, d).Value
        '    'f = g - c
        '    txt_total_discount.Text = c
        '    txt_sub_total.Text = g
        '    txt_oveerall_total.Text = f
        '    global_overall = f

        '    'txt_total.Text = f
        '    'tot += DataGridView1.Item(8, d).Value
        '    d -= 1
        'End While
    End Sub

    Protected Sub txt_qty_TextChanged(sender As Object, e As EventArgs) Handles txt_qty.TextChanged, txt_unit_cost.TextChanged
        product_total()
    End Sub


End Class
