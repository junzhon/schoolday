<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropDownList.aspx.cs" Inherits="Chap4_DropDownList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>实现联动的下拉列表</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlYear_SelectedIndexChanged"></asp:DropDownList>年
    <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlMonth_SelectedIndexChanged"></asp:DropDownList>月
    <asp:DropDownList ID="ddlDay" runat="server"></asp:DropDownList>日
    </div>
  </form>
</body>
</html>
