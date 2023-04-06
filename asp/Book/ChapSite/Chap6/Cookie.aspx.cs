using System;
public partial class Chap6_Cookie : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (Request.Cookies["Name"] != null)
    {
      lblMsg.Text = Request.Cookies["Name"].Value + "，欢迎您回来！";
    }
    else
    {
      Response.Redirect("~/Chap6/CookieLogin.aspx");
    }
  }
}