using System;
using System.Web;
public partial class Chap6_CookieLoginTable : System.Web.UI.Page
{
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    //实际工程需与数据库中存储的用户名和密码比较
    if (txtName.Text == "leaf" && txtPassword.Text == "111")
    {
      HttpCookie cookie = new HttpCookie("Name");
      cookie.Value = "leaf";
      cookie.Expires = DateTime.Now.AddDays(1);
      Response.Cookies.Add(cookie);
    }
  }
}