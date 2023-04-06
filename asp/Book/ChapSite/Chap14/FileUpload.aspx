<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload.aspx.cs" Inherits="Chap14_FileUpload" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用FileUpload实现文件上传</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:FileUpload ID="fupImg" runat="server" />
      <asp:Button ID="btnUpload" runat="server" OnClick="BtnUpload_Click" Text="上传文件" /><br />
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
