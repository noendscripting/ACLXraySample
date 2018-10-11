<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enterprisereport.aspx.cs" Inherits="AclXraySample.Enterprisereport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acl XRay-Enterprise Report</title>
    
</head>
<body>
    <h1>Acl XRay-Enterprise Report</h1>
    <form id="eReport" runat="server">
        <div id="ReportOptions" style="float:left">
            <asp:CheckBox ID="MasterBox" Text="SelectAll" AutoPostBack="true" runat="server" Checked="true" OnCheckedChanged="MasterBox_CheckedChanged" BorderWidth="5" BorderColor="YellowGreen"/>
            <asp:CheckBoxList ID="CheckBoxListObjectType" AutoPostBack="false"  runat="server" RepeatColumns="4" BorderColor="#FF6666" BorderStyle="Dotted" BorderWidth="5px">
                <asp:ListItem Text ="AD Admin Count Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="AD AdminSDHolder Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="AD Config Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="AD Domain Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="AD Domain Audit Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="AD Domain Root Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="AD Schema Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="AD User Token Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="DCOM Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Empty Group Reference Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Exchange Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Exchange Mailbox Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="File Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="File Audit Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Folder Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Folder Audit Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Group Policy Object Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Group Reference Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Last Logoff Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Local Group Membership Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Password Rights Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Process Information Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Profile Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Registry Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Registry Audit Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Services Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Share Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Share Content Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Share Content Audit Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="SID History Reference Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Tasks Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="Tier-0 Access Path Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="UNC File Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="UNC File Audit Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="UNC Folder Access Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="UNC Folder Audit Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="User Reference Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="User Rights Report" Selected="True"></asp:ListItem>
                <asp:ListItem Text ="WMI Report" Selected="True"></asp:ListItem>
            </asp:CheckBoxList>
        </div>
             
            
        <div  title="Group Expansion Options:">
            <p>
            <b>"Group Expansion Options:"</b>
            <asp:RadioButtonList ID="RadioButtonListGroupExpansion" runat="server" Width="226px" BorderColor="Red" BorderWidth="5">
                <asp:ListItem Text="Full Group Expansion" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Explicit Groups Only"></asp:ListItem>
                <asp:ListItem Text="Object SID and SID History"></asp:ListItem>
                <asp:ListItem Text="Object SID"></asp:ListItem>
            </asp:RadioButtonList>
            </p>
            <p>
            <b>"Search Options:"</b>
            <asp:RadioButtonList ID="RadioButtonListSearchOptions" OnSelectedIndexChanged="RadioButtonListSearchOptions_SelectedIndexChanged" AutoPostBack="true" runat="server" BorderColor="Red" BorderWidth="5" Width="226px">
                <asp:ListItem Text="Search for Enterprise Access" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Search for Server Access"></asp:ListItem>
                <asp:ListItem Text="Search for Specific SID"></asp:ListItem>
            </asp:RadioButtonList>
            </p>
            <p>
            <asp:Label Text="Select Domain:" runat="server"></asp:Label>
            <asp:DropDownList ID="DropDownListDomain" runat="server">
                <asp:ListItem>contosoad.com</asp:ListItem>
            </asp:DropDownList>
            </p>
            <p>
            <asp:Label ID="LabelBoxSearch" Text="Enter SamAccountName:" runat="server"></asp:Label>
            <asp:TextBox ID="TextBoxSearch" runat="server"></asp:TextBox>
            </p>
            
        </div>
        <div id="GridviewDiv">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" Visible="false">

        
        </asp:GridView>
        

        <asp:Button ID="ButtonShowAccess" runat="server" Text="Show Access" OnClick="ButtonShowAccess_Click"/>
        <asp:Button ID="Button3" runat="server" Text="Button" />
        <asp:Button ID="Button2" runat="server" Text="Button" />
        

        </div>
    </form>
</body>
</html>


    
    