<%@ Page Title="" Language="VB" MasterPageFile="~/Products/MasterPage_Products.master" AutoEventWireup="false" CodeFile="Purchase_Add.aspx.vb" Inherits="Products_Suppliers_View" %>

<asp:Content  ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">






   <asp:ScriptManager ID="scriptmanager1" runat="server"></asp:ScriptManager>
    <br />
    <div class="row">
        <%--<div class="col-xs-10">--%>
        <%--<div class="col-lg-6">--%>
            <div class="btn-group" role="group" >
      <asp:Button ID="Button1"  runat="server" Text="< Back to Products" class="btn btn-default" CausesValidation="false"/>
    </div>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
   
    <div class="panel panel-default">
  <div class="panel-heading"><h4>Purchase Details </h4></div>
  <div class="panel-body">
                            <div class="col-xs-3">
                                <div class="form-group">
                                            <asp:Label ID="Label4" runat="server" Text="Date" Font-Bold="True" Font-Size="Small"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select Date" ControlToValidate="txt_date" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            <asp:TextBox class="form-control" ID="txt_date" runat="server" ReadOnly="True"></asp:TextBox>
                                            
                                        </div>                                                           
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                            <NextPrevStyle VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#808080" />
                                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                            <SelectorStyle BackColor="#CCCCCC" />
                                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <WeekendDayStyle BackColor="#FFFFCC" />
                                        </asp:Calendar>
                                </div>
                                <div class="col-xs-3">
                                <div class="form-group">
                                    <br />
                                    <asp:Button ID="Button4" class="btn btn-default" runat="server" Text="Date Picker"  CausesValidation="false"/>
                                </div>
                                 </div>
                            
                            
                            <div class="col-xs-4">   
                                
                                <div class="form-group">  
                                    <asp:Label ID="Label7" runat="server" Text="Supplier" Font-Size="Medium" ></asp:Label>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Select" ControlToValidate="cb_supplier" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList AutoPostBack="true" ID="cb_supplier" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="SupplierName" DataValueField="ID"></asp:DropDownList>            
                                    
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT [ID], [CompanyID], [SupplierName] FROM [Suppliers] WHERE ([CompanyID] = @CompanyID)">
                                        <SelectParameters>
                                            <asp:CookieParameter CookieName="CompanyID" Name="CompanyID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    
                                </div>
                            </div>

                </div>
            </div>           
        </div>

        </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>


<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
   <ContentTemplate>
<%--<div class="panel">--%>
  <div class="panel-body">



                            <div class="col-xs-4">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Product Name" Font-Size="Medium" ></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Selecyt This" ControlToValidate="cb_product_name" ForeColor="Red" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>                                    
                                    
                                    <asp:DropDownList ID="cb_product_name" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="ProductName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MobileConnectionString %>" SelectCommand="SELECT [ID], [ProductName], [CompanyID], [SupplierID] FROM [Products] WHERE (([CompanyID] = @CompanyID) AND ([SupplierID] = @SupplierID))">
                                        <SelectParameters>
                                            <asp:CookieParameter CookieName="CompanyID" Name="CompanyID" Type="Int32" />
                                            <asp:ControlParameter ControlID="cb_supplier" Name="SupplierID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                </div>
                            
                            
                            <div class="col-xs-2">   
                                
                                <div class="form-group">  
                                    <asp:Label ID="Label3" runat="server" Text="Quantity" Font-Size="Medium" ></asp:Label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt_qty" ErrorMessage="Only Numbers" ForeColor="Red" Display="Dynamic" ValidationExpression="^\d*$"></asp:RegularExpressionValidator>
                                    <asp:RangeValidator id="RangeValidator1" ControlToValidate="txt_qty" MinimumValue="1" MaximumValue="2147483647" Type="Integer" ErrorMessage="more than 0" runat="server" ForeColor="Red" Display="Dynamic"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Fill This" ControlToValidate="txt_qty" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                               
                                            
                                    <asp:TextBox ID="txt_qty" class="form-control" runat="server" placeholder="Quantity" ></asp:TextBox>                               
                                </div>
                            </div>
                            <div class="col-xs-2">   
                                
                                <div class="form-group">  
                                    <asp:Label ID="Label1" runat="server" Text="Unit Cost" Font-Size="Medium" ></asp:Label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_unit_cost" ErrorMessage="Only Numbers" ForeColor="Red" Display="Dynamic" ValidationExpression="^\d*\.?\d*$"></asp:RegularExpressionValidator>
                                    <asp:RangeValidator id="RangeValidator2" ControlToValidate="txt_unit_cost" MinimumValue="1" MaximumValue="2147483647" Type="Double" ErrorMessage="more than 0" runat="server" ForeColor="Red" Display="Dynamic"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Fill This" ControlToValidate="txt_unit_cost" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                               
                                            
                                    <asp:TextBox ID="txt_unit_cost"  class="form-control" runat="server" placeholder="Unit Cost" ></asp:TextBox>                               
                                </div>
                            </div>
                           
                            <div class="col-xs-2">
                                <div class="form-group">  
                                    <br />
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="Button2" runat="server" class="btn btn-default" Text=" Add To Products  "  />
                                </div>
                            </div>
                            <%--<div class="col-xs-2">   
                                
                                <div class="form-group">  
                                    <asp:Label ID="Label5" runat="server" Text="Total Price" Font-Size="Medium" ></asp:Label>
                                    --%>
                                            
                                    <asp:TextBox Visible="false" ID="txt_total_price" class="form-control" runat="server"  ReadOnly="false"></asp:TextBox>                               
                                <%--</div>
                            </div>--%>

      
  </div>
    
</div>   
        <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False">

            <Columns>
                <asp:BoundField DataField="product_id" HeaderText="Product Code">
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                <asp:BoundField DataField="qty" HeaderText="Quantity" />
                <asp:BoundField DataField="cost_price" HeaderText="Cost Price" />
                <asp:BoundField DataField="total" HeaderText="Total" />
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
    
       
        </div>

       
    </div>
       


                            <div class="col-xs-2">
                                <div class="form-group">  
                                    <br />
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="Button3" runat="server" class="btn btn-default" Text="Place Order"  />
                                <asp:Button ID="Button5" runat="server" class="btn btn-default" Text="Place Order and Add Another"  />
                                </div>
                            </div>







        </ContentTemplate>

         <Triggers>
     <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
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
        <script type="text/javascript" src="/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>

</asp:Content>

