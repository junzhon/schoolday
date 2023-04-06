using System;
public partial class Chap3_For : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    for (int i = 1; i < 5; i++)   //i控制行数
    {
      for (int k = 1; k <= 20 - 2 * i; k++)  //控制输出每行前的空格数
      {
        Response.Write("&nbsp;");
      }
      for (int j = 1; j <= 2 * i - 1; j++)  //控制输出每行的*数
      {
        Response.Write("*");
      }
      Response.Write("<br />");  //换行
    }
  }
}