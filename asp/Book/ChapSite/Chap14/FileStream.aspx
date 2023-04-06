<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileStream.aspx.cs" Inherits="Chap14_FileStream" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用FileStream类读写文件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="txtAppend" runat="server" Height="58px" TextMode="MultiLine"></asp:TextBox>
      <asp:Button ID="btnAppend" runat="server" Text="添加" OnClick="BtnAppend_Click" /><br />
      <asp:Label ID="lblShow" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
