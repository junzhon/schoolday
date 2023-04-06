<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Chap8_Update" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>修改数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      分类ID：<asp:TextBox ID="txtCategoryId" runat="server"></asp:TextBox><br />
      分类名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
      描述：<asp:TextBox ID="txtDescn" runat="server" TextMode="MultiLine"></asp:TextBox><br />
      <asp:Button ID="btnUpdate" runat="server" Text="修改" OnClick="BtnUpdate_Click" />
    </div>
  </form>
</body>
</html>
