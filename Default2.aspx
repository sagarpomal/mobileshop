<%@ Page Title="" Language="VB" MasterPageFile="~/Advanced/MasterPage_Advanced.master" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <ul class="nav nav-tabs">
    <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span>  Home</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-envelope"></span> Messages</a></li>
</ul>
  
      Jay Sachidanand !

     <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
    
</asp:Content>

