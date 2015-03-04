<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Purchase.aspx.vb" Inherits="Purchase" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <br />
    <asp:Label ID="Label1" runat="server" Text="Enter Stock" Font-Bold="True" Font-Size="Large"></asp:Label>
    <br />
<div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form">
                                        <div class="form-group">
                                                                                       
                                        </div>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                             <ContentTemplate>
                                                 
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="Supplier" Font-Bold="True" Font-Size="Small"></asp:Label>
                                            <asp:DropDownList ID="p_supplier" class="form-control" runat="server">
                                                <asp:ListItem>Mobile Supplier 1</asp:ListItem>
                                                <asp:ListItem>Mobile Supplier 2</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label5" runat="server" Text="Select Phone Type" Font-Bold="True" Font-Size="Small"></asp:Label>
                                            <asp:DropDownList ID="p_type" class="form-control" runat="server">
                                                <asp:ListItem>New</asp:ListItem>
                                                <asp:ListItem>Second</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Label6" runat="server" Text="Company" Font-Bold="True" Font-Size="Small"></asp:Label>
                                            <asp:DropDownList ID="p_company" class="form-control" runat="server">
                                                <asp:ListItem>Microsoft</asp:ListItem>
                                                <asp:ListItem>Apple</asp:ListItem>
                                                <asp:ListItem>Nokia</asp:ListItem>
                                                <asp:ListItem>Motorola</asp:ListItem>
                                                <asp:ListItem>Samsung</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                         <div class="form-group">
                                            <asp:Label ID="Label7" runat="server" Text="Model No." Font-Bold="True" Font-Size="Small"></asp:Label>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Model no." ControlToValidate="p_cost_price" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            <asp:TextBox class="form-control" ID="p_model_no" runat="server"></asp:TextBox>
                                        </div>  
                                         <div class="form-group">
                                            <asp:Label ID="Label8" runat="server" Text="Quantity" Font-Bold="True" Font-Size="Small"></asp:Label>
                                             
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Quantity" ControlToValidate="p_cost_price" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Quantity" ControlToValidate="p_cost_price" ValidationExpression="\d+" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                                             <asp:TextBox class="form-control" ID="p_quantity" runat="server"></asp:TextBox>
                                        </div>  
                                         <div class="form-group">
                                            
                                            <asp:Label ID="Label9" runat="server" Text="Cost Price" Font-Bold="True" Font-Size="Small"></asp:Label>
                                             
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Cost Price" ControlToValidate="p_cost_price" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid Cost Price" ControlToValidate="p_cost_price" ValidationExpression="\d+" ForeColor="#FF3300"></asp:RegularExpressionValidator>
                                             <asp:TextBox class="form-control" ID="p_cost_price" runat="server"></asp:TextBox>
                                            
                                        </div>
                                        
                                        <div class="form-group">
                                            <asp:Label ID="Label4" runat="server" Text="Date" Font-Bold="True" Font-Size="Small"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select Date" ControlToValidate="p_cost_price" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                            <asp:TextBox class="form-control" ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox><asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Date Picker" />
                                        </div>                                                           
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" Visible="False">
                                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                            <NextPrevStyle VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#808080" />
                                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                            <SelectorStyle BackColor="#CCCCCC" />
                                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <WeekendDayStyle BackColor="#FFFFCC" />
                                        </asp:Calendar> 
                                                
                                    
                                        <asp:Button ID="p_add_stock" runat="server" class="btn btn-primary" Text="Add Stock" />
                                        
                                        <button type="reset" class="btn btn-default">Reset Button</button>

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
                <img src="img/poi_blue.gif" alt="Loading"  />
                
                
        
                                        </ProgressTemplate>
                                            
                                        </asp:UpdateProgress>
                                    </form>

                                     
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                               
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
    
        
</asp:Content>

