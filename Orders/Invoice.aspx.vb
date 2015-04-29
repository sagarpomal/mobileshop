Imports Microsoft.Reporting.WebForms

Partial Class Orders_Invoice
    Inherits System.Web.UI.Page
    Public obj1 As New Class1

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'obj1.gridbind("SELECT dbo.OrderDetails.ID, dbo.OrderDetails.OrderID, dbo.OrderDetails.ProductID, dbo.OrderDetails.Quantity, dbo.OrderDetails.UnitPrice, dbo.OrderDetails.Discount, dbo.OrderDetails.CompanyID, dbo.OrderDetails.Total_Price, dbo.Orders.ID AS Expr1, dbo.Orders.OrderDate, dbo.Orders.OrderSubTotal, dbo.Orders.OrderTotal, dbo.Orders.CompanyID AS Expr2, dbo.Orders.CustomerID, dbo.Customers.ID AS Expr3, dbo.Customers.CustomerName, dbo.Customers.CompanyID AS Expr4, dbo.Products.ID AS Expr5, dbo.Products.ProductName, dbo.Products.CompanyID AS Expr6 FROM dbo.OrderDetails INNER JOIN dbo.Orders ON dbo.OrderDetails.OrderID = dbo.Orders.ID INNER JOIN dbo.Products ON dbo.OrderDetails.ProductID = dbo.Products.ID INNER JOIN dbo.Customers ON dbo.OrderDetails.ID = dbo.Customers.ID  ")
            obj1.gridbind("Select * FROM   [OrderDetails] INNER JOIN Orders ON [OrderDetails].OrderID = Orders.ID and Orders.ID = '" & Request.QueryString("OrderID") & "' INNER JOIN dbo.Products ON OrderDetails.ProductID = Products.ID   ")
            ReportViewer1.ProcessingMode = ProcessingMode.Local
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Orders/Invoice_Date.rdlc")
            'Dim dsCustomers As Customers = GetData("select top 20 * from customers")
            Dim datasource As New ReportDataSource("ds", obj1.ds.Tables(0))
            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
            ReportViewer1.LocalReport.Refresh()



            'MsgBox(ORDER_ID)
            'Dim binds1 As New BindingSource(ds, "In")
            'Dim DSReport As New ReportDataSource()
            'DSReport.Name = "ds"
            'DSReport.Value = binds1

            'Me.ReportViewer1.LocalReport.ReportEmbeddedResource = "Anuj_Stationars.Retail_Invoice.rdlc"


            'Me.ReportViewer1.LocalReport.DataSources.Clear()
            'Me.ReportViewer1.LocalReport.DataSources.Add(DSReport)

            'Me.ReportViewer1.LocalReport.Refresh()

        End If
    End Sub
End Class
