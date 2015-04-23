Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class Class1
    Private conn As New SqlConnection
    Private cmd As New SqlCommand
    Private obj As SqlDataReader
    Public da As New SqlDataAdapter
    Public ds As New DataSet
    Public CompanyID As Integer
    Public username As String
    'Public fl As Double = 1
    'Public y As Double = 1

    'Public conn_str As String = "Data Source=WIN-52CLC5SG777;Initial Catalog=D:\MOBILE_SHOP.MDF;Integrated Security=True"
    Public conn_str As String = "Data Source=SAGAR-PC;Initial Catalog=Mobile;Integrated Security=True"



    Public Sub close_conn()
        conn.Close()
    End Sub

    Public Function getdata(ByVal str As String) As SqlDataReader

        conn.ConnectionString = conn_str
        conn.Open()
        cmd.Connection = conn
        cmd.CommandText = str
        obj = cmd.ExecuteReader
        Return obj
    End Function

    Public Sub adddata(ByVal str As String)
        conn.ConnectionString = conn_str
        conn.Open()
        cmd.Connection = conn
        cmd.CommandText = str
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub
    Public Sub gridbind(ByVal str As String)
        conn.ConnectionString = conn_str

        conn.Open()
        Dim ds1 As New DataSet
        da.SelectCommand = New SqlCommand
        da.SelectCommand.Connection = conn
        da.SelectCommand.CommandText = str
        da.SelectCommand.ExecuteReader()
        conn.Close()
        da.Fill(ds1, "In")
        ds = ds1
    End Sub
End Class
