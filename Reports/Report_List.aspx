<%@ Page Title="" Language="VB" MasterPageFile="~/Reports/MasterPage_Reports.master" AutoEventWireup="false" CodeFile="Report_List.aspx.vb" Inherits="Products_Supplier_List" %>
<%@ MasterType VirtualPath="~/Reports/MasterPage_Reports.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

     
    
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>




    <br />
    <div class="row">
        <div class="col-lg-6">
    <h3>Sales Report</h3>
    <br />
    
    </div>
    </div>
    

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>



    <asp:GridView ID="GridView1" runat="server"  class="table" CellPadding="4"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#333333" />
        <%--#284775--%>
        

        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" Visible="False" />
            <asp:BoundField DataField="ProductName" HeaderText="Produc Name" SortExpression="ProductName" />
            <asp:BoundField DataField="Expr1" HeaderText="Quantity Sold" ReadOnly="True" SortExpression="Expr1" />
        </Columns>
        

        <EditRowStyle BackColor="#999999" />

        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#30426a" ForeColor="White" Font-Size="Small" Font-Bold="false" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

</asp:GridView>
    

        
    

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT OrderDetails.ProductID, SUM(OrderDetails.Quantity) AS Expr1, Products.ProductName FROM OrderDetails INNER JOIN Products ON OrderDetails.ProductID = Products.ID GROUP BY OrderDetails.ProductID, Products.ProductName"></asp:SqlDataSource>
    

        
    

<%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT Products.ProductCode, Products.ProductName, Products.StandardCost, Products.Description, Products.ID AS Expr2, Products.ListPrice, Products.CategoryID, Products.SupplierID, Categories.ID AS Expr1, Categories.Category, Categories.CompanyID AS Expr3, Suppliers.ID, Suppliers.SupplierName, Suppliers.CompanyID, Suppliers.ID AS Expr4, Products.CompanyID AS Expr6 FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.ID INNER JOIN Suppliers ON Products.SupplierID = Suppliers.ID"></asp:SqlDataSource>--%>
    
<%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT Products.ProductCode, Products.ProductName, Products.StandardCost, Products.Description, Products.ID AS Expr2, Products.ListPrice, Products.CategoryID, Products.SupplierID, Categories.ID AS Expr1, Categories.Category, Categories.CompanyID AS Expr3, Suppliers.ID, Suppliers.SupplierName, Suppliers.CompanyID, Suppliers.ID AS Expr4, Products.CompanyID AS Expr6 FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.ID AND Products.CompanyID = (@CompanyID) INNER JOIN Suppliers ON Products.SupplierID = Suppliers.ID" >
    <SelectParameters>
        <asp:CookieParameter CookieName="CompanyID" Name="CompanyID" Type="Int32" />
        
    </SelectParameters>
    </asp:SqlDataSource>--%>




         </ContentTemplate>
        
                                  </asp:UpdatePanel>

                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="UpdatePanel1" >

                                        <ProgressTemplate>
                                            <div style="background-color: white; filter:alpha(opacity=60); opacity:0.60; width: 100%; top: 0px; left: 0px; position: fixed; height: 100%;">
        </div>
          <div style="margin:auto;
              font-family:Trebuchet MS;
              filter: alpha(opacity=100);
              opacity: 1;
              font-size:small;
              vertical-align: middle;
              top: 45%;
              position: fixed;
              right: 45%;
              color: #2f302f;
              text-align: center;
              
              height: 100px;
              ">
                <img src="/img/poi.gif" alt="Loading"  />
                
                
        
                                        </ProgressTemplate>
                                            
                                        </asp:UpdateProgress>




</asp:Content>


