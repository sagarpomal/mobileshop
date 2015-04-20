<%@ Page Title="" Language="VB" MasterPageFile="~/Products/MasterPage_Products.master" AutoEventWireup="false" CodeFile="Categories_Add.aspx.vb" Inherits="Products_Suppliers_View" %>

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
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button2"  runat="server" Text="< Back to Categories" class="btn btn-default" CausesValidation="false"/>
    </div>
            <br />
            <br />

    <div class="panel panel-default">
  <div class="panel-heading"><h4>Category Details </h4></div>
  <div class="panel-body">
    <br />
            <div class="form-group">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Category Name" ControlToValidate="txt_category" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>                                    
                <asp:TextBox ID="txt_category" runat="server" class="form-control" placeholder="Category Name" AutoPostBack="True"></asp:TextBox>
                
               
            </div>
            <div class="btn-group" role="group" >
                <asp:Button ID="Button1" runat="server" Text="Save" class="btn btn-default" CausesValidation="False" />
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

