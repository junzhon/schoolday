using System;
public partial class Chap6_Request : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    lblMsg.Text = "服务器IP地址：" + Request.ServerVariables["LOCAL_ADDR"] + "<br />";
    lblMsg.Text += "客户端IP地址：" + Request.ServerVariables["REMOTE_ADDR"] + "<br />";
    lblMsg.Text += "浏览器类型：" + Request.Browser["Browser"] + "<br />";
    lblMsg.Text += "浏览器版本：" + Request.Browser["Version"] + "<br />";
    lblMsg.Text += "是否支持Cookies：" + Request.Browser["Cookies"];
  }
}