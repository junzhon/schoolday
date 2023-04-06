using System;
public partial class Chap6_Student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      lblMsg.Text = Request.QueryString["name"] + "同学，欢迎您！";
    }
}