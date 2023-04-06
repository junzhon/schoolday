<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdatePnlIn.aspx.cs" Inherits="Chap12_UpdatePnlIn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>使用内部按钮刷新UpdatePanel控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server" />
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          <asp:Label ID="lblInterior" runat="server"></asp:Label>
          <asp:Button ID="btnRefresh" runat="server" OnClick="BtnRefresh_Click" Text="刷新" />
        </ContentTemplate>
      </asp:UpdatePanel>
      <asp:Label ID="lblExterior" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
