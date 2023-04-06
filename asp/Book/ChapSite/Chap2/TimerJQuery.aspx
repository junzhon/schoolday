<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TimerJQuery.aspx.cs" Inherits="Chap2_TimerJQuery" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用jQuery实现一个时间数据来源于服务器端的时钟</title>
  <script src="../Scripts/jquery-3.2.1.min.js"></script>
  <%-- refresh()函数以500毫秒为间隔，局部刷新div层divMsg。其中$.ajax()调用jQuery的ajax()方法，用于执行异步请求 --%>
  <script type="text/javascript">
    function refresh() {
      $.ajax({
        url: "Ajax.aspx",  //发送异步请求的页面地址        
        cache: false,  //不缓存异步请求的页面
        success: function (datetime) {
          $("#divMsg").text(datetime);  //设置div层divMsg的呈现内容为服务器端输出的系统时间
        }
      });
      setTimeout("refresh()", 500);  //过500毫秒后重复调用自定义的refresh()函数      
    }
  </script>
</head>
<body onload="refresh()">
  <form id="form1" runat="server">
    <div id="divMsg"></div>
  </form>
</body>
</html>
