﻿<%@ Page Title="" Language="C#" MasterPageFile="~/GameBoard/Site2.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Project1.GameBoard.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftNavBarContentPlaceHolder" runat="server">
    <li class="active"><asp:LinkButton ID="Users" runat="server">Users</asp:LinkButton></li>
    <li><asp:LinkButton ID="Games" runat="server">Games</asp:LinkButton></li>
    <li><asp:LinkButton ID="Categories" runat="server">Categories</asp:LinkButton></li>
    <li><asp:LinkButton ID="Challenges" runat="server">Challenges</asp:LinkButton></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-header">Users</h1>
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped" DataKeyNames="User_ID">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <%--<asp:BoundField DataField="User_ID" HeaderText="User_ID" SortExpression="User_ID" InsertVisible="False" ReadOnly="True" />--%>
                <asp:BoundField DataField="User_UserName" HeaderText="User_UserName" SortExpression="User_UserName" />
               <%-- <asp:BoundField DataField="User_Password" HeaderText="User_Password" SortExpression="User_Password" />--%>
                <asp:BoundField DataField="User_FirstName" HeaderText="User_FirstName" SortExpression="User_FirstName" />
                <asp:BoundField DataField="User_LastName" HeaderText="User_LastName" SortExpression="User_LastName" />
                <asp:BoundField DataField="User_Email" HeaderText="User_Email" SortExpression="User_Email" />
                <asp:BoundField DataField="User_AccountType" HeaderText="User_AccountType" SortExpression="User_AccountType" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=WIN-BF1396ULF6F\SQLEXPRESS;Initial Catalog=CTF;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [User]" DeleteCommand="DELETE FROM [User] WHERE [User_ID] = @User_ID" InsertCommand="INSERT INTO [User] ([User_UserName], [User_Password], [User_FirstName], [User_LastName], [User_Email], [User_AccountType]) VALUES (@User_UserName, @User_Password, @User_FirstName, @User_LastName, @User_Email, @User_AccountType)" UpdateCommand="UPDATE [User] SET [User_UserName] = @User_UserName, [User_Password] = @User_Password, [User_FirstName] = @User_FirstName, [User_LastName] = @User_LastName, [User_Email] = @User_Email, [User_AccountType] = @User_AccountType WHERE [User_ID] = @User_ID">
            <DeleteParameters>
                <asp:Parameter Name="User_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_UserName" Type="String" />
                <asp:Parameter Name="User_Password" Type="String" />
                <asp:Parameter Name="User_FirstName" Type="String" />
                <asp:Parameter Name="User_LastName" Type="String" />
                <asp:Parameter Name="User_Email" Type="String" />
                <asp:Parameter Name="User_AccountType" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_UserName" Type="String" />
                <asp:Parameter Name="User_Password" Type="String" />
                <asp:Parameter Name="User_FirstName" Type="String" />
                <asp:Parameter Name="User_LastName" Type="String" />
                <asp:Parameter Name="User_Email" Type="String" />
                <asp:Parameter Name="User_AccountType" Type="String" />
                <asp:Parameter Name="User_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
