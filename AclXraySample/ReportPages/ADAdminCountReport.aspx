<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADAdminCountReport.aspx.cs" Inherits="AclXraySample.ReportPages.ADAdminCountReport" MasterPageFile="~/ACLXray.Master" %>


    <asp:Content ID="BodyContent" ContentPlaceHolderID="Main" runat="server">
        <asp:ScriptManager runat="server" EnablePartialRendering="true"></asp:ScriptManager>
        
            
       
        <div id="DivGridViewDiv" class="gridview">
           <h1>AD Admin Count Report</h1>
            <asp:Button runat="server" ID="btnExportData" Text="Export to CSV" OnClick="btnExportData_Click" BackColor="#3366FF" />
            <asp:SqlDataSource ID="gvADAdminCountReportDataSource" runat="server" DataSourceMode="DataSet" SelectCommand="SELECT * FROM AdminCountReport" ConnectionString="<%$ ConnectionStrings:aclxrayConnectionString %>">

                
               
            </asp:SqlDataSource>
            
            <asp:UpdatePanel ID="Panel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                
                <ContentTemplate>
                    <%--<asp:Button runat="server" ID="btnEnableFilter" Text="ApplyFilter" Visible="true" OnClick ="DDfilter_SelectedIndexChanged" />--%>
                    <asp:Button runat="server" Text="ClearFilter" id="btnClearFilter" OnClick="btnClearFilter_Click" BackColor="YellowGreen" />
                    
                    <asp:GridView ID="gvADAdminCountReport" runat="server" Width="25%" CellPadding="4" AutoGenerateColumns="False" OnRowDataBound="gvADAdminCountReport_RowCreated" DataSourceID="gvADAdminCountReportDataSource" AllowPaging="True" AllowSorting="True" ForeColor="#333333" ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:TemplateField HeaderText="ServerFqdn"  >
                                <HeaderTemplate>
                                 ServerFqdn
                                 <asp:DropDownList ID="ServerFqdn" runat="server" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged"  Visible="false" ></asp:DropDownList>       
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("ServerFqdn") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CanBeDelegated"  >
                                <HeaderTemplate>
                                    CanBeDelegated
                                    <asp:DropDownList ID="CanBeDelegated" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged" runat="server" Visible="false" ></asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("CanBeDelegated") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name"  >

                                <HeaderTemplate>
                                    Name
                                    <asp:DropDownList ID="Name" runat="server" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged" Visible="false" ></asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("Name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Authority" >

                                <HeaderTemplate>
                                    Authority
                                    <asp:DropDownList ID="Authority" runat="server" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged" Visible="false" ></asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("Authority") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ObjectClass"  >

                                <HeaderTemplate>
                                    ObjectClass
                                    <asp:DropDownList ID="ObjectClass" runat="server" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged" AutoPostBack="True" Visible="false" ></asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("ObjectClass") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SamAccountName" >
                                <HeaderTemplate>
                                    SamAccountName
                                    <asp:DropDownList ID="SamAccountName" runat="server" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged" Visible="false" ></asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("SamAccountName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DistinguishedName" >
                                <HeaderTemplate>
                                    DistinguishedName
                                    <asp:DropDownList ID="DistinguishedName" runat="server" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged" Visible="false" ></asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("DistinguishedName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ObjectSID">
                                <HeaderTemplate>
                                    ObjectSID
                                    <asp:DropDownList ID="ObjectSID" runat="server" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged" Visible="false" ></asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("ObjectSID") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ModifiedDate" ItemStyle-Width="1%" >
                                <HeaderTemplate>
                                    ModifiedDate
                                    <asp:DropDownList ID="ModifiedDate" runat="server" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged" Visible="false" ></asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("ModifiedDate") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="WhenCreated" ItemStyle-Width="1%" >

                                <HeaderTemplate>
                                    WhenCreated
                                    <asp:DropDownList
                                        ID="WhenCreated"
                                        runat="server"
                                        Visible="false"
                                        OnSelectedIndexChanged="DDfilter_SelectedIndexChanged"
                                        >
                                    </asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("WhenCreated") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="WhenChanged" ItemStyle-Width="1%" >
                                <HeaderTemplate>
                                    WhenChanged
                                    <asp:DropDownList ID="WhenChanged" runat="server" OnSelectedIndexChanged="DDfilter_SelectedIndexChanged" Visible="false"></asp:DropDownList>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("WhenChanged") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            </div>
  
        </asp:Content>

