<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Timer.aspx.cs" Inherits="Chap12_Timer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用Timer控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server" />
      <asp:Timer ID="tmrStock" OnTick="TmrStock_Tick" runat="server" Interval="5000" />
      <asp:UpdatePanel ID="upStock" runat="server" UpdateMode="Conditional">
        <Triggers>
          <asp:AsyncPostBackTrigger ControlID="tmrStock" />
        </Triggers>
        <ContentTemplate>
          汇率：1$兑换RMB&nbsp;<asp:Label ID="lblPrice" runat="server"></asp:Label><br />
          时间：<asp:Label ID="lblPriceTime" runat="server"></asp:Label>
        </ContentTemplate>
      </asp:UpdatePanel>
      刷新频率：<br />
      <asp:RadioButtonList ID="rdoltFrequency" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RdoltFrequency_SelectedIndexChanged">
        <asp:ListItem Value="5000">5秒</asp:ListItem>
        <asp:ListItem Value="60000">60秒</asp:ListItem>
        <asp:ListItem Value="0">不刷新</asp:ListItem>
      </asp:RadioButtonList>
      页面最后更新时间：<asp:Label ID="lblPageTime" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
