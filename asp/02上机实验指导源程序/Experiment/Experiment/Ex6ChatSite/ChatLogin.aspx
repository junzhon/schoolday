<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChatLogin.aspx.cs" Inherits="ChatLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>聊天室用户登录</title>
  <style type="text/css">
    .style1 { width: 231px; }
    .style2 { width: 91px; }
    .style3 { width: 137px; }
    .auto-style2 { width: 4px; }
    .auto-style3 { width: 157px; }
    .auto-style4 { width: 177px; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table class="style1">
        <tr>
          <td colspan="3" style="text-align: center">我的聊天室
          </td>
        </tr>
        <tr>
          <td class="auto-style4" style="text-align: right">用户名：
          </td>
          <td class="auto-style3">
            <asp:TextBox ID="txtName" runat="server" Width="120px"></asp:TextBox>
          </td>
          <td class="auto-style2">
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style4" style="text-align: right">密码：
          </td>
          <td class="auto-style3">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="120px"></asp:TextBox>
          </td>
          <td class="auto-style2">
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style4">&nbsp;
          </td>
          <td class="auto-style3">
            <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="BtnLogin_Click" />
          </td>
          <td class="auto-style2">&nbsp;
          </td>
        </tr>
      </table>
    </div>
  </form>
</body>
</html>
