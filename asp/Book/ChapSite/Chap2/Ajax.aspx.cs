using System;
public partial class Ajax : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //输出当前服务器端的系统时间，该值将传递给TimerJQuery.aspx中的datetime变量
    Response.Write(DateTime.Now);
  }
}