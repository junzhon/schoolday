<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinqXmlInsert.aspx.cs" Inherits="LinqXmlInsert" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Linq to XML 插入数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table class="style1">
        <tr>
          <td class="style2">分类Id：
          </td>
          <td>
            <asp:TextBox ID="txtCategoryId" runat="server" Width="120px"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="style2">分类名：
          </td>
          <td>
            <asp:TextBox ID="txtName" runat="server" Width="120px"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="style2">描述：
          </td>
          <td>
            <asp:TextBox ID="txtDescn" runat="server" Width="120px"></asp:TextBox>
          </td>
        </tr>
      </table>
      <asp:Button ID="btnInsert" runat="server" Text="插入" OnClick="btnInsert_Click" />
      <asp:Button ID="btnReturn" runat="server" Text="返回" OnClick="btnReturn_Click" />
    </div>
  </form>
</body>
</html>
