<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GroupValidation.aspx.cs" Inherits="Ex5_GroupValidation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>分组验证</title>
  <style type="text/css">
    .auto-style1 { width: 100%; }
    .auto-style2 { height: 21px; }
    .auto-style3 { height: 21px; width: 93px; }
    .auto-style4 { width: 93px; }
    .auto-style5 { height: 21px; width: 135px; }
    .auto-style6 { width: 135px; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table class="auto-style1">
        <tr>
          <td class="auto-style3" style="text-align: right">用户名：</td>
          <td class="auto-style5">
            <asp:TextBox ID="txtName" runat="server" Width="120px"></asp:TextBox>
          </td>
          <td class="auto-style2">
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="请输入用户名！" SetFocusOnError="True" ValidationGroup="groupName">*</asp:RequiredFieldValidator>
            <asp:Button ID="btnValidateName" runat="server" OnClick="BtnValidateName_Click" Text="用户名是否可用" ValidationGroup="groupName" />
            <asp:Label ID="lblName" runat="server"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="auto-style4" style="text-align: right">密码：</td>
          <td class="auto-style6">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="120px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="请输入密码！" SetFocusOnError="True" ValidationGroup="groupSubmit">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style4" style="text-align: right">确认密码：</td>
          <td class="auto-style6">
            <asp:TextBox ID="txtPasswordAgain" runat="server" TextMode="Password" Width="120px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvPasswordAgain" runat="server" ControlToValidate="txtPasswordAgain" Display="Dynamic" ErrorMessage="请输入确认密码！" SetFocusOnError="True" ValidationGroup="groupSubmit">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordAgain" Display="Dynamic" ErrorMessage="密码与确认密码不一致！" SetFocusOnError="True" ValidationGroup="groupSubmit"></asp:CompareValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style4" style="text-align: right">生日：</td>
          <td class="auto-style6">
            <asp:TextBox ID="txtBirthday" runat="server" Width="120px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvBirthday" runat="server" ControlToValidate="txtBirthday" Display="Dynamic" ErrorMessage="请输入生日！" SetFocusOnError="True" ValidationGroup="groupSubmit">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="rvBirthday" runat="server" ControlToValidate="txtBirthday" Display="Dynamic" ErrorMessage="日期应在1900-1-1到2020-1-1之间！" MaximumValue="2020-1-1" MinimumValue="1900-1-1" Type="Date" SetFocusOnError="True" ValidationGroup="groupSubmit"></asp:RangeValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style4" style="text-align: right">电话号码：</td>
          <td class="auto-style6">
            <asp:TextBox ID="txtTelephone" runat="server" Width="120px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvTelephone" runat="server" ControlToValidate="txtTelephone" Display="Dynamic" ErrorMessage="请输入电话号码！" SetFocusOnError="True" ValidationGroup="groupSubmit">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revTelephone" runat="server" ControlToValidate="txtTelephone" Display="Dynamic" ErrorMessage="电话号码格式应为021-66798304！" ValidationExpression="\d{3}-\d{8}" SetFocusOnError="True" ValidationGroup="groupSubmit"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style4" style="text-align: right">身份证号：</td>
          <td class="auto-style6">
            <asp:TextBox ID="txtIdentity" runat="server" Width="120px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvIdentity" runat="server" ControlToValidate="txtIdentity" Display="Dynamic" ErrorMessage="请输入身份证号！" SetFocusOnError="True" ValidationGroup="groupSubmit">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="cvIdentity" runat="server" ControlToValidate="txtIdentity" Display="Dynamic" ErrorMessage="身份证号错误！" SetFocusOnError="True" ValidationGroup="groupSubmit" OnServerValidate="CvIdentity_ServerValidate"></asp:CustomValidator>
          </td>
        </tr>
      </table>
      <asp:Button ID="btnSubmit" runat="server" Text="确定" ValidationGroup="groupSubmit" OnClick="BtnSubmit_Click" />
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
    <asp:ValidationSummary ID="vsName" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="groupName" />
    <asp:ValidationSummary ID="vsSubmit" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="groupSubmit" />
  </form>
</body>
</html>
