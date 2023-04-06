using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex3_Multiplication : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    for (int i = 1; i <= 9; i++)  //i变量控制行数
    {
      for (int j = 1; j <= i; j++)  //输出一行
      {
        //输出一个乘法算式
        Response.Write(i.ToString() + "×" + j.ToString() + "=" + (i * j).ToString());
        Response.Write("&nbsp;&nbsp;");  //输出二个空格
      }
      Response.Write("<br />");  //输出换行
    }
  }
}