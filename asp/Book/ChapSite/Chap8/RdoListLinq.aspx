<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RdoListLinq.aspx.cs" Inherits="Chap8_RdoListLinq" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title></title>
</head>
<body>
<form id="form1" runat="server">
  <div>
    <asp:RadioButtonList ID="rdoltCategory" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="CategoryId" OnSelectedIndexChanged="RdoltCategory_SelectedIndexChanged" RepeatDirection="Horizontal">
    </asp:RadioButtonList>
    <asp:ListBox ID="lstProduct" runat="server" DataTextField="Name" DataValueField="ProductId"></asp:ListBox>
  </div>
</form>
</body>
</html>
