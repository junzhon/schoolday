<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridUpdateTable.aspx.cs" Inherits="Chap8_GridUpdateTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>结合GridView和独立页修改数据</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False">
        <Columns>
          <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" />
          <asp:BoundField DataField="Name" HeaderText="Name" />
          <asp:BoundField DataField="Descn" HeaderText="Descn" />
          <asp:HyperLinkField DataNavigateUrlFields="CategoryId" DataNavigateUrlFormatString="~/Chap8/UpdateTable.aspx?CategoryId={0}" Text="修改" />
        </Columns>
      </asp:GridView>
    </div>
  </form>
</body>
</html>
