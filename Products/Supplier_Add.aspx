<%@ Page Title="" Language="VB" MasterPageFile="~/Products/MasterPage_Products.master" AutoEventWireup="false" CodeFile="Supplier_Add.aspx.vb" Inherits="Products_Suppliers_View" %>

<asp:Content  ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server" >
    <asp:ScriptManager ID="scriptmanager1" runat="server"></asp:ScriptManager>
    <br />
    <div class="row">
        <div class="col-lg-6">
            <div class="btn-group" role="group" >
      <asp:Button ID="Button1"  runat="server" Text="< Back to Suppliers" class="btn btn-default" CausesValidation="false"/>
    </div>
            <br />
            <br />

    <div class="panel panel-default">
  <div class="panel-heading"><h4>Supplier Details </h4></div>
  <div class="panel-body">
    <br />


     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>

                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Supplier Name" Font-Size="Medium" ></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Supplier Name" ControlToValidate="txt_supplier" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                                    
                                    <asp:TextBox ID="txt_supplier" AutoPostBack="true" class="form-control" runat="server" placeholder="Supplier Name"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Company Name" Font-Size="Medium" ></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Company Name" ControlToValidate="txt_company" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                                    
                                    <asp:TextBox ID="txt_company" class="form-control" runat="server" placeholder="Company Name"></asp:TextBox>
                                </div>
                                
                                
                                <div class="form-group">  
                                    <asp:Label ID="Label3" runat="server" Text="Mobile No." Font-Size="Medium" ></asp:Label>   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Phone Number" ControlToValidate="txt_phone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>                               
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_phone" ErrorMessage="Enter Valid Phone number" ForeColor="Red" Display="Dynamic" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                 
                                    <asp:TextBox ID="txt_phone" class="form-control" runat="server" placeholder="Phone Number" MaxLength="10" ></asp:TextBox>                               
                                </div>
                                <div class="form-group">  
                                    <asp:Label ID="Label4" runat="server" Text="Email" Font-Size="Medium" ></asp:Label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" ErrorMessage="Please Enter Valid Email Address" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txt_email" AutoPostBack="true" class="form-control" placeholder="E-mail" runat="server" ></asp:TextBox>
                                </div>
                                
                              
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="Button2" runat="server" class="btn btn-default" Text="Save"  />
                                <asp:Button ID="Button3" runat="server" class="btn btn-default" Text="Save and Add Another"/>
                        

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






        
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

</asp:Content>

