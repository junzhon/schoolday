<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinqSqlManageData.aspx.cs" Inherits="Chap7_LinqSqlManageData" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用LINQ to SQL管理数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      分类ID：<asp:TextBox ID="txtCategoryId" runat="server"></asp:TextBox><br />
      分类名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
      描述：<asp:TextBox ID="txtDescn" runat="server"></asp:TextBox><br />
      <asp:Button ID="btnInsert" runat="server" OnClick="BtnInsert_Click" Text="插入" />
      <asp:Button ID="btnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="修改" />
      <asp:Button ID="btnDelete" runat="server" OnClick="BtnDelete_Click" Text="删除" />
      <asp:Button ID="btnProcedure" runat="server" OnClick="BtnProcedure_Click" Text="存储过程" />
      <asp:GridView ID="gvCategory" runat="server">
      </asp:GridView>
    </div>
  </form>
</body>
</html>
