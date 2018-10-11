<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setup.aspx.cs" Inherits="AclXraySample.Setup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Initial Setup</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            It appears you are running this tool for the first time. Lets set up global envinroment.<br />
            <br />
            First lets identify installation type.
            <asp:RadioButtonList ID="rbtnSelectDBType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rbtnSelectDBType_SelectedIndexChanged">
                <asp:ListItem Value="0" Selected="False">Azure</asp:ListItem>
                <asp:ListItem Value="1" Selected="False">Local</asp:ListItem>

            </asp:RadioButtonList>
            <asp:Wizard ID="WizardAzure" runat="server" Height="251px" Width="892px" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderWidth="1px" DisplayCancelButton="True" DisplaySideBar="True" FinishDestinationPageUrl="~/Default.aspx" Font-Names="Verdana" Font-Size="0.8em" ActiveStepIndex="1" Visible="false">
                <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
                <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" ForeColor="White" />
                <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" Width="20%" />
                <StepStyle Font-Size="0.8em" ForeColor="#333333" />
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="DataBase Server Name">
                        <table id="Table1" runat="server">
                            <tr>
                                <td><strong>DataBase Server Name</strong></td>
                            </tr>
                            <tr>
                                <td>Database Server</td>
                                <td><asp:TextBox ID="txtBoxDBServer" runat="server"></asp:TextBox></td>
                            </tr>
                            </table>
                           
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Add\Update Forest Deploy Package">
                        <table runat="server" id="Table2">
                             <tr>
                                <td>Database Name</td>
                                <td><asp:TextBox ID="txtBoxDBname" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep3" runat="server" Title="Add\Update Forest Deploy Package">
                        <table runat="server" id="Table3">
                             <tr>
                             
                                <td>Database User Name</td>
                                <td><asp:TextBox ID="txtBoxDBUser" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep4" runat="server" Title="Add\Update Forest Deploy Package">
                        <table runat="server" id="Table4">
                             <tr>
                                <td>Database User Password</td>
                                <td><asp:TextBox ID="txtBoxDBUserPwd" TextMode="Password" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
            <asp:Wizard ID="WizardLocal" runat="server" Height="251px" Width="892px" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderWidth="1px" DisplayCancelButton="True" DisplaySideBar="True" FinishDestinationPageUrl="~/Default.aspx" Font-Names="Verdana" Font-Size="0.8em" ActiveStepIndex="1" Visible="false">
                <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
                <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" ForeColor="White" />
                <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" Width="20%" />
                <StepStyle Font-Size="0.8em" ForeColor="#333333" />
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep10" runat="server" Title="Add/Update DataBaseConnection">
                            <tr>
                                <td><strong>Database Details</strong></td>
                            </tr>
                            <tr>
                                <td>Database Server</td>
                                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Database Name</td>
                                <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Database User Name</td>
                                <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Database User Password</td>
                                <td><asp:TextBox ID="TextBox4" TextMode="Password" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep11" runat="server" Title="Add\Update Forest Deploy Package">
                        <table runat="server" id="Table11">
                            <tr>
                                <td><strong>Forest Details</strong></td>
                            </tr>
                            <tr>
                                <td>Domain FQDN</td>
                                <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Domain LDAP</td>
                                <td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Dedicated Export DC</td>
                                <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>AD Export Netbios Name</td>
                                <td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Dedicated DC Scan Netbios Name</td>
                                <td><asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
        </div>
        <p>
            <asp:Button ID="btnCreateConfig" runat="server" Text="CreateConfig" OnClick="btnCreateConfig_Click" />
        </p>
    </form>
</body>
</html>
