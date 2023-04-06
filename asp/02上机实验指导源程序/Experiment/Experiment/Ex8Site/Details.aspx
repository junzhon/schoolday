<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用DetailsView管理Product表</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:DetailsView ID="dvProduct" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ProductId" DataSourceID="ldsProduct" Height="50px" Width="163px">
        <Fields>
          <asp:BoundField DataField="ProductId" HeaderText="ProductId" InsertVisible="False"
            ReadOnly="True" SortExpression="ProductId" />
          <asp:TemplateField HeaderText="CategoryId" SortExpression="CategoryId">
            <ItemTemplate>
              <asp:Label ID="lblCategoryId" runat="server" Text='<%# Eval("CategoryId") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
              <asp:DropDownList ID="ddlCategoryId" runat="server" DataSourceID="ldsCategory" DataTextField="Name" DataValueField="CategoryId">
              </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
              <asp:DropDownList ID="ddlCategoryId" runat="server" DataSourceID="ldsCategory" DataTextField="Name" DataValueField="CategoryId">
              </asp:DropDownList>
            </InsertItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
          <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost" />
          <asp:TemplateField HeaderText="SuppId" SortExpression="SuppId">
            <ItemTemplate>
              <asp:Label ID="lblSuppId" runat="server" Text='<%# Bind("SuppId") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
              <asp:DropDownList ID="ddlSuppId" runat="server" DataSourceID="ldsSupplier" DataTextField="Name" DataValueField="SuppId">
              </asp:DropDownList>
            </EditItemTemplate>
            <InsertItemTemplate>
              <asp:DropDownList ID="ddlSuppId" runat="server" DataSourceID="ldsSupplier" DataTextField="Name" DataValueField="SuppId">
              </asp:DropDownList>
            </InsertItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
          <asp:BoundField DataField="Descn" HeaderText="Descn" SortExpression="Descn" />
          <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
          <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
          <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
      </asp:DetailsView>
      <asp:LinqDataSource ID="ldsProduct" runat="server" ContextTypeName="MyPetShopDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="Product">
      </asp:LinqDataSource>
      <asp:LinqDataSource ID="ldsCategory" runat="server" ContextTypeName="MyPetShopDataContext"
        Select="new (Name, CategoryId)" TableName="Category">
      </asp:LinqDataSource>
      <asp:LinqDataSource ID="ldsSupplier" runat="server" ContextTypeName="MyPetShopDataContext"
        Select="new (SuppId, Name)" TableName="Supplier">
      </asp:LinqDataSource>
    </div>
  </form>
</body>
</html>
