
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If (Request.Cookies("UserName") Is Nothing) Then


                Response.Redirect("/Login.aspx")

            End If
        End If
    End Sub
End Class
