Imports Class1
Partial Class Sales
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        '' ListBox1.Items.Clear()
        'Dim OBJ1 As New Class1

        'Dim obj As Data.SqlClient.SqlDataReader
        'obj = OBJ1.getdata("SELECT DISTINCT COMPANY FROM add_phone where company like '%" & TextBox1.Text & "%' ")

        'While (obj.Read)
        '    ListBox1.Items.Add(obj.Item(0))
        'End While

    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged
        ListBox1.Items.Clear()
        Dim OBJ1 As New Class1

        Dim obj As Data.SqlClient.SqlDataReader
        obj = OBJ1.getdata("SELECT DISTINCT category FROM categories where category like '%" & TextBox1.Text & "%' ")

        While (obj.Read)
            ListBox1.Items.Add(obj.Item(0))
        End While

        OBJ1.close_conn()
        ScriptManager1.SetFocus(TextBox1)



    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        TextBox1.Focus()
        'TextBox1.Attributes.Add("onfocus", "javascript:setSelectionRange('" + "','')")
        'TextBox1.Attributes.Add("onfocus", "javascript:SetCursorToTextEnd()")



        'TextBox1.Text = "Dada"

    End Sub
End Class
