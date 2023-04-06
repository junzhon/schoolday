<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinqXml.aspx.cs" Inherits="LinqXml" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Linq to XML管理数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      分类名：<asp:TextBox ID="txtName" runat="server" Width="140px">只用于“查询”</asp:TextBox>
      <br />
      <asp:Button ID="btnQueryAll" runat="server" OnClick="BtnQueryAll_Click" Text="显示全部" />
      <asp:Button ID="btnQuery" runat="server" OnClick="BtnQuery_Click" Text="查询" />
      <asp:Button ID="btnInsert" runat="server" OnClick="BtnInsert_Click" Text="插入" />
      <br />
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
