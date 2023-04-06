using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex3_MultiTableReverse : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //控制行数
    for (int i = 1; i <= 9; i++)
    {
      //输出1行
      for (int j = i; j <= 9; j++)
      {
        //输出1个乘法算式
        Response.Write(i.ToString() + "×" + j.ToString() + "=" + (i * j).ToString());
        //输出2个空格
        Response.Write("&nbsp;&nbsp;&nbsp;");
      }
      //输出换行
      Response.Write("<br/>");
    }
  }
}