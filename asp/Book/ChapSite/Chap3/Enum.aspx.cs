using System;
public partial class Chap3_Enum : System.Web.UI.Page
{
  enum Color  //声明枚举类型Color
  {
    Red = 1, Green, Blue
  }
  protected void Page_Load(object sender, EventArgs e)
  {
    Color enumColor = Color.Green;
    int i = (int)Color.Green;
    Response.Write("enumColor的值为：" + enumColor + "<br />");  //输出Green
    Response.Write("i的值为：" + i);  //输出2
  }
}