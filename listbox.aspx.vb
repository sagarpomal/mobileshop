
Partial Class listbox
    Inherits System.Web.UI.Page

    Protected Sub txtProdottoLike_TextChanged(sender As Object, e As EventArgs) Handles txtProdottoLike.TextChanged


        ListBox1.Visible = True
        ListBox1.Items.Clear()
        'Dim OBJ1 As New Class1

        'Dim obj As Data.SqlClient.SqlDataReader
        'obj = OBJ1.getdata("SELECT DISTINCT COMPANY FROM add_phone where company like '%" & txtProdottoLike.Text & "%' ")

        'While (obj.Read)
        '    ListBox1.Items.Add(obj.Item(0))
        'End While

        'OBJ1.close_conn()
        'ListBox1.Rows = ListBox1.Items.Count + 1


        'ScriptManager1.SetFocus(TextBox1)
        'If ListBox1.Items.Count > 0 Then




        Dim OBJ1 As New Class1

        Dim obj As Data.SqlClient.SqlDataReader
        obj = OBJ1.getdata("SELECT DISTINCT COMPANY FROM add_phone where company like '%" & txtProdottoLike.Text & "%' ")

        Dim list1 As New List(Of String)()



        While (obj.Read)
            list1.Add(obj.Item(0))
            'str.SetValue(obj.Item(0))
            'ListBox1.Items.Add(obj.Item(0))
            'MsgBox(str.ToString)
        End While

        OBJ1.close_conn()
        'For Each i In list1
        '    MsgBox(i)
        'Next
        obj = OBJ1.getdata("SELECT * FROM search ")

        Dim list2 As New List(Of String)()



        While (obj.Read)
            list2.Add(obj.Item(1))
            'str.SetValue(obj.Item(0))
            'ListBox1.Items.Add(obj.Item(0))
            'MsgBox(str.ToString)
        End While

        OBJ1.close_conn()
        'For Each i In list2
        '    MsgBox(i)
        'Next

        Dim A1(), A2() As String
        A1 = list1.ToArray
        A2 = list2.ToArray
        'Dim list3 As New List(Of String)()
        'list1.Join(list2, )
        'list3 = list1.Concat(list2)
        'list3.AddRange(list1)
        'list3.AddRange(list2)
        ' ''For Each i In A1
        ' ''    MsgBox(i)
        ' ''Next
        Dim list3 As New List(Of String)
        Dim tem1 As String
        'For i = 0 To A1.Count
        '    For j = 0 To A2.Count
        '        tem1 = i.ToString + j.ToString
        '        list3.Add(tem1)
        '    Next
        'Next
        For Each i In A1
            For Each j In A2
                tem1 = i + " " + j
                list3.Add(tem1)
            Next
        Next

        For Each i In list3
            ListBox1.Items.Add(i)
        Next
        ListBox1.Rows = ListBox1.Items.Count + 1

    End Sub

    Protected Sub ListBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ListBox1.SelectedIndexChanged
        If ListBox1.SelectedItem.ToString <> "" Then

            txtProdottoLike.Text = ListBox1.SelectedItem.ToString

            'Conditional Update
            uplDetail.Update()
            ListBox1.Visible = False
        End If

    End Sub

    

    Protected Sub ListBox1_TextChanged(sender As Object, e As EventArgs) Handles ListBox1.TextChanged

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        txtProdottoLike.Focus()
        ListBox1.Visible = False
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim OBJ1 As New Class1

        Dim obj As Data.SqlClient.SqlDataReader
        obj = OBJ1.getdata("SELECT DISTINCT COMPANY FROM add_phone where company like '%" & TextBox1.Text & "%' ")

        Dim list1 As New List(Of String)()



        While (obj.Read)
            list1.Add(obj.Item(0))
            'str.SetValue(obj.Item(0))
            'ListBox1.Items.Add(obj.Item(0))
            'MsgBox(str.ToString)
        End While

        OBJ1.close_conn()
        'For Each i In list1
        '    MsgBox(i)
        'Next
        obj = OBJ1.getdata("SELECT * FROM search ")

        Dim list2 As New List(Of String)()



        While (obj.Read)
            list2.Add(obj.Item(1))
            'str.SetValue(obj.Item(0))
            'ListBox1.Items.Add(obj.Item(0))
            'MsgBox(str.ToString)
        End While

        OBJ1.close_conn()
        'For Each i In list2
        '    MsgBox(i)
        'Next

        Dim A1(), A2() As String
        A1 = list1.ToArray
        A2 = list2.ToArray
        'Dim list3 As New List(Of String)()
        'list1.Join(list2, )
        'list3 = list1.Concat(list2)
        'list3.AddRange(list1)
        'list3.AddRange(list2)
        ' ''For Each i In A1
        ' ''    MsgBox(i)
        ' ''Next
        Dim list3 As New List(Of String)
        Dim tem1 As String
        'For i = 0 To A1.Count
        '    For j = 0 To A2.Count
        '        tem1 = i.ToString + j.ToString
        '        list3.Add(tem1)
        '    Next
        'Next
        For Each i In A1
            For Each j In A2
                tem1 = i + " " + j
                list3.Add(tem1)
            Next
        Next

        'For Each i In list3
        Select1.DataSource = list3

        Select1.DataBind()
        ' Next



    End Sub
End Class
