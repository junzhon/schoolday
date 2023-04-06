<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Theme.aspx.cs" Inherits="Theme" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>动态切换主题</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:DropDownList ID="ddlThemes" runat="server" AutoPostBack="True">
        <asp:ListItem Value="0">--请选择主题--</asp:ListItem>
        <asp:ListItem>Blue</asp:ListItem>
        <asp:ListItem>Green</asp:ListItem>
      </asp:DropDownList><br />
      <asp:Label ID="lblName" runat="server" EnableTheming="True" Text="用户名："></asp:Label>
      <asp:TextBox ID="txtName" runat="server" EnableTheming="True"></asp:TextBox><br />
      <asp:Button ID="btnSubmit" runat="server" EnableTheming="False" Text="确定" />
    </div>
  </form>
</body>
</html>
