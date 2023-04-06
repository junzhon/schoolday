<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SiteMapTest.aspx.cs" Inherits="SiteMapTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1"></asp:TreeView>
          <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        </div>
    </form>
</body>
</html>
