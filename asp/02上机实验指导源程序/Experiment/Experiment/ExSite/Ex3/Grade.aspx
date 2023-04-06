<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Grade.aspx.cs" Inherits="Ex3_Grade" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>输出成绩对应的等级</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="txtInput" runat="server"></asp:TextBox>
      <asp:Button ID="btnSubmit" runat="server" Text="等级" OnClick="BtnSubmit_Click" />
      <asp:Label ID="lblDisplay" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
