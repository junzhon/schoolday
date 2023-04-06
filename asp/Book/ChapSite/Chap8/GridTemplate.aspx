<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridTemplate.aspx.cs" Inherits="Chap8_GridTemplate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用GridView模板列</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="ldsProduct" PageSize="5">
        <Columns>
          <asp:TemplateField>
            <ItemTemplate>
              <asp:CheckBox ID="chkItem" runat="server" />
            </ItemTemplate>
            <HeaderTemplate>
              <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="True" Text="全选" OnCheckedChanged="ChkAll_CheckedChanged" />
            </HeaderTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="ProductId" HeaderText="商品编号" InsertVisible="False" ReadOnly="True" />
          <asp:TemplateField HeaderText="商品分类编号">
            <ItemTemplate>
              <asp:Label ID="lblCategoryId" runat="server" Text='<%# Bind("CategoryId") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
              <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="ldsCategory" DataTextField="Name" DataValueField="CategoryId" SelectedValue='<%# Bind("CategoryId") %>'>
              </asp:DropDownList>
              <asp:LinqDataSource ID="ldsCategory" runat="server" ContextTypeName="MyPetShopDataContext" TableName="Category">
              </asp:LinqDataSource>
            </EditItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="ListPrice" HeaderText="商品单价" />
          <asp:BoundField DataField="Name" HeaderText="商品名称" />
          <asp:BoundField DataField="Qty" HeaderText="商品库存" />
          <asp:CommandField ShowEditButton="True" />
        </Columns>
      </asp:GridView>
      <asp:LinqDataSource ID="ldsProduct" runat="server" ContextTypeName="MyPetShopDataContext" EnableUpdate="True" TableName="Product">
      </asp:LinqDataSource>
      <asp:Button ID="btnSubmit" runat="server" Text="确定" OnClick="BtnSubmit_Click" />
      <asp:Label ID="lblProductId" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
