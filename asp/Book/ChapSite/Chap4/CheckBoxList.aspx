<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckBoxList.aspx.cs" Inherits="Chap4_CheckBoxList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用CheckBoxList控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:CheckBoxList ID="chklsSport" runat="server">
        <asp:ListItem Value="football">足球</asp:ListItem>
        <asp:ListItem Value="basketball">篮球</asp:ListItem>
        <asp:ListItem Value="badminton">羽毛球</asp:ListItem>
        <asp:ListItem Value="pingpong">乒乓球</asp:ListItem>
      </asp:CheckBoxList>
      <asp:Button ID="btnSubmit" runat="server" Text="确定" OnClick="BtnSubmit_Click" />
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
