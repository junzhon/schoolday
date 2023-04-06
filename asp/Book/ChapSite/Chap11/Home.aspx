<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Chap11_Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用TreeView控件显示导航</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TreeView ID="tvSiteMap" runat="server" DataSourceID="smdsSiteMap"></asp:TreeView>
      <asp:SiteMapDataSource ID="smdsSiteMap" runat="server" />
    </div>
  </form>
</body>
</html>
