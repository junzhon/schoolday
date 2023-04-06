<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordStrengthTable.aspx.cs" Inherits="Chap12_PasswordStrengthTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用PasswordStrength控件</title>
  <style type="text/css">
    .BarWeak { color: Red; background-color: Red; }
    .BarAverage { color: Blue; background-color: Blue; }
    .BarGood { color: Green; background-color: Green; }
    .BarBorder { width: 100px; }
    .table { width: 98%; }
    .div { width: 338px; }
    .td { width: 80px; text-align: right; }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="div">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
      <table class="table">
        <tr>
          <td class="td">密码：
          </td>
          <td>
            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
            <ajaxToolkit:PasswordStrength ID="txtPwd_PasswordStrength" runat="server" TargetControlID="txtPwd" PrefixText="强度: " TextStrengthDescriptions="弱; 中; 强" />
          </td>
        </tr>
        <tr>
          <td class="td">确认密码：
          </td>
          <td>
            <asp:TextBox ID="txtPwdCfm" runat="server" TextMode="Password"></asp:TextBox>
            <ajaxToolkit:PasswordStrength ID="txtPwdCfm_PasswordStrength" runat="server" TargetControlID="txtPwdCfm" BarBorderCssClass="BarBorder" StrengthIndicatorType="BarIndicator" StrengthStyles="BarWeak; BarAverage; BarGood" />
          </td>
        </tr>
      </table>
    </div>
  </form>
</body>
</html>
