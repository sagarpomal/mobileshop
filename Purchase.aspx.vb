Imports Class1
Partial Class Purchase
    Inherits System.Web.UI.Page

    Public obj1 As New Class1

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        TextBox2.Text = Today
    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        TextBox2.Text = Calendar1.SelectedDate
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Calendar1.Visible = False Then
            Calendar1.Visible = True
        Else
            Calendar1.Visible = False
        End If
    End Sub

    Protected Sub p_add_stock_Click(sender As Object, e As EventArgs) Handles p_add_stock.Click
        System.Threading.Thread.Sleep(5000)
        Dim tot As Integer
        tot = p_cost_price.Text * p_quantity.Text

        obj1.adddata("insert into add_phone values('" & TextBox2.Text & "','" & p_type.Text & "','" & p_company.Text & "','" & p_supplier.Text & "','" & p_model_no.Text & "','" & p_quantity.Text & "','" & p_cost_price.Text & "', '" & tot & " ')")
        'MsgBox("Added")


        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Record Inserted Successfully')", True)

    End Sub
End Class
