    <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Project1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="padding-top:10px;">
        <div class="row">
            <div class="col-md-3">
            </div>
            <div class="col-md-6">
                <h1>Sign Up!</h1>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">Username</label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="UserNameSignUp" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="PasswordSignUp" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">Confirm Password</label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="ConfirmPasswordSignUp" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">First Name</label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="FirstNameSignup" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">Last Name</label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="LastNameSignUp" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="form-control" ID="EmailSignUp" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Button ID="ButtonSignUp" runat="server" Text="Sign up" CssClass="btn btn-success" OnClick="ButtonSignUp_Click"/>
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
    </div>
</asp:Content>
