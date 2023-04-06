<%@ Page Title="用户登录" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphLeft" runat="Server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphRight" runat="Server">
</asp:Content>

