<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>查看购物车</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
      <br />
      <asp:CheckBoxList ID="chklsPet" runat="server">
      </asp:CheckBoxList>
      <asp:Button ID="btnClear" runat="server" Text="清空购物车" OnClick="BtnClear_Click" />
      <asp:Button ID="btnContinue" runat="server" OnClick="BtnContinue_Click" Text="继续购物" />
    </div>
  </form>
</body>
</html>
