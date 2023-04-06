<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataManage.aspx.cs" Inherits="DataManage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Linq to SQL管理数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      分类Id：<asp:TextBox ID="txtCategoryId" runat="server" Width="250px">输入分类Id，只用于“修改”和“删除”</asp:TextBox>
      <br />
      <asp:Button ID="btnQueryAll" runat="server" OnClick="BtnQueryAll_Click" Text="显示全部" Width="80px" />
      <asp:Button ID="btnFuzzy" runat="server" OnClick="BtnFuzzy_Click" Text="模糊查找" Width="80px" />
      <asp:Button ID="btnInsert" runat="server" OnClick="BtnInsert_Click" Text="插入" Width="50px" />
      <asp:Button ID="btnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="修改" Width="50px" />
      <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="BtnDelete_Click" Width="50px" />
      <br />
      <br />
      <asp:GridView ID="gvCategory" runat="server">
      </asp:GridView>
    </div>
  </form>
</body>
</html>

