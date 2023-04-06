<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DriveInfo.aspx.cs" Inherits="Chap14_DriveInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>显示Web服务器上所有驱动器的信息</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TreeView ID="tvDrive" runat="server"></asp:TreeView>
    </div>
  </form>
</body>
</html>
