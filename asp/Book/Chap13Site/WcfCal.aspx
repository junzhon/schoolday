<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WcfCal.aspx.cs" Inherits="WcfCal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>调用WCF服务</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:TextBox ID="txtA" runat="server" Width="60px"></asp:TextBox>
      <asp:Button ID="btnAdd" runat="server" OnClick="BtnAdd_Click" Text="加" />
      <asp:Button ID="btnSubtract" runat="server" OnClick="BtnSubtract_Click" Text="减" />
      <asp:TextBox ID="txtB" runat="server" Width="60px"></asp:TextBox><br />
      <asp:Label ID="lblResult" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
