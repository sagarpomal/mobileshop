
Partial Class MasterPage_Tabs
    Inherits System.Web.UI.MasterPage
    

    

    Protected Sub lk_Products_Click(sender As Object, e As EventArgs) Handles lk_Products.Click
        Me.id1.Attributes("class") = "active"
        'Me.id2.Attributes("class") = ""
        Me.id3.Attributes("class") = ""
        Me.id4.Attributes("class") = ""


    End Sub

   

    Protected Sub lk_Categories_Click(sender As Object, e As EventArgs) Handles lk_Categories.Click
        Me.id1.Attributes("class") = ""
        'Me.id2.Attributes("class") = ""
        Me.id3.Attributes("class") = "active"
        Me.id4.Attributes("class") = ""
    End Sub

    Protected Sub lk_Suppliers_Click(sender As Object, e As EventArgs) Handles lk_Suppliers.Click

        Me.id1.Attributes("class") = ""
        ' Me.id2.Attributes("class") = ""
        Me.id3.Attributes("class") = ""
        Me.id4.Attributes("class") = "active"
    End Sub
End Class

