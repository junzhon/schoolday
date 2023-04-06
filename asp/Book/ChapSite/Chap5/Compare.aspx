<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Compare.aspx.cs" Inherits="Chap5_Compare" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用CompareValidator控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      密码：<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
      确认密码：<asp:TextBox ID="txtPasswordAgain" runat="server" TextMode="Password"></asp:TextBox>
      <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordAgain">密码与确认密码不一致！</asp:CompareValidator><br />
      答案：<asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
      <asp:CompareValidator ID="cvAnswer" runat="server" ControlToValidate="txtAnswer" ValueToCompare="A">答案错误！</asp:CompareValidator><br />
      金额：<asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
      <asp:CompareValidator ID="cvAmount" runat="server" ControlToValidate="txtAmount" Operator="DataTypeCheck" Type="Currency">必须输入Currency类型！</asp:CompareValidator>
    </div>
  </form>
</body>
</html>
