<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Insert" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>插入数据</title>
  <style type="text/css">
    .auto-style1 { width: 100%; }
    .auto-style2 { width: 71px; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table class="auto-style1">
        <tr>
          <td class="auto-style2" style="text-align: right">分类名：</td>
          <td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
          <td class="auto-style2" style="text-align: right; vertical-align: top">描述：</td>
          <td>
            <asp:TextBox ID="txtDescn" runat="server" TextMode="MultiLine" Height="50px" Width="148px"></asp:TextBox></td>
        </tr>
      </table>
      <asp:Button ID="btnInsert" runat="server" Text="插入" OnClick="BtnInsert_Click" />
      <asp:Button ID="btnReturn" runat="server" Text="返回" OnClick="BtnReturn_Click" />
    </div>
  </form>
</body>
</html>
