﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Course.aspx.cs" Inherits="Ex4_Course" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>联动的教师课表</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      学年：<asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" Width="100px">
      </asp:DropDownList>
      学期：<asp:DropDownList ID="ddlTerm" runat="server" AutoPostBack="True" Width="40px">
      </asp:DropDownList>
      分院：<asp:DropDownList ID="ddlCollege" runat="server" AutoPostBack="True" Width="120px" OnSelectedIndexChanged="DdlCollege_SelectedIndexChanged">
      </asp:DropDownList>
      教师：<asp:DropDownList ID="ddlTeacher" runat="server" AutoPostBack="True">
      </asp:DropDownList>
    </div>
  </form>
</body>
</html>
