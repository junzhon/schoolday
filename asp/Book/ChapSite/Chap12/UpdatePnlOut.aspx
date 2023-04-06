<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdatePnlOut.aspx.cs" Inherits="Chap12_UpdatePnlOut" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>使用外部按钮刷新UpdatePanel控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server" />
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          <asp:Label ID="lblInterior" runat="server"></asp:Label>
        </ContentTemplate>
        <Triggers>
          <asp:AsyncPostBackTrigger ControlID="btnRefresh" EventName="Click" />
        </Triggers>
      </asp:UpdatePanel>
      <asp:Button ID="btnRefresh" runat="server" OnClick="BtnRefresh_Click" Text="刷新" />
    </div>
  </form>
</body>
</html>
