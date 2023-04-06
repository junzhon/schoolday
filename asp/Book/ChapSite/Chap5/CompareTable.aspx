<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompareTable.aspx.cs" Inherits="Chap5_CompareTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用CompareValidator控件</title>
  <style type="text/css">
    .auto-style1 { width: 100%; }
    .auto-style3 { width: 157px; }
    .auto-style4 { width: 82px; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table class="auto-style1">
        <tr>
          <td class="auto-style4">密码：</td>
          <td class="auto-style3">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
          </td>
          <td></td>
        </tr>
        <tr>
          <td class="auto-style4">确认密码：</td>
          <td class="auto-style3">
            <asp:TextBox ID="txtPasswordAgain" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
          </td>
          <td>
            <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordAgain" Display="Dynamic">密码与确认密码不一致！</asp:CompareValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style4">答案：</td>
          <td class="auto-style3">
            <asp:TextBox ID="txtAnswer" runat="server" Width="180px"></asp:TextBox>
          </td>
          <td>
            <asp:CompareValidator ID="cvAnswer" runat="server" ControlToValidate="txtAnswer" ValueToCompare="A" Display="Dynamic">答案错误！</asp:CompareValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style4">金额：</td>
          <td class="auto-style3">
            <asp:TextBox ID="txtAmount" runat="server" Width="180px"></asp:TextBox>
          </td>
          <td>
            <asp:CompareValidator ID="cvAmount" runat="server" ControlToValidate="txtAmount" Operator="DataTypeCheck" Type="Currency" Display="Dynamic">必须输入Currency类型！</asp:CompareValidator>
          </td>
        </tr>
      </table>
    </div>
  </form>
</body>
</html>
