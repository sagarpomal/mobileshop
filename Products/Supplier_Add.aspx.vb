
Partial Class Products_Suppliers_View
    Inherits System.Web.UI.Page
    Public OBJ1 As New Class1
    Public obj As System.Data.SqlClient.SqlDataReader

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        txt_company.Focus()

        Dim cp As ContentPlaceHolder = DirectCast(Me.Master.Master.FindControl("MainContent"), ContentPlaceHolder)
        ' ContentPlaceHolder cp = this.Master.Master.FindControl("MainContent") as ContentPlaceHolder;

        Dim li As System.Web.UI.HtmlControls.HtmlGenericControl

        li = cp.FindControl("id4")

        'li = Page.Master.FindControl("id4")

        li.Attributes.Add("class", "active")
        'MsgBox(Request.QueryString("CatID"))
        'Page.Validate()
        If Not Page.IsPostBack Then


            If Request.QueryString("SupID") <> "" Then
                obj = OBJ1.getdata("select * from suppliers where id='" & Request.QueryString("SupID") & "' ")
                While obj.Read
                    txt_company.Text = obj.Item("company")
                    txt_email.Text = obj.Item("emailaddress")
                    txt_phone.Text = obj.Item("mobilephone")
                    txt_supplier.Text = obj.Item("suppliername")

                End While
                OBJ1.close_conn()

            End If
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click, Button3.Click

        Dim button As Button = DirectCast(sender, Button)
        Dim buttonId As String = button.ID
        System.Threading.Thread.Sleep(3000)
        Page.Validate()
        If Page.IsValid() Then
            If Request.QueryString("SupID") <> "" Then
                'MsgBox(txt_category.Text)
                OBJ1.adddata("update suppliers set company='" & txt_company.Text & "', emailAddress='" & txt_email.Text & "', mobilephone='" & txt_phone.Text & "', Suppliername='" & txt_supplier.Text & "' where id='" & Request.QueryString("SupID") & "' ")
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Supplier Updated !')", True)
                If buttonId = "Button2" Then
                    Response.Redirect("~/Products/Supplier_List.aspx")
                ElseIf buttonId = "Button3" Then
                    'txt_category.Text = ""
                    txt_company.Text = ""
                    txt_email.Text = ""
                    txt_phone.Text = ""
                    txt_supplier.Text = ""

                    Response.Redirect("~/Products/Supplier_Add.aspx")

                End If


            Else
                OBJ1.adddata("insert into suppliers(company, emailaddress, mobilephone, suppliername, companyID) values('" & txt_company.Text & "', '" & txt_email.Text & "', '" & txt_phone.Text & "', '" & txt_supplier.Text & "', '" & Request.Cookies("CompanyId").Value & "') ")
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Category Updated !')", True)
                If buttonId = "Button2" Then
                    Response.Redirect("~/Products/Supplier_List.aspx")
                ElseIf buttonId = "Button3" Then
                    'txt_category.Text = ""
                    txt_company.Text = ""
                    txt_email.Text = ""
                    txt_phone.Text = ""
                    txt_supplier.Text = ""

                    Response.Redirect("~/Products/Supplier_Add.aspx")

                End If
            End If


        End If
        'ksfdsaf()
    End Sub




    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete

    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("~/Products/Supplier_List.aspx")
    End Sub
End Class