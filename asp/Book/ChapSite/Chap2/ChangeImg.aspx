<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeImg.aspx.cs" Inherits="Chap2_ChangeImg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>实现图片动态变化效果</title>
  <script>
    function mouseOver() {
      document.getElementById("mouse").src = "../Images/mouseOver.jpg";
    }
    function mouseOut() {
      document.getElementById("mouse").src = "../Images/mouseOut.jpg";
    }
  </script>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <a href="http://www.sina.com" target="_blank">
        <img id="mouse" border="0" alt="访问sina!" src="../Images/mouseOut.jpg" onmouseover="mouseOver()" onmouseout="mouseOut()" />
      </a>
    </div>
  </form>
</body>
</html>
