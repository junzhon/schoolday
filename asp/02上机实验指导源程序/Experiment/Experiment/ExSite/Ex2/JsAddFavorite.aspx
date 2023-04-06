<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JsAddFavorite.aspx.cs" Inherits="Ex2_JsAddFavorite" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>将当前页面添加到收藏夹</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <a href="#" onclick="window.external.AddFavorite(location.href,document.title)">添加到收藏夹</a>
    </div>
  </form>
</body>
</html>
