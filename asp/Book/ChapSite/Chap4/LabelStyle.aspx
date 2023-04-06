<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LabelStyle.aspx.cs" Inherits="Chap4_Label" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>实例4-2（采用“格式”菜单下的“位置”命令定位密码文本框）</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:Label ID="lblName" runat="server" AccessKey="N" AssociatedControlID="txtName" Text="用户名（N）："></asp:Label>
      <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
      <asp:Label ID="lblPassword" runat="server" AccessKey="M" AssociatedControlID="txtPassword" Text="密码（M）："></asp:Label>
      <asp:TextBox ID="txtPassword" runat="server" Style="position: relative; top: 0px; left: 13px;"></asp:TextBox>
    </div>
  </form>
</body>
</html>
