
Partial Class Products_Supplier_List
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        'Dim id4 As HtmlGenericControl = DirectCast(Me.Master.FindControl("id4"), HtmlGenericControl)
        'Dim li As HtmlGenericControl = CType((Page.Master.FindControl("id4")), HtmlGenericControl)
        'Dim li As Control = Page.Master.FindControl("id4")
        Dim cp As ContentPlaceHolder = DirectCast(Me.Master.Master.FindControl("MainContent"), ContentPlaceHolder)
        ' ContentPlaceHolder cp = this.Master.Master.FindControl("MainContent") as ContentPlaceHolder;

        Dim li As System.Web.UI.HtmlControls.HtmlGenericControl

        li = cp.FindControl("id1")

        'li = Page.Master.FindControl("id4")

        li.Attributes.Add("class", "active")
        'Dim id4 As System.Web.UI.HtmlControls.HtmlGenericControl = DirectCast(Me.Master.FindControl("id4"), System.Web.UI.HtmlControls.HtmlGenericControl)
        'id4.Attributes("class") = "active"

    End Sub

    'Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
    '    Dim url As String = "Suppliers_View.aspx"
    '    Dim s As String = "window.open('" & url + "', 'popup_window', 'width=800,height=500,left=100,top=100,resizable=yes');"
    '    ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)
    'End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("~/Purchases/Purchase_Add.aspx")
    End Sub

    'Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
    'GridView1.DataSource = SqlDataSource1
    'If TextBox1.Text = "" Then

    '    GridView1.DataSourceID = SqlDataSource1.ID
    '    GridView1.DataBind()
    '    TextBox1.Focus()
    'Else
    '    GridView1.DataSourceID = SqlDataSource2.ID
    '    GridView1.DataBind()
    '    TextBox1.Focus()
    'End If
    'End Sub
End Class
