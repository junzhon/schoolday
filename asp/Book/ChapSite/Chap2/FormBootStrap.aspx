<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormBootstrap.aspx.cs" Inherits="Chap2_FormBootstrap" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>利用Bootstrap设计表单</title>
  <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <script src="../Scripts/jquery-3.2.1.min.js"></script>
  <script src="../Scripts/bootstrap.min.js"></script>
</head>
<body>
  <form id="form1" runat="server">
    <div class="form-group">
      <label for="inputEmail">邮箱：</label>
      <input type="email" class="form-control" id="inputEmail" placeholder="请输入邮箱地址" />
    </div>
    <div class="form-group">
      <label for="inputPassword">密码：</label>
      <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码" />
    </div>
    <div class="checkbox">
      <label>
        <input type="checkbox" />
        记住我
      </label>
    </div>
    <asp:Button ID="btnSubmit" CssClass="btn btn-default" runat="server" Text="提交" />
  </form>
</body>
</html>
