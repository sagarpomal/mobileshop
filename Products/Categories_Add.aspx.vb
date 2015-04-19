
Partial Class Products_Suppliers_View
    Inherits System.Web.UI.Page
    Dim OBJ1 As New Class1
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim cp As ContentPlaceHolder = DirectCast(Me.Master.Master.FindControl("MainContent"), ContentPlaceHolder)
        ' ContentPlaceHolder cp = this.Master.Master.FindControl("MainContent") as ContentPlaceHolder;

        Dim li As System.Web.UI.HtmlControls.HtmlGenericControl

        li = cp.FindControl("id3")

        'li = Page.Master.FindControl("id4")

        li.Attributes.Add("class", "active")

        'Page.Validate()

    End Sub

   
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        System.Threading.Thread.Sleep(3000)
        Page.Validate()
        If Page.IsValid() Then
            MsgBox(Request.Cookies("CompanyID").Value)
            OBJ1.adddata("insert into categories values('" & txt_category.Text & "', '" & Request.Cookies("CompanyID").Value & "') ")
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Category Updated !')", True)
            Response.Redirect("~/Products/Category_List.aspx")
        End If
        'ksfdsaf()
    End Sub

    
End Class
