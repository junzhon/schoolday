<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProShow.aspx.cs" Inherits="ProShow" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>商品展示</title>
</head>
<body>
<form id="form1" runat="server">
  <div>
    分类名：
    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="CategoryId" OnSelectedIndexChanged="DdlCategory_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GvProduct_PageIndexChanging" PagerSettings-Mode="NextPrevious" PageSize="1" Width="100%">
      <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPrevious" NextPageText="下一页" Position="TopAndBottom" PreviousPageText="上一页" />
      <Columns>
        <asp:TemplateField>
          <ItemTemplate>
            <table style="border: 1px solid #808080; width: 100%;">
              <tr>
                <td rowspan="7" style="text-align: center; border: 1px; vertical-align: middle; width: 40%;">
                  <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Bind("Image") %>' Height="60px" Width="60px" />
                </td>
                <td style="border: 1px solid #808080;">商品名称：</td>
                <td style="border: 1px solid #808080;">
                  <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </td>
              </tr>
              <tr>
                <td style="border: 1px solid #808080;">商品价格：</td>
                <td style="border: 1px solid #808080;">
                  <asp:Label ID="lblListPrice" runat="server" Text='<%# Bind("ListPrice") %>'></asp:Label>
                </td>
              </tr>
              <tr>
                <td style="border: 1px solid #808080;">商品描述：</td>
                <td style="border: 1px solid #808080;">
                  <asp:Label ID="lblDescn" runat="server" Text='<%# Bind("Descn") %>'></asp:Label>
                </td>
              </tr>
              <tr>
                <td style="border: 1px solid #808080;">库存：</td>
                <td style="border: 1px solid #808080;">
                  <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                </td>
              </tr>
            </table>
          </ItemTemplate>
        </asp:TemplateField>
        <asp:HyperLinkField DataNavigateUrlFields="ProductId" DataNavigateUrlFormatString="~/ShopCart.aspx?ProductId={0}" HeaderText="放入购物车" Text="购买" />
      </Columns>
    </asp:GridView>
  </div>
</form>
</body>
</html>
