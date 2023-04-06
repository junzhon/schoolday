<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StreamRW.aspx.cs" Inherits="Chap14_StreamRW" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>使用StreamReader和StreamWriter读写文本文件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:Button ID="btnWrite" runat="server" OnClick="BtnWrite_Click" Text="写文本文件" />
      <asp:Button ID="btnRead" runat="server" OnClick="BtnRead_Click" Text="读文本文件" /><br />
      <asp:Label ID="lblShow" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
