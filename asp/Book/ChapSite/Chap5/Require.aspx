<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Require.aspx.cs" Inherits="Chap5_Require" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>禁止空数据且同时要改变初始值</title>
</head>
<body>
<form id="form1" runat="server">
  <div>
    用户名：<asp:TextBox ID="txtName" runat="server">您的姓名</asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvName1" runat="server" ControlToValidate="txtName">*</asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="rfvName2" runat="server" ControlToValidate="txtName" InitialValue="您的姓名">不能与初使值相同！</asp:RequiredFieldValidator>
  </div>
</form>
</body>
</html>
