<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Project1.GameBoard.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
    <li><asp:LinkButton ID="Users" runat="server">Users</asp:LinkButton></li>
    <li><asp:LinkButton ID="Games" runat="server">Games</asp:LinkButton></li>
    <li><asp:LinkButton ID="Categories" runat="server">Categories</asp:LinkButton></li>
    <li><asp:LinkButton ID="Challenges" runat="server">Challenges</asp:LinkButton></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
