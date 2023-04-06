<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinqXml.aspx.cs" Inherits="Chap7_LinqXml" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用LINQ to XML管理数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:Button ID="btnCreate" runat="server" OnClick="BtnCreate_Click" Text="创建" />
      <asp:Button ID="btnQuery" runat="server" OnClick="BtnQuery_Click" Text="查询" />
      <asp:Button ID="btnInsert" runat="server" OnClick="BtnInsert_Click" Text="插入" />
      <asp:Button ID="btnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="修改" />
      <asp:Button ID="btnDelete" runat="server" OnClick="BtnDelete_Click" Text="删除" />
    </div>
  </form>
</body>
</html>
