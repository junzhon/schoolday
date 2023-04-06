<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridDelete.aspx.cs" Inherits="Chap8_GridDelete" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>为GridView中删除按钮添加客户端提示信息</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="ldsCategory" OnRowDataBound="GvCategory_RowDataBound">
        <Columns>
          <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" InsertVisible="False" ReadOnly="True" />
          <asp:BoundField DataField="Name" HeaderText="Name" />
          <asp:BoundField DataField="Descn" HeaderText="Descn" />
          <asp:CommandField ShowEditButton="True" HeaderText="编辑" />
          <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
        </Columns>
      </asp:GridView>
      <asp:LinqDataSource ID="ldsCategory" runat="server" ContextTypeName="MyPetShopDataContext" EnableDelete="True" EnableUpdate="True" TableName="Category">
      </asp:LinqDataSource>
    </div>
  </form>
</body>
</html>
