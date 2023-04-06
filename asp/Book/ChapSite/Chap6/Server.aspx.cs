using System;
public partial class Chap6_Server : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //直接输出时浏览器将<hr />解释为一条直线
    Response.Write("This is a dog <hr />");
    //编码后浏览器将<hr />解释为一般字符
    Response.Write(Server.HtmlEncode("This is a dog <hr />") + "<br />");
    //单击链接时将丢失“张”后面的信息
    Response.Write("<a href=Student.aspx?name=张  三>Student.aspx</a><br />");
    //编码后再单击链接时不会丢失“张”后面的信息
    Response.Write("<a href=Student.aspx?name=" + Server.UrlEncode("张  三") + ">Student.aspx(UrlEncode)</a>");
  }
}