using System;
public partial class Chap6_Session : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (Session["Name"] != null)
    {
      lblMsg.Text = Session["Name"] + "，欢迎您！";
    }
    else
    {
      Response.Redirect("~/Chap6/SessionLogin.aspx");
    }
  }
}