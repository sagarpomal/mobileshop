<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="listbox.aspx.vb" Inherits="listbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <script type="text/javascript">
        function reFocus(id) {
            document.getElementById(id).blur();
            document.getElementById(id).focus();
        }
    </script>

   

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>   
    
    
        
   <asp:UpdatePanel runat="server" ID="uplDetail" UpdateMode="Conditional">
       <ContentTemplate>
           <asp:TextBox CssClass="form-control" ID="txtProdottoLike" runat="server"
                ontextchanged="txtProdottoLike_TextChanged"
                onKeyUp="reFocus(this.id);" 
                AutoPostBack="True">
</asp:TextBox>
       </ContentTemplate>
   </asp:UpdatePanel>        
     
<asp:UpdatePanel ID="Update" runat="server">
    <ContentTemplate>
        <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" AutoPostBack="True"></asp:ListBox>
    </ContentTemplate>
    

    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="txtProdottoLike" />
    </Triggers>
</asp:UpdatePanel>
    <select id="Select1" runat="server">
        <option></option>

    </select>
    
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" />
    <asp:ListBox ID="ListBox2" runat="server">
        <asp:ListItem class="text-primary">>&lt;b&gt;hh&lt;/b&gt;hhh</asp:ListItem>
        <asp:ListItem><a href="Default22.aspx">dsfdsfsdgsg</a></asp:ListItem>
     </asp:ListBox>
</asp:Content>

