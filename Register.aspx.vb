
Partial Class login
    Inherits System.Web.UI.Page

    Public obj1 As New Class1
    Dim obj As Data.SqlClient.SqlDataReader
    

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("/Login.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        System.Threading.Thread.Sleep(5000)
        If Label1.Text = "User Available" Then


            obj1.adddata("insert into Company(company, businessphone, email) values('" & txt_company.Text & "','" & txt_phone.Text & "','" & txt_email.Text & "') ")
            'MsgBox("Added")
            obj = obj1.getdata("SELECT TOP 1 * FROM Company ORDER BY ID DESC")
            Dim id As Integer
            While obj.Read()
                id = obj.Item(0)
            End While
            obj1.close_conn()

            obj1.adddata("insert into auth_user (Company_id, username, password) values('" & id & "', '" & txt_username.Text & "', '" & txt_password.Text & "') ")



            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('You have been Registerd Successfully')", True)
            Response.Redirect("/login.aspx")
        End If
    End Sub

    Protected Sub txt_username_TextChanged(sender As Object, e As EventArgs) Handles txt_username.TextChanged
        'If txt_username.Text <> String.Empty Then
        RequiredFieldValidator2.Validate()
        If RequiredFieldValidator2.IsValid = True Then
            If Not String.IsNullOrEmpty(txt_username.Text) Then
                If Not String.IsNullOrWhiteSpace(txt_username.Text) Then

                    obj = obj1.getdata("select username from auth_user where username = '" & txt_username.Text & "' ")
                    If obj.HasRows Then
                        Label1.Visible = True
                        Label1.ForeColor = Drawing.Color.Red
                        Label1.Text = "User name not available"
                        txt_username.Focus()
                    Else
                        Label1.Visible = True
                        Label1.ForeColor = Drawing.Color.Green
                        Label1.Text = "User Available"
                        txt_password.Focus()
                    End If
                Else
                    Label1.Visible = False
                End If
            Else
                Label1.Visible = False
            End If
            'Label1.Visible = False
        End If
    End Sub
End Class
