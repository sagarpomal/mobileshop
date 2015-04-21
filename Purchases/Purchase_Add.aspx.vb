
Partial Class Products_Suppliers_View
    Inherits System.Web.UI.Page
    Public OBJ1 As New Class1
    Public obj As System.Data.SqlClient.SqlDataReader
    

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        txt_date.Text = Calendar1.SelectedDate
        Calendar1.Visible = False
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'txt_product_name.Focus()
        Dim cp As ContentPlaceHolder = DirectCast(Me.Master.Master.FindControl("MainContent"), ContentPlaceHolder)
        ' ContentPlaceHolder cp = this.Master.Master.FindControl("MainContent") as ContentPlaceHolder;

        Dim li As System.Web.UI.HtmlControls.HtmlGenericControl

        li = cp.FindControl("id1")

        'li = Page.Master.FindControl("id4")

        li.Attributes.Add("class", "active")

        'If Not Page.IsPostBack Then


        '    If Request.QueryString("ProID") <> "" Then
        '        'Dim catid As Integer
        '        'Dim supid As Integer
        '        obj = OBJ1.getdata("select * from products where id='" & Request.QueryString("ProID") & "' ")
        '        While obj.Read
        '            txt_product_code.Text = obj.Item("productcode")
        '            txt_product_name.Text = obj.Item("productname")
        '            txt_standard_cost.Text = obj.Item("standardcost")
        '            txt_list_price.Text = obj.Item("listprice")
        '            cb_category.SelectedValue = obj.Item("categoryid")
        '            cb_supplier.SelectedValue = obj.Item("supplierid")
        '            'catid = obj.Item("categoryid")
        '            'supid = obj.Item("supplierid")
        '        End While
        '        OBJ1.close_conn()

        '        'obj = OBJ1.getdata("select * from category where id='" & catid & "' ")
        '        'While obj.Read
        '        '    cb_category.SelectedValue = obj.Item("productcode")
        '        '    txt_product_name.Text = obj.Item("productname")
        '        '    txt_standard_cost.Text = obj.Item("standardcost")
        '        '    txt_list_price.Text = obj.Item("listprice")
        '        '    catid = obj.Item("categoryid")
        '        '    supid = obj.Item("supplierid")
        '        'End While
        '        'OBJ1.close_conn()

        '    End If
        'End If
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
        Response.Redirect("~/Products/Product_List.aspx")
    End Sub

    Protected Sub txt_date_TextChanged(sender As Object, e As EventArgs) Handles txt_date.TextChanged
        'If Calendar1.Visible = False Then
        '    Calendar1.Visible = True
        'ElseIf Calendar1.Visible = False Then
        '    Calendar1.Visible = True


        'End If

    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Calendar1.Visible = True
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

    End Sub
End Class
