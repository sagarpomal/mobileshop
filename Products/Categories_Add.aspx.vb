
Partial Class Products_Suppliers_View
    Inherits System.Web.UI.Page
    Public OBJ1 As New Class1
    Public obj As System.Data.SqlClient.SqlDataReader

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim cp As ContentPlaceHolder = DirectCast(Me.Master.Master.FindControl("MainContent"), ContentPlaceHolder)
        ' ContentPlaceHolder cp = this.Master.Master.FindControl("MainContent") as ContentPlaceHolder;

        Dim li As System.Web.UI.HtmlControls.HtmlGenericControl

        li = cp.FindControl("id3")

        'li = Page.Master.FindControl("id4")

        li.Attributes.Add("class", "active")
        'MsgBox(Request.QueryString("CatID"))
        'Page.Validate()
        If Not Page.IsPostBack Then


            If Request.QueryString("CatID") <> "" Then
                obj = OBJ1.getdata("select * from categories where id='" & Request.QueryString("CatID") & "' ")
                While obj.Read
                    txt_category.Text = obj.Item("category")

                End While
                OBJ1.close_conn()

            End If
        End If
    End Sub

   
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        System.Threading.Thread.Sleep(3000)
        Page.Validate()
        If Page.IsValid() Then
            If Request.QueryString("CatID") <> "" Then
                'MsgBox(txt_category.Text)
                OBJ1.adddata("update categories set category='" & txt_category.Text & "' where id='" & Request.QueryString("CatID") & "' ")
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Category Updated !')", True)
                Response.Redirect("~/Products/Category_List.aspx")
            Else
                OBJ1.adddata("insert into categories values('" & txt_category.Text & "', '" & Request.Cookies("CompanyID").Value & "') ")
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Category Updated !')", True)
                Response.Redirect("~/Products/Category_List.aspx")
            End If

            
        End If
        'ksfdsaf()
    End Sub

    
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("~/Products/Category_List.aspx")
    End Sub
End Class
