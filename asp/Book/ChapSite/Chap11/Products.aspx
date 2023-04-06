<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Chap11_Products" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用Menu控件显示导航菜单</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:Menu ID="mnuSiteMap" runat="server" DataSourceID="smdsSiteMap">
      </asp:Menu>
      <asp:SiteMapDataSource ID="smdsSiteMap" runat="server" />
    </div>
  </form>
</body>
</html>
