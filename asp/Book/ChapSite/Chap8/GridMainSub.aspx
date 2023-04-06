<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridMainSub.aspx.cs" Inherits="Chap8_GridMainSub" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>在同一页显示主从表</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      主表
    <asp:GridView ID="gvCategory" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="ldsCategory" PageSize="3">
      <Columns>
        <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" InsertVisible="False" ReadOnly="True" />
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="Descn" HeaderText="Descn" />
        <asp:CommandField ShowSelectButton="True" />
      </Columns>
    </asp:GridView>
      从表
    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="ldsProduct">
      <Columns>
        <asp:BoundField DataField="ProductId" HeaderText="ProductId" />
        <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" />
        <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" />
        <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" />
        <asp:BoundField DataField="SuppId" HeaderText="SuppId" />
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="Descn" HeaderText="Descn" />
        <asp:BoundField DataField="Image" HeaderText="Image" />
        <asp:BoundField DataField="Qty" HeaderText="Qty" />
      </Columns>
    </asp:GridView>
      <asp:LinqDataSource ID="ldsCategory" runat="server" ContextTypeName="MyPetShopDataContext" TableName="Category">
      </asp:LinqDataSource>
      <asp:LinqDataSource ID="ldsProduct" runat="server" ContextTypeName="MyPetShopDataContext" TableName="Product" Where="CategoryId == @CategoryId">
        <WhereParameters>
          <asp:ControlParameter ControlID="gvCategory" DefaultValue="1" Name="CategoryId" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
      </asp:LinqDataSource>
    </div>
  </form>
</body>
</html>
