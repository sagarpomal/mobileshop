
Partial Class login
    Inherits System.Web.UI.Page

   
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

        'For Each aControl As Control In Me.Controls
        Me.Page.ClientScript.RegisterForEventValidation(Button1.UniqueID)
        ' Next aControl

        MyBase.Render(writer)
    End Sub
   
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'Me.Page.ClientScript.RegisterForEventValidation(Button1.UniqueID.ToString)
        'ClientScript.RegisterForEventValidation(TextBox1.ID)
        'Response.Redirect("Dashboard.aspx")
        If TextBox1.Text = "sagar@live.com" And TextBox2.Text = "sagar" Then
            Session("login") = "done"
            'MsgBox(Session.Item("login"))
            'Server.Transfer("Default.aspx")
            Response.Redirect("~/Default.aspx", True)

        Else
            Label1.Visible = True
            Label1.Text = "Please enter valid details !"
            'Page.ClientScript.RegisterStartupScript("scriptkey", "<script>alert('your message');</script>")
            'MsgBox("Enter valid details !")
            'Dim message As String = "Please enter valid details"
            'Dim sb As New System.Text.StringBuilder()
            'sb.Append("<script type = 'text/javascript'>")
            'sb.Append("window.onload=function(){")
            'sb.Append("alert('")
            'sb.Append(message)
            'sb.Append("')};")
            'sb.Append("</script>")
            'ClientScript.RegisterClientScriptBlock(Me.GetType(), "alert", sb.ToString())

        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'Me.Page.ClientScript.RegisterForEventValidation(Button1.UniqueID)
        If Session("login") = "done" Then
            Response.Redirect("~/Default.aspx", True)
        End If
    End Sub
End Class
