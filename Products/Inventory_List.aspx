<%@ Page Title="" Language="VB" MasterPageFile="~/Products/MasterPage_Products.master" AutoEventWireup="false" CodeFile="Inventory_List.aspx.vb" Inherits="Products_Supplier_List" %>
<%@ MasterType VirtualPath="~/Products/MasterPage_products.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

     <script type="text/javascript">
    function RefreshUpdatePanel() {
        __doPostBack('<%= TextBox1.ClientID%>', '');
    };
    </script>
    
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>




    <br />
    <div class="row">
        <div class="col-lg-6">
    <div class="btn-group" role="group" >
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Add New Product" class="btn btn-default" />
    </div>
    <br />
    <br />
    
    </div>
    </div>
    <div class="form-group">
    <asp:TextBox ID="TextBox1" onkeyup="RefreshUpdatePanel();" runat="server" class="form-control" placeholder="    Search here for Products"></asp:TextBox>
    </div>  


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>



    <asp:GridView ID="GridView1" runat="server"  class="table" CellPadding="4"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Expr2,ID,Expr1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#333333" />
        <%--#284775--%>
        <Columns>

            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="StandardCost" HeaderText="StandardCost" SortExpression="StandardCost" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" Visible="False" />
            <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" InsertVisible="False" ReadOnly="True" />
            
            <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" Visible="False" />
            <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" SortExpression="SupplierID" Visible="False" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" SortExpression="SupplierName" />
            <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" Visible="False" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" Visible="False" />
            <asp:BoundField DataField="Available" HeaderText="Available" SortExpression="Available" />
            <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" Visible="False" />
            <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" SortExpression="ReorderLevel" />
            <asp:BoundField DataField="Expr3" HeaderText="Expr3" SortExpression="Expr3" Visible="False" />
            
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
    

<%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT Products.ProductCode, Products.ProductName, Products.StandardCost, Products.Description, Products.ID AS Expr2, Products.ListPrice, Products.CategoryID, Products.SupplierID, Categories.ID AS Expr1, Categories.Category, Categories.CompanyID AS Expr3, Suppliers.ID, Suppliers.SupplierName, Suppliers.CompanyID, Suppliers.ID AS Expr4, Products.CompanyID AS Expr6 FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.ID INNER JOIN Suppliers ON Products.SupplierID = Suppliers.ID"></asp:SqlDataSource>--%>
    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT Products.ProductCode, Products.ProductName, Products.StandardCost, Products.Description, Products.ID AS Expr2, Products.ListPrice, Products.CategoryID, Products.SupplierID, Products.CompanyID AS Expr6, Suppliers.ID, Suppliers.SupplierName, Inventory.ID AS Expr1, Inventory.ProductID, Inventory.Available, Inventory.CompanyID, Inventory.ReorderLevel, Suppliers.CompanyID AS Expr3 FROM Products INNER JOIN Inventory ON Products.ID = Inventory.ProductID AND Products.CompanyID = (@CompanyID) INNER JOIN Suppliers ON Products.SupplierID = Suppliers.ID" >
     <SelectParameters>
        <asp:CookieParameter CookieName="CompanyID" Name="CompanyID" Type="Int32" />
        
    </SelectParameters>

</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT Products.ProductCode, Products.ProductName, Products.StandardCost, Products.Description, Products.ID AS Expr2, Products.ListPrice, Products.CategoryID, Products.SupplierID, Products.CompanyID AS Expr6, Suppliers.ID, Suppliers.SupplierName, Inventory.ID AS Expr1, Inventory.ProductID, Inventory.Available, Inventory.CompanyID, Inventory.ReorderLevel, Suppliers.CompanyID AS Expr3 FROM Products INNER JOIN Inventory ON Products.ID = Inventory.ProductID AND Products.CompanyID = (@CompanyID) AND Products.ProductName LIKE '%' + @ProductName + '%' INNER JOIN Suppliers ON Products.SupplierID = Suppliers.ID" >
     <SelectParameters>
        <asp:CookieParameter CookieName="CompanyID" Name="CompanyID" Type="Int32" />
        <asp:ControlParameter ControlID="TextBox1" Name="ProductName" PropertyName="Text" Type="String" />
    </SelectParameters>

</asp:SqlDataSource>


         </ContentTemplate>
         <Triggers>
            <asp:AsyncPostBackTrigger ControlID="TextBox1" />
        </Triggers>
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


