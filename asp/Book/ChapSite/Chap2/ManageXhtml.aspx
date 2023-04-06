<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageXhtml.aspx.cs" Inherits="Chap2_ManageXhtml" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>利用jQuery管理XHTML元素</title>
  <script src="../Scripts/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $("#hide").click(function () {
        $("#effect").hide();
      });
      $("#show").click(function () {
        $("#effect").show();
      });
      $(".flip").click(function () {
        $("#effect").fadeToggle();
      });
      $("#chgText").click(function () {
        $("#effect").text("我的内容被更改了！");
      });
      $("#chgCss").click(function () {
        $("*").css({ "background-color": "yellow", "font-family": "隶书" });
      });
    });
  </script>
</head>
<body>
  <form id="form1" runat="server">
    <div style="text-align: center">
      <span id="hide">隐藏</span>
      <span id="show" style="color: #008080">显示</span>
      <span class="flip">淡入或淡出</span>
      <span id="chgText" style="color: #008080">更改内容</span>
      <span id="chgCss">更改样式</span>
    </div>
    <div id="effect" style="background-color: #DCDCDC">单击“隐藏”我就消失；单击“显示”我就回来，单击“淡入或淡出”我就淡入或淡出。</div>
  </form>
</body>
</html>
