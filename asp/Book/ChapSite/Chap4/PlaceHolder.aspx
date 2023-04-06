<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlaceHolder.aspx.cs" Inherits="Chap4_PlaceHolder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用PlaceHolder动态添加控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:PlaceHolder ID="plhTest" runat="server"></asp:PlaceHolder>
      <br />
      <asp:Button ID="btnAcquire" runat="server" Text="获取" OnClick="BtnAcquire_Click" />
    </div>
  </form>
</body>
</html>
