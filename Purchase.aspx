<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Purchase.aspx.vb" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:Label ID="Label1" runat="server" Text="Purchased From"></asp:Label>
&nbsp;:
    <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Date"></asp:Label>
&nbsp;:
    <asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Type"></asp:Label>
&nbsp;:
    <asp:TextBox ID="TextBox3" class="form-control" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Company"></asp:Label>
&nbsp;:
    <asp:TextBox ID="TextBox4" class="form-control" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Model No."></asp:Label>
&nbsp;:
    <asp:TextBox ID="TextBox5" class="form-control" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Quantity"></asp:Label>
&nbsp;:
    <asp:TextBox ID="TextBox6" class="form-control" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Cost Price"></asp:Label>
&nbsp;:
    <asp:TextBox ID="TextBox7" class="form-control" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Add" />
    
</asp:Content>

