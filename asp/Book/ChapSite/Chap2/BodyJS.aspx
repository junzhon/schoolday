<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BodyJS.aspx.cs" Inherits="Chap2_BodyJS" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>熟悉&lt;body&gt;元素中的JavaScript代码</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <script>
        document.write("在&lt;body&gt;元素中");
      </script>
    </div>
  </form>
</body>
</html>
