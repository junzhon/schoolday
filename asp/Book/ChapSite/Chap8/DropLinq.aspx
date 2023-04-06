<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropLinq.aspx.cs" Inherits="Chap8_DropLinq" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>结合使用DropDownList和LINQ显示数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataTextField="Name" DataValueField="CategoryId" OnSelectedIndexChanged="DdlCategory_SelectedIndexChanged">
        <asp:ListItem>-请选择-</asp:ListItem>
      </asp:DropDownList>
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
