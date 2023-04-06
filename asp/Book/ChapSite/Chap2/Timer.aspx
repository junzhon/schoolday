<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Timer.aspx.cs" Inherits="Chap2_Timer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>实现一个简易时钟</title>
  <script>
    function startTimer() {
      var today = new Date();  //获取客户端当前系统日期
      var h = today.getHours();
      var m = today.getMinutes();
      var s = today.getSeconds();
      m = checkTime(m);  //调用自定义的checkTime()函数，在小于10的数字前加0
      s = checkTime(s);
      document.getElementById("divTimer").innerHTML = h + ":" + m + ":" + s;  //设置divTimer层显示内容
      setTimeout("startTimer()", 1000);  //过1秒后重复调用自定义的startTimer()函数
    }
    //checkTime(i)检查i参数值。如果i<10，就在数字前加0
    function checkTime(i) {
      if (i < 10) {
        i = "0" + i;
      }
      return i;
    }
  </script>
</head>
<body onload="startTimer()">
  <form id="form1" runat="server">
    <div id="divTimer"></div>
  </form>
</body>
</html>
