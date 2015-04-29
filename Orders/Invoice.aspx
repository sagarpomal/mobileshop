<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Invoice.aspx.vb" Inherits="Orders_Invoice" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="635px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="753px" PromptAreaCollapsed="True" SizeToReportContent="True">
            <%--<LocalReport ReportPath="Orders\Invoice_Date.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="ds" />
                </DataSources>
            </LocalReport>--%>
        </rsweb:ReportViewer>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT * FROM [Invoice_Date]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
