using System;
public partial class Chap3_Switch : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    DateTime dtToday = DateTime.Today;  //获取今天的系统日期
    switch (dtToday.DayOfWeek.ToString()) //枚举值转换为字符型
    {
      case "Monday":
        Response.Write("今天是星期一！");
        break;
      case "Tuesday":
        Response.Write("今天是星期二！");
        break;
      case "Wednesday":
        Response.Write("今天是星期三！");
        break;
      case "Thursday":
        Response.Write("今天是星期四！");
        break;
      case "Friday":
        Response.Write("今天是星期五！");
        break;
      default:
        Response.Write("今天可以休息了！");
        break;
    }
  }
}