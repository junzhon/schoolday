<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserInfoPage.aspx.cs" Inherits="Ex3_UserInfoPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用UserInfo类</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      姓名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
      <br />
      生日：<asp:TextBox ID="txtBirthday" runat="server"></asp:TextBox>
      <br />
      <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="提交" />
    </div>
  </form>
</body>
</html>
