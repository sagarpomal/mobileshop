Imports System
Imports System.Collections
Imports System.Linq
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Xml.Linq
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
' (c) Copyright Microsoft Corporation.
' This source is subject to the Microsoft Public License.
' See http://www.microsoft.com/opensource/licenses.mspx#Ms-PL.
' All other rights reserved.
'*-------------------------------*
'*                               *
'*      Mahsa Hassankashi        *
'*     info@mahsakashi.com       *
'*   http://www.mahsakashi.com   * 
'*     kashi_mahsa@yahoo.com     * 
'*                               *
'*                               *
'*-------------------------------*
' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
Public Class AutoComplete
    Inherits System.Web.Services.WebService
    Dim cn As New SqlClient.SqlConnection()
    Dim ds As New DataSet
    Dim dt As New DataTable
    <WebMethod()> _
    Public Function GetCompletionList(ByVal prefixText As String, ByVal count As Integer) As String()

        'ADO.Net
        Dim strCn As String = "Data Source=WIN-52CLC5SG777;Initial Catalog=D:\MOBILE_SHOP.MDF;Integrated Security=True"
        cn.ConnectionString = strCn
        Dim cmd As New SqlClient.SqlCommand
        cmd.Connection = cn
        cmd.CommandType = CommandType.Text
        'Compare String From Textbox(prefixText) AND String From Column in DataBase(CompanyName)
        'If String from DataBase is equal to String from TextBox(prefixText) then add it to return ItemList
        '-----I Defined a parameter instead of passing value directly to prevent sql injection--------'
        cmd.CommandText = "select DISTINCT company from add_phone where company like @myParameter"
        cmd.Parameters.AddWithValue("@myParameter", "%" + prefixText + "%")

        Try
            cn.Open()
            cmd.ExecuteNonQuery()
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(ds)
        Catch ex As Exception
        Finally
            cn.Close()
        End Try

        dt = ds.Tables(0)


        'Then return List of string(txtItems) as result
        Dim txtItems As New List(Of String)
        Dim dbValues As String

        For Each row As DataRow In dt.Rows
            ''String From DataBase(dbValues)
            dbValues = row("company").ToString()
            dbValues = dbValues.ToLower()
            txtItems.Add(dbValues)
        Next

        Return txtItems.ToArray()

    End Function

End Class
