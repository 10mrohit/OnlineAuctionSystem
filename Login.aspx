<%@ Page Title="" Language="C#" MasterPageFile="~/Navbar.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ MasterType VirtualPath="~/Navbar.master" %>



<asp:Content ID="Content2" ContentPlaceHolderID="mainbody" Runat="Server">
    <form id="form1" runat="server">
        <h3>Hey Welcome to OAS, Connect with Buyers or Post your own Products online!</h3>
        <br />
        Username   <i class="small material-icons">perm_identity</i>
        <br />
        <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <br />
        Password   <i class="small material-icons">mode_edit</i><br />
        <asp:TextBox ID="Password" Type="Password" runat="server"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" ControlToValidate="Username" runat="server" ErrorMessage="Please enter username."></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" ControlToValidate="Password" runat="server" ErrorMessage="Please enter password."></asp:RequiredFieldValidator>
        <asp:Label ID="Label1" Display="Dynamic" runat="server" Text=""></asp:Label>
        <br />
        <asp:Button ID="LoginButton" runat="server" Height="26px" Text="Login" CssClass="btn btn-primary" OnClick="LoginButton_Click" />
&nbsp;&nbsp;
        <asp:Button ID="Register" runat="server" Height="26px" Text="Register" CssClass="btn btn-primary" OnClick="Register_Click1"/>
        
    </form>
</asp:Content>

