
Partial Class Products_Suppliers_View
    Inherits System.Web.UI.Page
    Public OBJ1 As New Class1
    Public obj As System.Data.SqlClient.SqlDataReader

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        txt_company.Focus()

        Dim cp As ContentPlaceHolder = DirectCast(Me.Master.Master.FindControl("MainContent"), ContentPlaceHolder)
        ' ContentPlaceHolder cp = this.Master.Master.FindControl("MainContent") as ContentPlaceHolder;

        Dim li As System.Web.UI.HtmlControls.HtmlGenericControl

        li = cp.FindControl("id3")

        'li = Page.Master.FindControl("id4")

        li.Attributes.Add("class", "active")
        'MsgBox(Request.QueryString("CatID"))
        'Page.Validate()
        If Not Page.IsPostBack Then


            If Request.QueryString("CustID") <> "" Then
                obj = OBJ1.getdata("select * from customers where id='" & Request.QueryString("CustID") & "' ")
                While obj.Read
                    txt_company.Text = obj.Item("company")
                    txt_email.Text = obj.Item("emailaddress")
                    txt_phone.Text = obj.Item("mobilephone")
                    txt_customer.Text = obj.Item("customername")

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
            If Request.QueryString("CustID") <> "" Then
                'MsgBox(txt_category.Text)
                OBJ1.adddata("update customers set company='" & txt_company.Text & "', emailAddress='" & txt_email.Text & "', mobilephone='" & txt_phone.Text & "', customername='" & txt_customer.Text & "' where id='" & Request.QueryString("CustID") & "' ")
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Supplier Updated !')", True)
                If buttonId = "Button2" Then
                    Response.Redirect("~/Orders/Customer_List.aspx")
                ElseIf buttonId = "Button3" Then
                    'txt_category.Text = ""
                    txt_company.Text = ""
                    txt_email.Text = ""
                    txt_phone.Text = ""
                    txt_customer.Text = ""

                    Response.Redirect("~/Orders/Customer_Add.aspx")

                End If


            Else
                OBJ1.adddata("insert into customers(company, emailaddress, mobilephone, customername, companyID) values('" & txt_company.Text & "', '" & txt_email.Text & "', '" & txt_phone.Text & "', '" & txt_customer.Text & "', '" & Request.Cookies("CompanyId").Value & "') ")
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Category Updated !')", True)
                If buttonId = "Button2" Then
                    Response.Redirect("~/Orders/Customer_List.aspx")
                ElseIf buttonId = "Button3" Then
                    'txt_category.Text = ""
                    txt_company.Text = ""
                    txt_email.Text = ""
                    txt_phone.Text = ""
                    txt_customer.Text = ""

                    Response.Redirect("~/Orders/Customer_Add.aspx")

                End If
            End If


        End If
        'ksfdsaf()
    End Sub




    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete

    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("~/Orders/Customer_List.aspx")
    End Sub
End Class