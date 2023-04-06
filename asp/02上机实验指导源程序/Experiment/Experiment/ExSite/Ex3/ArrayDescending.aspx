<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArrayDescending.aspx.cs" Inherits="Ex3_ArrayDescending" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>降序排列数组</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="txtInput" runat="server"></asp:TextBox>
      <asp:Button ID="btnSubmit" runat="server" Text="降序" OnClick="BtnSubmit_Click" />
    </div>
  </form>
</body>
</html>
