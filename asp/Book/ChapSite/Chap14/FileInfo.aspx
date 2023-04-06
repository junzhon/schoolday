<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileInfo.aspx.cs" Inherits="Chap14_FileInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>文件的创建、复制、删除、移动操作</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      源文件：<asp:TextBox ID="txtSource" runat="server"></asp:TextBox>
      <asp:Button ID="btnMove" runat="server" OnClick="BtnMove_Click" Text="移动" />
      <asp:Button ID="btnCopy" runat="server" OnClick="BtnCopy_Click" Text="复制" />
      目标文件：<asp:TextBox ID="txtTarget" runat="server"></asp:TextBox><br />
      执行情况：<br />
      <asp:Label ID="lblMsg" runat="server" BorderWidth="2px" Font-Italic="True" Text="提示信息"></asp:Label>
    </div>
  </form>
</body>
</html>
