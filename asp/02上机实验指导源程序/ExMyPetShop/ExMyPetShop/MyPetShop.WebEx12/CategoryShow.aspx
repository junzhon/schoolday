<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoryShow.aspx.cs" Inherits="CategoryShow" %>

<%@ Register Src="~/UserControl/Category.ascx" TagPrefix="uc1" TagName="Category" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <uc1:Category runat="server" ID="Category" />
        </div>
    </form>
</body>
</html>
