<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LabelTable.aspx.cs" Inherits="Chap4_LabelTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>通过键盘快捷键激活特定文本框</title>
  <style type="text/css">
    .table { width: 98%; }
    .div { width: 338px; }
    .td { width: 134px; text-align: right; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="div">
      <table class="table">
        <tr>
          <td class="td">
            <asp:Label ID="lblName" runat="server" AccessKey="N" AssociatedControlID="txtName" Text="用户名（N）："></asp:Label>
          </td>
          <td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
          <td class="td">
            <asp:Label ID="lblPassword" runat="server" AccessKey="M" AssociatedControlID="txtPassword" Text="密码（M）："></asp:Label>
          </td>
          <td>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
          </td>
        </tr>
      </table>
    </div>
  </form>
</body>
</html>
