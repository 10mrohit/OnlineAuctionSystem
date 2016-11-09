<%@ Page Title="" Language="C#" MasterPageFile="~/Navbar.master" AutoEventWireup="true" CodeFile="EditProducts.aspx.cs" Inherits="EditProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainbody" Runat="Server">

    <form id="form1" runat="server">
        <asp:Label ID="username" runat="server"></asp:Label>
        <h3>You can Edit your Added Products</h3>
        <asp:Label Display="Dynamic" ID="Label2" runat="server"></asp:Label>

        <asp:SqlDataSource id = "sourceProducts" runat ="server" ConnectionString ="Data Source=(localdb)\v11.0;Initial Catalog=OnlineAuction;Integrated Security=True;Pooling=False"
        SelectCommand = "SELECT pid,pname,pdesc,bid,enddate,username FROM products where username=@uname"
        UpdateCommand = "UPDATE products SET pname = @pname,
        pdesc = @pdesc,bid=@bid WHERE pid = @pid">
            <SelectParameters>
            <asp:ControlParameter ControlID="username" Name="uname" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:GridView ID = "gridProducts" runat = "server" DataSourceID = "sourceProducts" AutoGenerateColumns = "False" DataKeyNames = "pid" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="8" Width="750px">
            <EmptyDataTemplate>You Have No Products To Edit</EmptyDataTemplate>
            <Columns>
                <asp:BoundField DataField = "pid" HeaderText = "Product ID" ReadOnly="true"/>
                <asp:BoundField DataField = "pname" HeaderText = "Product Name" />
                <asp:BoundField DataField = "pdesc" HeaderText = "Product Description" />
                <asp:BoundField DataField = "bid" HeaderText = "Bid" />
                <asp:BoundField DataField = "enddate" HeaderText = "End Date" />
                <asp:BoundField DataField = "username" HeaderText = "Posted By" ReadOnly="true"/>
                <asp:CommandField ShowEditButton = "True" />
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


    </form>

</asp:Content>

