<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinqSqlQuery.aspx.cs" Inherits="Chap7_LinqSqlQuery" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用LINQ to SQL查询数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:Button ID="btnAll" runat="server" OnClick="BtnAll_Click" Text="所有" />
      <asp:Button ID="btnProject" runat="server" OnClick="BtnProject_Click" Text="投影" />
      <asp:Button ID="btnSelect" runat="server" OnClick="BtnSelect_Click" Text="选择" />
      <asp:Button ID="btnOrder" runat="server" OnClick="BtnOrder_Click" Text="排序" />
      <asp:Button ID="btnGroup" runat="server" OnClick="BtnGroup_Click" Text="分组" />
      <asp:Button ID="btnPolymerize" runat="server" OnClick="BtnPolymerize_Click" Text="聚合" />
      <asp:Button ID="btnQuote" runat="server" OnClick="BtnQuote_Click" Text="直接引用" />
      <asp:Button ID="btnJoin" runat="server" OnClick="BtnJoin_Click" Text="连接" />
      <asp:Button ID="btnFuzzy" runat="server" OnClick="BtnFuzzy_Click" Text="模糊" />
      <asp:GridView ID="gvProduct" runat="server"></asp:GridView>
    </div>
  </form>
</body>
</html>
