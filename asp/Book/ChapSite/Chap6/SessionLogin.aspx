<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SessionLogin.aspx.cs" Inherits="Chap6_SessionLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>建立Session</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      用户名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
      密码：<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
      <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="确定" />
    </div>
  </form>
</body>
</html>
