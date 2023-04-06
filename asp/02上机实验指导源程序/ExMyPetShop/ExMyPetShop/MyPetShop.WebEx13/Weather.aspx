<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Weather.aspx.cs" Inherits="Weather" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>天气预报查询页</title>
</head>
<body>
  <form id="form1" runat="server">
    <table style="width: 100%">
      <tr>
        <td colspan="2" style="text-align: center">
          <strong>国内外主要城市  三天天气预报</strong></td>
      </tr>
      <tr>
        <td colspan="2">
          <strong>选择省/洲</strong>
          <asp:DropDownList ID="ddlProvince" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
          </asp:DropDownList>
          &nbsp;
          <strong>选择城市</strong>
          <asp:DropDownList ID="dllCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
          </asp:DropDownList>
          &nbsp;
          <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td style="text-align: right">
          <asp:Label ID="lblCity" runat="server" />
        </td>
      </tr>
      <tr>
        <td style="width: 20%">
          <strong>今日实况</strong> </td>
        <td>
          <asp:Label ID="lblNow" runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          <strong>天气预报</strong>
          <span style="color: #FF0000;">(今天)</span></td>
        <td>
          <asp:Label ID="lblToday" runat="server" />
          &nbsp;
          <asp:Image ID="imgWeathertrendsTdS" runat="server" />
          &nbsp;
          <asp:Image ID="imgWeathertrendsTdE" runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          <strong>天气预报</strong>
          <span style="color: #008000;">(明天)</span></td>
        <td>
          <asp:Label ID="lblTomorrow" runat="server" />
          &nbsp;
          <asp:Image ID="imgWeathertrendsTmS" runat="server" />
          &nbsp;
          <asp:Image ID="imgWeathertrendsTmE" runat="server" />
        </td>
      </tr>
      <tr>
        <td>
          <strong>天气预报</strong>
          <span style="color: #000080;">(后天)</span> </td>
        <td>
          <asp:Label ID="lblAfterTmr" runat="server" />
          &nbsp;
          <asp:Image ID="imgWeathertrendsAfS" runat="server" />
          &nbsp;
          <asp:Image ID="imgWeathertrendsAfE" runat="server" />
        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td style="text-align: right">
          <strong>预报时间：</strong><asp:Label ID="lblTime" runat="server" />
        </td>
      </tr>
    </table>
  </form>
</body>
</html>
