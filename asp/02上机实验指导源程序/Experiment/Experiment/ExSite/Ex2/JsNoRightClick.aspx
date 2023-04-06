<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JsNoRightClick.aspx.cs" Inherits="Ex2_JsNoRightClick" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>禁止使用鼠标右键</title>
  <script type="text/javascript">
    function click() {
      if (event.button == 2) {
        alert('您想看什么？');
      }
    }
    document.onmousedown = click;
  </script>
</head>
<body>
  <form id="form1" runat="server">
    <div>
    </div>
  </form>
</body>
</html>
