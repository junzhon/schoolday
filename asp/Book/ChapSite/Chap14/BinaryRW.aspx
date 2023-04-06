<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BinaryRW.aspx.cs" Inherits="Chap14_BinaryRW" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>读写二进制数据文件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:Button ID="btnWrite" runat="server" OnClick="BtnWrite_Click" Text="写二进制文件" />
      <asp:Button ID="btnRead" runat="server" OnClick="BtnRead_Click" Text="读二进制文件" /><br />
      <asp:Label ID="lblShow" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
