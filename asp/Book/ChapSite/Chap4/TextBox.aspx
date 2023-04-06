<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox.aspx.cs" Inherits="Chap4_TextBox" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>综合运用TextBox控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      用户名：<asp:TextBox ID="txtName" runat="server" AutoPostBack="True" OnTextChanged="TxtName_TextChanged" Width="150px"></asp:TextBox>
      <asp:Label ID="lblValidate" runat="server"></asp:Label><br />
      密码：<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Style="position: relative; left: 16px" Width="150px"></asp:TextBox><br />
      邮箱：<asp:TextBox ID="txtMail" runat="server" AutoCompleteType="Email" Style="position: relative; left: 16px" Width="150px"></asp:TextBox><br />
      <asp:Button ID="btnSubmit" runat="server" Text="确认" />
    </div>
  </form>
</body>
</html>
