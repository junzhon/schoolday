<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateTable.aspx.cs" Inherits="Chap8_UpdateTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>修改数据</title>
  <style type="text/css">
    .tableStyle {
      width: 100%;
    }

    .tdStyle {
      width: 78px;
      text-align: right;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table class="tableStyle">
        <tr>
          <td class="tdStyle">分类ID：</td>
          <td>
            <asp:TextBox ID="txtCategoryId" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
          <td class="tdStyle">分类名：</td>
          <td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
          <td class="tdStyle">描述：</td>
          <td>
            <asp:TextBox ID="txtDescn" runat="server" TextMode="MultiLine" Height="64px" Width="148px"></asp:TextBox>
          </td>
        </tr>
      </table>
      <asp:Button ID="btnUpdate" runat="server" Text="修改" OnClick="BtnUpdate_Click" />
    </div>
  </form>
</body>
</html>
