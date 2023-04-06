<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridDetails.aspx.cs" Inherits="Chap8_GridDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>结合GridView和DetailsView管理数据</title>
  <style type="text/css">
    .tdStyle {
      width: 244px;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table>
        <tr>
          <td class="tdStyle">
            <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="ldsGrid">
              <Columns>
                <asp:BoundField DataField="ProductId" HeaderText="ProductId" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:CommandField SelectText="详细资料" ShowSelectButton="True" />
              </Columns>
            </asp:GridView>
          </td>
          <td>
            <asp:DetailsView ID="dvProduct" runat="server" AutoGenerateRows="False" DataKeyNames="ProductId" DataSourceID="ldsDetails" HeaderText="详细资料" OnItemDeleted="DvProduct_ItemDeleted" OnItemInserted="DvProduct_ItemInserted">
              <Fields>
                <asp:BoundField DataField="ProductId" HeaderText="ProductId" InsertVisible="false" />
                <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" />
                <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" />
                <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" />
                <asp:BoundField DataField="SuppId" HeaderText="SuppId" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Descn" HeaderText="Descn" />
                <asp:BoundField DataField="Image" HeaderText="Image" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
              </Fields>
            </asp:DetailsView>
          </td>
        </tr>
      </table>
      <asp:LinqDataSource ID="ldsGrid" runat="server" ContextTypeName="MyPetShopDataContext" TableName="Product"></asp:LinqDataSource>
      <asp:LinqDataSource ID="ldsDetails" runat="server" ContextTypeName="MyPetShopDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="Product" Where="ProductId == @ProductId">
        <WhereParameters>
          <asp:ControlParameter ControlID="gvProduct" DefaultValue="1" Name="ProductId" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
      </asp:LinqDataSource>
    </div>
  </form>
</body>
</html>
