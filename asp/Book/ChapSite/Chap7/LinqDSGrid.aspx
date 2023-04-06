<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LinqDSGrid.aspx.cs" Inherits="Chap7_LinqDSGrid" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用LinqDataSource和GridView显示表数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
      </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
      <asp:LinqDataSource ID="ldsCategory" runat="server" ContextTypeName="MyPetShopDataContext" TableName="Category" OnSelecting="ldsCategory_Selecting">
      </asp:LinqDataSource>
    </div>
  </form>
</body>
</html>
