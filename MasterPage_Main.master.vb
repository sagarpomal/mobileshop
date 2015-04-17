
Partial Class MasterPage_Main
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub


   
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Cookies("UserName").Expires = DateTime.Now.AddDays(-1)
        Response.Redirect("/Login.aspx")


        'FormsAuthentication.SignOut()

        'Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
        'Request.Cookies("UserName").Value = Nothing
        'Request.Cookies("UserName").Value = ""
        'Response.Redirect("/Login.aspx")
    End Sub
End Class

