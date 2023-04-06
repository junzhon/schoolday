<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridPageSort.aspx.cs" Inherits="Chap8_GridPageSort" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>分页和排序GridView中数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="ldsProduct" PageSize="5" OnRowDataBound="GvProduct_RowDataBound">
        <Columns>
          <asp:BoundField DataField="ProductId" HeaderText="ProductId" InsertVisible="False" ReadOnly="True" SortExpression="ProductId" />
          <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" SortExpression="CategoryId" />
          <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
          <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost" />
          <asp:BoundField DataField="SuppId" HeaderText="SuppId" SortExpression="SuppId" />
          <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
          <asp:BoundField DataField="Descn" HeaderText="Descn" SortExpression="Descn" />
          <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
          <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
        </Columns>
      </asp:GridView>
      <asp:LinqDataSource ID="ldsProduct" runat="server" ContextTypeName="MyPetShopDataContext" TableName="Product"></asp:LinqDataSource>
      每页显示
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlPageSize_SelectedIndexChanged">
      <asp:ListItem>5</asp:ListItem>
      <asp:ListItem>10</asp:ListItem>
    </asp:DropDownList>
      条记录&nbsp;&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
