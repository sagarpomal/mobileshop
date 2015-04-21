<%@ Page Title="" Language="VB" MasterPageFile="~/Products/MasterPage_Products.master" AutoEventWireup="false" CodeFile="Supplier_Add1.aspx.vb" Inherits="Products_Suppliers_View" %>

<asp:Content  ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server" >
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <%--<script type="text/javascript">
        document.body.onload = function () { window.opener.location = window.opener.location; }
</script>--%>
   <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <div class="row">
        <div class="col-lg-6">
            <div class="btn-group" role="group" >
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1"  runat="server" Text="< Back to Suppliers" class="btn btn-default" CausesValidation="false"/>
    </div>
            <br />
            <br />

    <div class="panel panel-default">
  <div class="panel-heading"><h4>Supplier Details </h4></div>
  <div class="panel-body">
    <br />
            <div class="form-group">
                
                <asp:Label ID="Label2" runat="server" Text="Supplier Name" Font-Size="Medium" ></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Supplier Name" ControlToValidate="txt_supplier_name" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>                                    
                <asp:TextBox ID="txt_supplier_name" runat="server" class="form-control" placeholder="Supplier Name" AutoPostBack="True"></asp:TextBox>
                
               
            </div>
            <div class="form-group">
                
                <asp:Label ID="Label1" runat="server" Text="Company" Font-Size="Medium" ></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Company Name" ControlToValidate="txt_company" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>                                    
                <asp:TextBox ID="txt_company" runat="server" class="form-control" placeholder="Company Name" AutoPostBack="True"></asp:TextBox>
                
               
            </div>
            <div class="form-group">
                
                <asp:Label ID="Label4" runat="server" Text="Email" Font-Size="Medium" ></asp:Label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" ErrorMessage="Please Enter Valid Email Address" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" ></asp:RegularExpressionValidator>
                
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Valid Email Address" ControlToValidate="" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>--%>                                    
                <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="Email" AutoPostBack="True"></asp:TextBox>
                
               
            </div>
            <div class="form-group">
                
                <asp:Label ID="Label3" runat="server" Text="Mobile No." Font-Size="Medium" ></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Mobile No." ControlToValidate="txt_mobile" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>                                    
                <asp:TextBox ID="txt_mobile" runat="server" class="form-control" placeholder="Mobile No." AutoPostBack="True"></asp:TextBox>
                
               
            </div>
            <div class="btn-group" role="group" >
                <asp:Button ID="Button2" runat="server" Text="Save" class="btn btn-default" CausesValidation="False" />
                <asp:Button ID="Button3" runat="server" Text="Save and Add Another" class="btn btn-default" CausesValidation="False" />
                <%--<asp:Button ID="Button2" runat="server" Text="Save and Add Another " class="btn btn-default" CausesValidation="False" />--%>

            </div>
            <br />
            <br />    
  </div>
</div>
    
            
            
        </div>
    </div>
    

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

