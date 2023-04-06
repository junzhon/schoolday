<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Directory.aspx.cs" Inherits="Chap14_Directory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>计算指定文件夹的大小</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      输入文件夹路径：<asp:TextBox ID="txtInput" runat="server"></asp:TextBox>
      <asp:Button ID="btnCompute" runat="server" OnClick="BtnCompute_Click" Text="计算" />
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
      <asp:TreeView ID="tvDir" runat="server"></asp:TreeView>
    </div>
  </form>
</body>
</html>
