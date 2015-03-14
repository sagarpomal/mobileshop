<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Sales.aspx.vb" Inherits="Sales" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
    function RefreshUpdatePanel() {
        __doPostBack('<%= TextBox1.ClientID%>', '');
    };
    </script>

    <script type="text/javascript">
        function SetCursorToTextEnd(textControlID) {
            var text = document.getElementById(textControlID);
            if (text != null && text.value.length > 0) {
                if (text.createTextRange) {
                    var range = text.createTextRange();
                    range.moveStart('character', text.value.length);
                    range.collapse();
                    range.select();
                }
                else if (text.setSelectionRange) {
                    var textLength = text.value.length;
                    text.setSelectionRange(textLength, textLength);
                }
            }
        }
</script>
    

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>
             
            <br />
            <asp:TextBox ID="TextBox1" runat="server" onkeyup="RefreshUpdatePanel();"  onfocus="SetCursorToTextEnd(this.id);"></asp:TextBox>
            <br />
            <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="TextBox1" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

