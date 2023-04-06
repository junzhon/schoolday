<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultBak.aspx.cs" Inherits="DefaultBak" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>首页</title>
  <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
  <link href="Styles/Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <form id="form1" runat="server">
    <header class="header">
      <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/logo.gif" />
      <ul class="nav nav-pills">
        <li class="navDark">
          <asp:LinkButton ID="lnkbtnDefault" runat="server" CausesValidation="False" ForeColor="White" PostBackUrl="~/Default.aspx">首页</asp:LinkButton></li>
        <li class="navDark">
          <asp:LinkButton ID="lnkbtnRegister" runat="server" CausesValidation="False" ForeColor="White" OnClick="LnkbtnRegister_Click">注册</asp:LinkButton></li>
        <li class="navDark">
          <asp:LinkButton ID="lnkbtnLogin" runat="server" CausesValidation="False" ForeColor="White" OnClick="LnkbtnLogin_Click">登录</asp:LinkButton></li>
        <li class="navDark">
          <asp:LinkButton ID="lnkbtnCart" runat="server" CausesValidation="False" ForeColor="White" PostBackUrl="~/ShopCart.aspx">购物车</asp:LinkButton></li>
        <li class="navDark">
          <asp:LinkButton ID="lnkbtnSiteMap" runat="server" CausesValidation="False" ForeColor="White" PostBackUrl="~/Map.aspx">网站地图</asp:LinkButton></li>
      </ul>
      <div class="status">
        <asp:Label ID="lblWelcome" runat="server" Text="您还未登录！"></asp:Label>
        <asp:LinkButton ID="lnkbtnPwd" runat="server" CausesValidation="False" ForeColor="White" Visible="False" PostBackUrl="~/ChangePwd.aspx">密码修改</asp:LinkButton>
        <asp:LinkButton ID="lnkbtnManage" runat="server" ForeColor="White" Visible="False" PostBackUrl="~/Admin/Default.aspx">系统管理</asp:LinkButton>
        <asp:LinkButton ID="lnkbtnOrder" runat="server" CausesValidation="False" ForeColor="White" Visible="False" PostBackUrl="~/OrderList.aspx">购物记录</asp:LinkButton>
        <asp:LinkButton ID="lnkbtnLogout" runat="server" CausesValidation="False" ForeColor="White" Visible="False" OnClick="LnkbtnLogout_Click">退出登录</asp:LinkButton>
      </div>
    </header>
    <nav class="sitemap">
      您的位置：
    </nav>
    <section class="mainbody">
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
    </section>
  </form>
</body>
</html>
