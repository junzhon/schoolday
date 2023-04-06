using System;
public partial class Chap6_QueryString2 : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //获取从QueryString1.aspx中传递过来的查询字符串值
    lblMsg.Text = Request.QueryString["username"] + "，你的年龄是：" + Request.QueryString["age"];
  }
}