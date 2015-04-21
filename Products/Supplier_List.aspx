<%@ Page Title="" Language="VB" MasterPageFile="~/Products/MasterPage_Products.master" AutoEventWireup="false" CodeFile="Supplier_List.aspx.vb" Inherits="Products_Supplier_List" %>
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
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Add New Supplier" class="btn btn-default" />
    </div>
    <br />
    <br />
    
    </div>
    </div>
    <div class="form-group">
    <asp:TextBox ID="TextBox1" runat="server" onkeyup="RefreshUpdatePanel();" class="form-control" placeholder="    Search here for Suppliers" AutoPostBack="true"></asp:TextBox>
    </div>
         

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <asp:GridView ID="GridView1" runat="server"  class="table" CellPadding="4"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ID" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#333333" />
        <%--#284775--%>
        <Columns>
            <asp:HyperLinkField DataTextField="ID" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/Products/Supplier_Add.aspx?SupId={0}"
            HeaderText="" ItemStyle-Width = "150" DataTextFormatString="View" >
            <ItemStyle Width="70px"></ItemStyle>
            </asp:HyperLinkField>

            <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" SortExpression="SupplierName" />
            
            <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
            <asp:BoundField DataField="MobilePhone" HeaderText="MobilePhone" SortExpression="MobilePhone" />
            
            <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" Visible="False" />
            
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="False" />
            
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
    

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT [ID], [Company], [EmailAddress], [CompanyID], [MobilePhone], [Address], [SupplierName] FROM [Suppliers] WHERE ([CompanyID] = @CompanyID)">
    <SelectParameters>
        <asp:CookieParameter CookieName="CompanyID" Name="CompanyID" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT [ID], [Company], [EmailAddress], [MobilePhone], [Address], [SupplierName] FROM [Suppliers] WHERE (([CompanyID] = @CompanyID) AND ([SupplierName] LIKE '%' + @SupplierName + '%'))">
    <SelectParameters>
        <asp:CookieParameter CookieName="CompanyID" Name="CompanyID" Type="Int32" />
        <asp:ControlParameter ControlID="TextBox1" Name="SupplierName" PropertyName="Text" Type="String" />
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


