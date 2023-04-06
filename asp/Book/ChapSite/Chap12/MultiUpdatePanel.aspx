<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MultiUpdatePanel.aspx.cs" Inherits="Chap12_MultiUpdatePanel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>在同一个页面中使用多个UpdatePanel控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server" />
      <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
          <asp:Label ID="lblUp1" runat="server" Text="我在第1个面板"></asp:Label><br />
          <asp:Button ID="btnUp1" runat="server" OnClick="BtnUp1_Click" Text="刷新第1个面板" />
        </ContentTemplate>
      </asp:UpdatePanel>
      <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
          <asp:Label ID="lblUp2" runat="server" Text="我在第2个面板"></asp:Label>
        </ContentTemplate>
        <Triggers>
          <asp:AsyncPostBackTrigger ControlID="btnUp2" EventName="Click" />
        </Triggers>
      </asp:UpdatePanel>
      <asp:Button ID="btnUp2" runat="server" OnClick="BtnUp2_Click" Text="刷新第2个面板" />
      <asp:UpdateProgress ID="UpdateProgress1" runat="server">
      </asp:UpdateProgress>
    </div>
  </form>
</body>
</html>
