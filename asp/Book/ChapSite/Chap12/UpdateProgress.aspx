<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateProgress.aspx.cs" Inherits="Chap12_UpdateProgress" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用UpdateProgress控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server" />
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          <div style="background-color: #FFFFE0">
            <asp:Label ID="lblTime" runat="server"></asp:Label>
            <asp:Button ID="btnRefresh" runat="server" OnClick="BtnRefresh_Click" Text="刷新" />
          </div>
        </ContentTemplate>
      </asp:UpdatePanel>
      <asp:UpdateProgress runat="server" ID="UpdateProgress1">
        <ProgressTemplate>
          正在连接服务器...<img src="wait.gif" alt="" />          
        </ProgressTemplate>
      </asp:UpdateProgress>
    </div>
  </form>
</body>
</html>
