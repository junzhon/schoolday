<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>用户登录</title>
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
      <div class="leftside">
        <table>
          <tr>
            <td class="tdcenter" colspan="2">登录</td>
          </tr>
          <tr>
            <td class="tdright">用户名:</td>
            <td>
              <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
            <td>
              <asp:RequiredFieldValidator ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" ID="rfvName" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td class="tdright">密码:</td>
            <td>
              <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox></td>
            <td>
              <asp:RequiredFieldValidator ControlToValidate="txtPwd" Display="Dynamic" ForeColor="Red" ID="rfvPwd" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="tdright">
              <asp:Button ID="btnLogin" runat="server" Text="立即登录" OnClick="BtnLogin_Click" />
            </td>
          </tr>
          <tr>
            <td><a href="NewUser.aspx">我要注册！</a></td>
            <td class="tdcenter"><a href="GetPwd.aspx">忘记密码？</a></td>
          </tr>
          <tr>
            <td colspan="2" class="tdright">
              <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
          </tr>
        </table>
      </div>
      <%-- 下面<div>元素左右两侧均不允许其他浮动元素，并显示分隔线 --%>
      <div class="clear"></div>
    </section>
  </form>
</body>
</html>
