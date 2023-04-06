<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MultiValidateTable.aspx.cs" Inherits="Chap5_MultiValidateTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>综合运用验证控件（Table布局）</title>
  <style type="text/css">
    .table { width: 100%; }
    .auto-style2 { width: 84px; }
    .auto-style3 { width: 154px; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table class="table">
        <tr>
          <td class="auto-style2">用户名：</td>
          <td class="auto-style3">
            <asp:TextBox ID="txtName" runat="server" Width="180px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="请输入用户名！" SetFocusOnError="True">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style2">密码：</td>
          <td class="auto-style3">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="请输入密码！" SetFocusOnError="True">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style2">确认密码：</td>
          <td class="auto-style3">
            <asp:TextBox ID="txtPasswordAgain" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvPasswordAgain" runat="server" ControlToValidate="txtPasswordAgain" ErrorMessage="请输入确认密码！" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordAgain" ErrorMessage="密码不一致！" SetFocusOnError="True"></asp:CompareValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style2">电话号码：</td>
          <td class="auto-style3">
            <asp:TextBox ID="txtTelephone" runat="server" Width="180px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvTelephone" runat="server" ControlToValidate="txtTelephone" ErrorMessage="请输入电话号码！" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revTelephone" runat="server" ControlToValidate="txtTelephone" ErrorMessage="格式为021-66798304！" SetFocusOnError="True" ValidationExpression="\d{3}-\d{8}"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style2">身份证号：</td>
          <td class="auto-style3">
            <asp:TextBox ID="txtIdentity" runat="server" Width="180px"></asp:TextBox>
          </td>
          <td>
            <asp:RequiredFieldValidator ID="rfvIdentity" runat="server" ControlToValidate="txtIdentity" ErrorMessage="请输入身份证号！" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="cvIdentity" runat="server" ControlToValidate="txtIdentity" ErrorMessage="身份证号错误！" OnServerValidate="CvInput_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
          </td>
        </tr>
      </table>
      <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="确定" />
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    </div>
  </form>
</body>
</html>
