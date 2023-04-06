using System;
public partial class Chap6_Application : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    lblMsg.Text = Application["VisitNumber"].ToString();  //显示网站在线人数
  }
}