<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>聊天页面</title>  
  <script src="Scripts/jquery-3.2.1.min.js"></script>
  <%-- refresh()函数以500毫秒为间隔，连续地局部刷新div层divMsg。其中$.ajax()调用jQuery提供的ajax()方法，用于执行异步请求 --%>
  <script type="text/javascript">
    function refresh() {
      $.ajax({
        url: "Ajax.aspx",  //发送异步请求的页面地址
        cache: false,  //不缓存异步请求的页面
        success: function (text) {
          //设置div层divMsg的innerHTML属性，其中text为异步请求页面返回的数据
          document.getElementById("divMsg").innerHTML = text;
        },  //异步请求成功时执行的函数
        error: function (jqXHR, textStatus, errorThrown) {
          alert("网络连接有问题，请重试！");
        }  //异步请求失败时执行的函数
      });
      setTimeout("refresh()", 500);  //过500毫秒后重复调用自定义的refresh()函数     
    }
  </script>
</head>
<body onload="refresh()">
  <form id="form1" runat="server">
    <div id="divMsg"></div>
    <div>
      <asp:Label ID="lblName" runat="server"></asp:Label>
      <br />
      <asp:TextBox ID="txtMessage" runat="server" Height="90px" TextMode="MultiLine" Width="279px"></asp:TextBox>
      <br />
      <asp:Button ID="btnSend" runat="server" OnClick="BtnSend_Click" Text="发送" />
    </div>
  </form>
</body>
</html>
