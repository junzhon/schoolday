<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cross1.aspx.cs" Inherits="Chap6_Cross1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用跨页面提交技术</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      用户名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
      密码：<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
      <asp:Button ID="btnSubmit" runat="server" PostBackUrl="~/Chap6/Cross2.aspx" Text="确定" />
    </div>
  </form>
</body>
</html>
