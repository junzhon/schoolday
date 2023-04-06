<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Regular.aspx.cs" Inherits="Chap5_Regular" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>验证电子邮件地址</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      邮箱：<asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
      <asp:RegularExpressionValidator ID="revMail" runat="server" ControlToValidate="txtMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮箱地址错误！</asp:RegularExpressionValidator><br />
      <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="确定" />
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
