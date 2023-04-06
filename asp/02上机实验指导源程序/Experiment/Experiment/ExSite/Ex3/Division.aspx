<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Division.aspx.cs" Inherits="Ex3_Division" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>计算两个数的商并包含异常处理</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="txtDivsor" runat="server"></asp:TextBox>
      <br />
      <asp:TextBox ID="txtDividend" runat="server"></asp:TextBox>
      <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="提交" />
    </div>
  </form>
</body>
</html>
