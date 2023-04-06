<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Choice.aspx.cs" Inherits="Ex4_Choice" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>单项选择题</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:PlaceHolder ID="plhChoice" runat="server"></asp:PlaceHolder>
      <asp:Button ID="btnSubmit" runat="server" Text="提交" OnClick="BtnSubmit_Click" />
      <asp:Label ID="lblDisplay" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
