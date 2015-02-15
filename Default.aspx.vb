
Partial Class Dashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        ' ''Session.Add("login", TextBox1.Text)
        ''Dim str As String
        ''str = Session.Item("login")
        'Dim city As String = CType(Session.Item("login"), String)
        ''If Session.Item("login") Is Nothing Then
        'If city = "" Then
        '    ' Response.Redirect("~/Default.aspx")
        '    Response.Redirect("~/login.aspx")
        'Else
        'Response.Redirect("~/Default.aspx")


        'End If
        Dim str As String = "aa"
        If Not Session("login") = "done" Then
            Response.Redirect("~/login.aspx")
        End If


    End Sub
End Class
