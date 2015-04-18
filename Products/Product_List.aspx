<%@ Page Title="" Language="VB" MasterPageFile="~/Products/MasterPage_Products.master" AutoEventWireup="false" CodeFile="Product_List.aspx.vb" Inherits="Products_Supplier_List" %>
<%@ MasterType VirtualPath="~/Products/MasterPage_products.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">
    <br />
    <div class="row">
        <div class="col-lg-6">
    <div class="btn-group" role="group" >
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Add New Product" class="btn btn-default" />
    </div>
    <br />
    <br />
    <div class="form-group">
    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Search here for Products"></asp:TextBox>
    </div>
    </div>
    </div>
         

    <asp:GridView ID="GridView1" runat="server"  class="table" CellPadding="4"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ID" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#333333" />
        <%--#284775--%>
        <Columns>
            <asp:HyperLinkField DataTextField="ID" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Products/Products_add.aspx?Id={0}"
            HeaderText="" ItemStyle-Width = "150" DataTextFormatString="View" >
<ItemStyle Width="70px"></ItemStyle>
            </asp:HyperLinkField>
            <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="StandardCost" HeaderText="StandardCost" SortExpression="StandardCost" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
            
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
    

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT [ProductCode], [ProductName], [StandardCost], [Description], [ID] FROM [Products]"></asp:SqlDataSource>
    

</asp:Content>


