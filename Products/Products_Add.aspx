<%@ Page Title="" Language="VB" MasterPageFile="~/Products/MasterPage_Products.master" AutoEventWireup="false" CodeFile="Products_Add.aspx.vb" Inherits="Products_Suppliers_View" %>

<asp:Content  ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">
   <asp:ScriptManager ID="scriptmanager1" runat="server"></asp:ScriptManager>
    <br />
    <div class="row">
        <%--<div class="col-xs-10">--%>
        <%--<div class="col-lg-6">--%>
            <div class="btn-group" role="group" >
      <asp:Button ID="Button1"  runat="server" Text="< Back to Products" class="btn btn-default" CausesValidation="false"/>
    </div>
            <br />
            <br />

    <div class="panel panel-default">
  <div class="panel-heading"><h4>Product Details </h4></div>
  <div class="panel-body">
    <br />


     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
       
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Product Code" Font-Size="Medium" ></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Fill This" ControlToValidate="txt_product_code" ForeColor="Red" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>                                    
                                    <asp:TextBox ID="txt_product_code" AutoPostBack="true" class="form-control" runat="server" placeholder="Product Code"></asp:TextBox>
                                </div>
                                </div>
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Product Name" Font-Size="Medium" ></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Fill This" ControlToValidate="txt_product_name" ForeColor="Red" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>                                    
                                    <asp:TextBox ID="txt_product_name" class="form-control" runat="server" placeholder="Product Name"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="col-xs-4">   
                                
                                <div class="form-group">  
                                    <asp:Label ID="Label3" runat="server" Text="Standard Price" Font-Size="Medium" ></asp:Label>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Fill This" ControlToValidate="txt_standard_cost" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                               
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_standard_cost" ErrorMessage="Only Numbers" ForeColor="Red" Display="Dynamic" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                 
                                    <asp:TextBox ID="txt_standard_cost" class="form-control" runat="server" placeholder="Standard Price" ></asp:TextBox>                               
                                </div>
                            </div>

                            <div class="col-xs-4">   
                                
                                <div class="form-group">  
                                    <asp:Label ID="Label5" runat="server" Text="List Price" Font-Size="Medium" ></asp:Label>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Fill This" ControlToValidate="txt_list_price" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                               
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_list_price" ErrorMessage="Only Numbers" ForeColor="Red" Display="Dynamic" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                 
                                    <asp:TextBox ID="txt_list_price" class="form-control" runat="server" placeholder="List Price" ></asp:TextBox>                               
                                </div>
                            </div>
                            
                                
                             <div class="col-xs-4">   
                                
                                <div class="form-group">  
                                    <asp:Label ID="Label6" runat="server" Text="Category" Font-Size="Medium" ></asp:Label>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Select" ControlToValidate="cb_supplier" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="cb_category" class="form-control" runat="server"></asp:DropDownList>            
                                    
                                </div>
                            </div>
                            
                            <div class="col-xs-4">   
                                
                                <div class="form-group">  
                                    <asp:Label ID="Label7" runat="server" Text="Supplier" Font-Size="Medium" ></asp:Label>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Select" ControlToValidate="cb_supplier" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="cb_supplier" class="form-control" runat="server"></asp:DropDownList>            
                                    
                                </div>
                            </div>

                             <div class="col-xs-12">
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Description" Font-Size="Medium" ></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Fill This" ControlToValidate="txt_desc" ForeColor="Red" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>                                    
                                    <asp:TextBox ID="txt_desc" class="form-control" runat="server" placeholder="Description"></asp:TextBox>
                                </div>
                                </div>
                              


                               </form> 
                            <div class="col-xs-10">
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="Button2" runat="server" class="btn btn-default" Text="Save"  />
                                <asp:Button ID="Button3" runat="server" class="btn btn-default" Text="Save and Add Another"/>
                            </div>

</ContentTemplate>

         <Triggers>
     <asp:AsyncPostBackTrigger ControlID="Button2" />
    </Triggers>
</asp:UpdatePanel>

            <br />    
  </div>
</div>
    
            
            
        </div>
    </div>

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

