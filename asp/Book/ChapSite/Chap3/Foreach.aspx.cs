using System;
public partial class Chap3_Foreach : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    string[] strNames = { "张犯", "周振", "王涛" };  //数组赋值
    Array.Sort(strNames);  //升序排列数组
    foreach (string n in strNames)  //逐个输出数组元素
    {
      Response.Write("姓名：" + n + "<br />");
    }
  }
}