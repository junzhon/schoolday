<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calculator.aspx.cs" Inherits="Ex4_Calculator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>简易计算器</title>
</head>
<body>
  <form id="form1" runat="server">
    <div style="text-align: center;">
      简易计算器<br />
      <asp:TextBox ID="txtDisplay" runat="server" ReadOnly="True" Width="110px"></asp:TextBox><br />
      <asp:Button ID="btnOne" runat="server" Text="1" OnClick="BtnOne_Click" Width="40px" />
      <asp:Button ID="btnTwo" runat="server" Text="2" OnClick="BtnTwo_Click" Width="40px" />
      <asp:Button ID="btnThree" runat="server" Text="3" OnClick="BtnThree_Click" Width="40px" /><br />
      <asp:Button ID="btnAdd" runat="server" Text="+" OnClick="BtnAdd_Click" Width="40px" />
      <asp:Button ID="btnSubtract" runat="server" Text="-" OnClick="BtnSubtract_Click" Width="40px" />
      <asp:Button ID="btnEqual" runat="server" Text="=" OnClick="BtnEqual_Click" Width="40px" />
    </div>
  </form>
</body>
</html>
