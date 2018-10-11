<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="StandardReports.aspx.cs" Inherits="AclXraySample.StandardReports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <%--<link rel="stylesheet" type="text/css" href="Content/Site.css" />--%>
    <title>ACL X-Ray - Reports</title>
    <script type="text/javascript">
        function checkHeight() {
            var iframe1 = document.getElementById("ReportFrame");
            var c = (iframe1.contentWindow || iframe1.contentDocument);
            iframe1.height =parseFloat( c.document.body.scrollHeight || c.scrollHeight)+40;
        }
        //window.onload = function() { checkHeight(); }
</script>
    <style type="text/css">
     body{
        top: 10px;
    }
    #form1{

    }
    #RadioButtonListReportList {
       
        background-color:grey;
        border-color:black;
      }
   #DivRadioButtonId{
       display:flex;
       flex-direction:row;
       flex:0 0 auto;

   }

   #DivGridViewDiv {
       display:inline-flex;
       top: 20px;
       width:75%;
       border-color:black;

   }
   #FiltersDiv{
       display:flex;
       flex-direction:column-reverse;
       flex:0 1 30%;
       background-color:pink;
       border-color:black;
  }
   #LabelByFirstColumn {
       display:block
   }
   #DDFilterByFirstColumn{
   }
   #parent{
       display:flex;
       
   }
    </style>

</head>
<body>
    <h1>ACL X-Ray - Reports</h1>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" EnablePartialRendering="true"></asp:ScriptManager>
        
        <div id="DivRadioButtonId" class="inline-block-div">
       
            <asp:RadioButtonList EnableViewState="false" ID="RadioButtonListReportList" AutoPostBack="False" RepeatColumns="4" runat="server">
                <asp:ListItem Text="AD Admin Count Report"></asp:ListItem>
                <asp:ListItem Text="AD AdminSDHolder Report"></asp:ListItem>
                <asp:ListItem Text="AD Config Access Report"></asp:ListItem>
                <asp:ListItem Text="AD Domain Access Report"></asp:ListItem>
                <asp:ListItem Text="AD Domain Audit Report"></asp:ListItem>
                <asp:ListItem Text="AD Domain Root Report"></asp:ListItem>
                <asp:ListItem Text="AD Schema Access Report"></asp:ListItem>
                <asp:ListItem Text="AD User Token Report"></asp:ListItem>
                <asp:ListItem Text="DCOM Report"></asp:ListItem>
                <asp:ListItem Text="Empty Group Reference Report"></asp:ListItem>
                <asp:ListItem Text="Exchange Access Report"></asp:ListItem>
                <asp:ListItem Text="Exchange Mailbox Report"></asp:ListItem>
                <asp:ListItem Text="File Access Report"></asp:ListItem>
                <asp:ListItem Text="File Audit Report"></asp:ListItem>
                <asp:ListItem Text="Folder Access Report"></asp:ListItem>
                <asp:ListItem Text="Folder Audit Report"></asp:ListItem>
                <asp:ListItem Text="Group Policy Object Report"></asp:ListItem>
                <asp:ListItem Text="Group Reference Report"></asp:ListItem>
                <asp:ListItem Text="Last Logoff Report"></asp:ListItem>
                <asp:ListItem Text="Local Group Membership Report"></asp:ListItem>
                <asp:ListItem Text="Password Rights Report"></asp:ListItem>
                <asp:ListItem Text="Process Information Report"></asp:ListItem>
                <asp:ListItem Text="Profile Report"></asp:ListItem>
                <asp:ListItem Text="Registry Access Report"></asp:ListItem>
                <asp:ListItem Text="Registry Audit Report"></asp:ListItem>
                <asp:ListItem Text="Services Report"></asp:ListItem>
                <asp:ListItem Text="Share Access Report"></asp:ListItem>
                <asp:ListItem Text="Share Content Access Report"></asp:ListItem>
                <asp:ListItem Text="Share Content Audit Report"></asp:ListItem>
                <asp:ListItem Text="SID History Reference Report"></asp:ListItem>
                <asp:ListItem Text="Tasks Report"></asp:ListItem>
                <asp:ListItem Text="Tier-0 Access Path Report"></asp:ListItem>
                <asp:ListItem Text="UNC File Access Report"></asp:ListItem>
                <asp:ListItem Text="UNC File Audit Report"></asp:ListItem>
                <asp:ListItem Text="UNC Folder Access Report"></asp:ListItem>
                <asp:ListItem Text="UNC Folder Audit Report"></asp:ListItem>
                <asp:ListItem Text="User Reference Report"></asp:ListItem>
                <asp:ListItem Text="User Rights Report"></asp:ListItem>
                <asp:ListItem Text="WMI Report"></asp:ListItem>
                
            </asp:RadioButtonList>
             <%--<asp:Button runat="server" ID="btnSelectReport" Text="Run Report" OnClick="Unnamed_SelectedIndexChanged" />--%>
            

        </div>
            
        <div id="ReportDiv" class="inline-block-div" runat="server">
            <iframe id="ReportFrame" width="100%" style="outline:none"  src="ReportPages/ADAdminCountReport.aspx" onload="checkHeight()"></iframe>

        </div>

        

        
    </form>
</body>
</html>
