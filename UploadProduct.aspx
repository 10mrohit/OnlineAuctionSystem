<%@ Page Title="" Language="C#" MasterPageFile="~/Navbar.master" AutoEventWireup="true" CodeFile="UploadProduct.aspx.cs" Inherits="UploadProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainbody" Runat="Server">
    <h3>Want to Sell? Its as Easy as 1,2,3</h3>
        <form runat="server">
            <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" OnFinishButtonClick="Wizard1_FinishButtonClick" Width="901px" Height="16px" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em">
                    <HeaderStyle BackColor="#3498db" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White"  />
                    <NavigationButtonStyle BorderColor="#507CD1" CssClass="btn btn-primary" BorderStyle="Solid" BorderWidth="1px" Font-Size="0.8em" ForeColor="White" />
                    <SideBarButtonStyle BackColor="#3498db" ForeColor="White" />
                    <SideBarStyle BackColor="#3498db" Font-Size="1.0em" VerticalAlign="Top"/>
                    <StepStyle Font-Size="0.8em" ForeColor="#333333" />
                    <WizardSteps>
                        <asp:WizardStep runat="server" title="Product Details">
                            <div class="row">
                                <div class="input-field col s6"  style="margin-left:50px">
                                    <br />
                                    Product Name<br /> &nbsp;<asp:TextBox ID="prodname" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate ="prodname" ErrorMessage="Please Enter a Valid Name" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="input-field col s6" style="margin-left:50px">
                                    Product Description<br /> &nbsp;<asp:TextBox ID="proddesc" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="proddesc" Display="Dynamic" ErrorMessage="Please Enter a Valid Description"></asp:RequiredFieldValidator>
                                </div>
                                <br />
                                    <div class="progress progress-striped active" style="width:250px;margin-left:50px">
                                     <div class="bar" style="width: 10%;"></div>
                                    </div>
                            </div>
                        </asp:WizardStep>

                        <asp:WizardStep runat="server" Title="Bidding Details">
                            <div class="row">
                                <div class="input-field col s6"  style="margin-left:50px">
                                    Initial Bid
                                    <asp:TextBox ID="initialbid" runat="server" placeholder="$0.00"></asp:TextBox>
                                    <asp:RangeValidator Type="Integer" ID="RangeValidator1" runat="server" ControlToValidate="initialbid" 
                                       ErrorMessage="Enter Initial BId (1 - 10000)" MaximumValue="10000" 
                                       MinimumValue="1" Display="Dynamic">
                                    </asp:RangeValidator>
                                </div>
                                <br />
                                <div class="progress progress-striped active" style="width:250px;margin-left:50px">
                                     <div class="bar" style="width: 70%;"></div>
                                    </div>
                            </div>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" title="Bid Ending Details">
                            <div class="row">
                                <div class="input-field col s6"  style="margin-left:50px">
                                    Auction End Date
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
                                        <DayHeaderStyle BackColor="#3498db" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                                        <DayStyle Width="14%" />
                                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                        <OtherMonthDayStyle ForeColor="#999999" />
                                        <SelectedDayStyle BackColor="#2980b9" ForeColor="White" />
                                        <SelectorStyle BackColor="#2980b9" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                        <TodayDayStyle BackColor="#3498db" />
                                    </asp:Calendar>
                                </div>
                                <br />
                                <div class="progress progress-striped active" style="width:250px;margin-left:50px">
                                     <div class="bar" style="width: 100%;"></div>
                                    </div>
                            </div>
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </form>
         <br />
</asp:Content>

