<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserInfoEventPage.aspx.cs" Inherits="Ex3_UserInfoEventPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>测试UserInfoEvent类</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="txtBirthday" runat="server"></asp:TextBox>
      <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="提交" />
    </div>
  </form>
</body>
</html>
