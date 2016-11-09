<%@ Page Title="" Language="C#" MasterPageFile="~/Navbar.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainbody" Runat="Server">
    <form id="form1" runat="server">
    Full Name<br />
    <asp:TextBox ID="FullName" runat="server" Width="150px" CssClass="input-field col s6"></asp:TextBox>
    <br />
    Username<br />
    <asp:TextBox ID="Username" runat="server" Width="150px" CssClass="input-field col s6"></asp:TextBox>
    <br />
    Password<br />
    <asp:TextBox ID="Password" type="password" runat="server" Width="150px" CssClass="input-field col s6"></asp:TextBox>
    <br />
    Confirm Password<br />
    <asp:TextBox ID="ConfirmPassword" type="password" runat="server" Width="150px" CssClass="input-field col s6"></asp:TextBox>
    <br />
    <asp:CompareValidator Display="Dynamic" ID="CompareValidator1" ControlToValidate="Password" ControlToCompare="ConfirmPassword" runat="server" ErrorMessage="Passwords don't match"></asp:CompareValidator>
    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="FullName" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ControlToValidate="Username" ErrorMessage="Please Enter Username"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ControlToValidate="Password" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
    <asp:Label Display="Dynamic" ID="Label1" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="Button1_Click"/>
    <br />
        </form>
    
</asp:Content>

