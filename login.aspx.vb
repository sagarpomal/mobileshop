
Partial Class login
    Inherits System.Web.UI.Page
    Dim obj1 As New Class1
   
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

        'For Each aControl As Control In Me.Controls
        Me.Page.ClientScript.RegisterForEventValidation(Button1.UniqueID)
        ' Next aControl

        MyBase.Render(writer)
    End Sub
   
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Me.Page.ClientScript.RegisterForEventValidation(Button1.UniqueID.ToString)
        ClientScript.RegisterForEventValidation(txt_username.ID)


        Dim obj As System.Data.SqlClient.SqlDataReader
        obj = obj1.getdata("select * from auth_user where username = '" & txt_username.Text & "' and password = '" & txt_password.Text & "' ")
        

        If obj.HasRows Then
            While obj.Read
                obj1.CompanyID = obj.Item("company_id")
                obj1.username = obj.Item("username")
                'MsgBox(obj1.username)
            End While

            'If chkRememberME.Checked Then
            Response.Cookies("UserName").Expires = DateTime.Now.AddDays(30)
            'Response.Cookies("Password").Expires = DateTime.Now.AddDays(30)
            'Else
            'Response.Cookies("UserName").Expires = DateTime.Now.AddDays(-1)
            'Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
            'End If
            Response.Cookies("UserName").Value = txt_username.Text.Trim
            'Response.Cookies("Password").Value = txt_password.Text.Trim

            Response.Redirect("/Purchase.aspx")






        Else
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Invalid Login Credentials !')", True)

        End If


        'Response.Redirect("Dashboard.aspx")
        'If TextBox1.Text = "sagar@live.com" And TextBox2.Text = "sagar" Then
        '    Session("login") = "done"
        '    'MsgBox(Session.Item("login"))
        '    'Server.Transfer("Default.aspx")
        '    Response.Redirect("~/Default.aspx", True)

        'Else
        '    Label1.Visible = True
        '    Label1.Text = "Please enter valid details !"
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

        'End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'Me.Page.ClientScript.RegisterForEventValidation(Button1.UniqueID)
        'If Not IsPostBack Then
        'If ((Not (Request.Cookies("UserName")) Is Nothing) _
        '            AndAlso (Not (Request.Cookies("Password")) Is Nothing)) Then
        '    Response.Redirect("/Purchase.aspx")
        'End If
        If Not IsPostBack Then
            If ((Not (Request.Cookies("UserName")) Is Nothing)) Then
                ' MsgBox(Request.Cookies("UserName").Value)
                'MsgBox(obj1.username)

                Response.Redirect("/Purchase.aspx")

            End If
        End If

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("/Register.aspx")
    End Sub
End Class
