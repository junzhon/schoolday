<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SessionLoginTable.aspx.cs" Inherits="Chap6_SessionLoginTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>建立Session</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table>
        <tr>
          <td>用户名：</td>
          <td>
            <asp:TextBox ID="txtName" runat="server" Width="170px"></asp:TextBox></td>
        </tr>
        <tr>
          <td>密码：</td>
          <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="170px"></asp:TextBox></td>
        </tr>
      </table>
      <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="确定" />
    </div>
  </form>
</body>
</html>
