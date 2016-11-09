<%@ Page Title="" Language="C#" MasterPageFile="~/Navbar.master" AutoEventWireup="true" CodeFile="Feed.aspx.cs" Inherits="Feed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainbody" Runat="Server">
    <form id="form1" runat="server">
        <h3>Like what you see? Select & Start Bidding!</h3>
    <asp:GridView id="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns = "False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="10">
        <Columns>
            <asp:BoundField DataField = "pname" HeaderText = "Product Name" />
            <asp:BoundField DataField = "pdesc" HeaderText = "Product Description" />
            <asp:BoundField DataField = "bid" HeaderText = "Bid" />
            <asp:BoundField DataField = "enddate" HeaderText = "End Date" />
            <asp:BoundField DataField = "username" HeaderText = "Posted By" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle CssClass="header" BackColor="#3498db" Font-Bold="True" ForeColor="White"></HeaderStyle>
        <PagerStyle CssClass="pager" BackColor="White" ForeColor="#000066" HorizontalAlign="Left"></PagerStyle>
        <RowStyle CssClass="rows" ForeColor="#000066" ></RowStyle>
                <SelectedRowStyle BackColor="#2980b9" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#3498db" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#3498db" />
    </asp:GridView>

    <div class="input-field col s6"  id="newbidarea" runat="server">
     <h3> New Bid For <asp:Label ID="Label2" runat="server"></asp:Label> </h3>
        <br />
    <asp:TextBox ID="newbid" runat="server" placeholder="$0.00" Width="150px"></asp:TextBox>
    <asp:RangeValidator Type="Integer" ID="RangeValidator1" runat="server" ControlToValidate="newbid" 
    ErrorMessage ="Enter Initial Bid (1 - 10000)" MaximumValue="10000" 
    MinimumValue="1" Display="Dynamic">
    </asp:RangeValidator>
        <br />
        <asp:Button ID="SubmitBid" runat="server" Text="Submit" OnClick="SubmitBid_Click" Height="25px" CssClass="btn btn-primary"/>
    </div>
    <asp:Label Display="Dynamic" ID="Label1" runat="server"></asp:Label>
    
    </form>
    
</asp:Content>

