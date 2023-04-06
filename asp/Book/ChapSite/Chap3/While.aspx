<%@ Page Language="C#" AutoEventWireup="true" CodeFile="While.aspx.cs" Inherits="Chap3_While" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用while语句</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="txtInput" runat="server">请输入一个数字</asp:TextBox>
      <asp:Label ID="lblOutput" runat="server"></asp:Label><br />
      <asp:Button ID="btnSubmit" runat="server" Text="确定" OnClick="BtnSubmit_Click" />
    </div>
  </form>
</body>
</html>
