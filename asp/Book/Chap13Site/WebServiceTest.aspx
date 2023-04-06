<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebServiceTest.aspx.cs" Inherits="WebServiceTest" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>调用ASP.NET Web服务</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:Button ID="btnTest" runat="server" OnClick="BtnTest_Click" Text="测试Web服务" />
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
