<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomClient.aspx.cs" Inherits="Chap5_CustomClient" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>客户端验证必须输入一个偶数</title>
  <script>
    function clientValidate(source, args) {
      if ((args.Value % 2) == 0)
        args.IsValid = true;
      else
        args.IsValid = false;
    }
  </script>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      数值：<asp:TextBox ID="txtInput" runat="server"></asp:TextBox>
      <asp:CustomValidator ID="cvInput" runat="server" ClientValidationFunction="clientValidate" ControlToValidate="txtInput">不是一个偶数！</asp:CustomValidator><br />
      <asp:Button ID="btnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="确定" />
      <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
  </form>
</body>
</html>
