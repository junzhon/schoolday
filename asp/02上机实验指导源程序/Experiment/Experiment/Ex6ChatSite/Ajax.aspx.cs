using System;

public partial class Ajax : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //输出Application变量message值，该值将传递给Chap.aspx中的text变量
    Response.Write(Application["message"].ToString());
  }
}