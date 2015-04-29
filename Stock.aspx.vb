Imports Class1
Partial Class Stock

    Inherits System.Web.UI.Page
    Public obj1 As New Class1
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub txtCountry_TextChanged(sender As Object, e As EventArgs) Handles txtCountry.TextChanged
        System.Threading.Thread.Sleep(5000)
        obj1.gridbind("select * from products where productname like '%" & txtCountry.Text & "%'")

        Dim dt As System.Data.DataTable
        dt = obj1.ds.Tables("In")
        GridView2.DataSource = dt
        GridView2.DataBind()
    End Sub
End Class
