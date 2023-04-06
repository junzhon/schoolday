<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CalendarExtender.aspx.cs" Inherits="Chap12_CalendarExtender" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用CalendarExtender控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
      起始日期：<asp:TextBox ID="txtStartTime" runat="server" Width="70px"></asp:TextBox>
      <ajaxToolkit:CalendarExtender ID="txtStartTime_cldE" runat="server" TargetControlID="txtStartTime" Format="yyyy-MM-dd" />
      结束日期：<asp:TextBox ID="txtEndTime" runat="server" Width="70px"></asp:TextBox>
      <ajaxToolkit:CalendarExtender ID="txtEndTime_cldE" runat="server" TargetControlID="txtEndTime" Format="yyyy-MM-dd" />
      <asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="BtnSearch_Click" /><br />
      <asp:Label ID="lblDisplay" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
