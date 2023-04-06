using System;
public partial class Chap6_Teacher : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //获取并且显示从Redirect.aspx页面传递过来的用户名信息
    lblMsg.Text = Request.QueryString["name"] + "老师，欢迎您！";
  }
}