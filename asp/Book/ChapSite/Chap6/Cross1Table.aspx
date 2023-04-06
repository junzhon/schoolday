<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cross1Table.aspx.cs" Inherits="Chap6_Cross1Table" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用跨页面提交技术</title>
  <style type="text/css">
    .table { width: 100%; }
    .td { width: 67px; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table class="table">
        <tr>
          <td class="td">用户名：</td>
          <td>
            <asp:TextBox ID="txtName" runat="server" Width="170px"></asp:TextBox></td>
        </tr>
        <tr>
          <td class="auto-style2">密码：</td>
          <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="170px"></asp:TextBox></td>
        </tr>
      </table>
      <asp:Button ID="btnSubmit" runat="server" PostBackUrl="~/Chap6/Cross2Table.aspx" Text="确定" />
    </div>
  </form>
</body>
</html>
