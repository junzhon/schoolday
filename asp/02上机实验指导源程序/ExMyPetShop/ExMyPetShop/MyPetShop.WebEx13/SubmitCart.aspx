<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubmitCart.aspx.cs" Inherits="SubmitCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>提交订单-填写收货地址</title>
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
        <asp:Panel ID="pnlConsignee" runat="server">
          <table>
            <tr>
              <td class="tdcenter" colspan="2">
                <strong>填写发货地址</strong>
              </td>
            </tr>
            <tr>
              <td class="tdright">送货地址：
              </td>
              <td>
                <asp:TextBox ID="txtAddr1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddr1" runat="server" ControlToValidate="txtAddr1" Display="Dynamic" ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td class="tdright">发票寄送地址：
              </td>
              <td>
                <asp:TextBox ID="txtAddr2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddr2" runat="server" ControlToValidate="txtAddr2" Display="Dynamic" ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td class="tdright">城市：
              </td>
              <td>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td class="tdright">省（自治区、直辖市）：
              </td>
              <td>
                <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" Display="Dynamic" ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td class="tdright">邮编：
              </td>
              <td>
                <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvZip" runat="server" ControlToValidate="txtZip" Display="Dynamic" ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revZip" runat="server" ControlToValidate="txtZip" Display="Dynamic" ErrorMessage="邮编错误！" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
              </td>
            </tr>
            <tr>
              <td class="tdright">联系电话：
              </td>
              <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="必填" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
            </tr>
            <tr>
              <td class="tdright">&nbsp;
              </td>
              <td>
                <asp:Button ID="btnSubmit" runat="server" Text="提交结算" OnClick="BtnSubmit_Click" />
              </td>
            </tr>
          </table>
        </asp:Panel>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
      </div>
      <%-- 下面<div>元素左右两侧均不允许其他浮动元素，并显示分隔线 --%>
      <div class="clear"></div>
    </section>
  </form>
</body>
</html>
