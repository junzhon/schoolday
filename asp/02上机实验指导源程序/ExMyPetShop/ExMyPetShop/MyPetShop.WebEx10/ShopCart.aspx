<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShopCart.aspx.cs" Inherits="ShopCart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>购物车</title>
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
      <div class="rightside">
        <asp:Panel ID="pnlCart" runat="server">
          <asp:GridView ID="gvCart" runat="server" Width="100%" AutoGenerateColumns="False">
            <Columns>
              <asp:TemplateField>
                <ItemTemplate>
                  <asp:CheckBox ID="chkProduct" runat="server" />
                </ItemTemplate>
              </asp:TemplateField>
              <asp:BoundField DataField="ProId" HeaderText="商品ID" />
              <asp:BoundField DataField="ProName" HeaderText="商品名称" />
              <asp:BoundField DataField="ListPrice" HeaderText="商品价格" DataFormatString="{0:c}" />
              <asp:TemplateField HeaderText="购买数量">
                <ItemTemplate>
                  <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Qty") %>' Width="30"></asp:TextBox>
                </ItemTemplate>
              </asp:TemplateField>
            </Columns>
          </asp:GridView>
          <br />
          <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label><br />
          <asp:Label ID="lblHint" runat="server" ForeColor="Green"></asp:Label><br />
          总价：<asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
          &nbsp;&nbsp;
      <asp:Button ID="btnDelete" runat="server" Text="删除商品" OnClick="BtnDelete_Click" />
          &nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button ID="btnClear" runat="server" Text="清空购物车" OnClick="BtnClear_Click" />
          &nbsp;&nbsp;&nbsp;
      <asp:Button ID="btnComputeAgain" runat="server" Text="重新计算" OnClick="BtnComputeAgain_Click" />
          &nbsp;
      <asp:Button ID="btnSettle" runat="server" Text="结算" OnClick="BtnSettle_Click" />
        </asp:Panel>
        <asp:Label ID="lblCart" runat="server"></asp:Label>
      </div>
      <%-- 下面<div>元素左右两侧均不允许其他浮动元素，并显示分隔线 --%>
      <div class="clear"></div>
    </section>
  </form>
</body>
</html>
