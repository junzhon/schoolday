<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Redirect.aspx.cs" Inherits="Chap6_Redirect" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用Redirect()方法重定向页面</title>
</head>
<body>
  <form id="form1" runat="server">
    用户名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <br />
    <asp:RadioButtonList ID="rdoltStatus" runat="server" RepeatDirection="Horizontal">
      <asp:ListItem Value="teacher">教师</asp:ListItem>
      <asp:ListItem Value="student">学生</asp:ListItem>
    </asp:RadioButtonList>
    <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="确定" />
  </form>
</body>
</html>
