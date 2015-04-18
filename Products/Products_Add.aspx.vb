
Partial Class Products_Suppliers_View
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim cp As ContentPlaceHolder = DirectCast(Me.Master.Master.FindControl("MainContent"), ContentPlaceHolder)
        ' ContentPlaceHolder cp = this.Master.Master.FindControl("MainContent") as ContentPlaceHolder;

        Dim li As System.Web.UI.HtmlControls.HtmlGenericControl

        li = cp.FindControl("id1")

        'li = Page.Master.FindControl("id4")

        li.Attributes.Add("class", "active")
    End Sub
End Class
