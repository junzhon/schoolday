<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>购买宠物页</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:CheckBoxList ID="chklsPet" runat="server">
        <asp:ListItem Value="盲鱼">盲鱼</asp:ListItem>
        <asp:ListItem Value="波斯猫">波斯猫</asp:ListItem>
        <asp:ListItem Value="斑马">斑马</asp:ListItem>
        <asp:ListItem Value="千里马">千里马</asp:ListItem>
        <asp:ListItem Value="绵羊">绵羊</asp:ListItem>
      </asp:CheckBoxList>
      <asp:Button ID="btnBuy" runat="server" OnClick="BtnBuy_Click" Text="放入购物车" />
      <asp:Button ID="btnView" runat="server" OnClick="BtnView_Click" Text="查看购物车" />
    </div>
  </form>
</body>
</html>
