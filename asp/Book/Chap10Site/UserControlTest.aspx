<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserControlTest.aspx.cs" Inherits="UserControlTest" %>

<%@ Register Src="SearchUserControl.ascx" TagName="SearchUserControl" TagPrefix="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>用户控件测试页</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <uc:SearchUserControl ID="SearchUserControl1" runat="server" Text="查找" />
    </div>
  </form>
</body>
</html>
