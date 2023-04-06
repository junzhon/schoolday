using System;
public partial class Chap4_IsPostBack : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      Response.Write("页面第一次加载！");
    }
  }
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    Response.Write("执行Click事件处理代码！");
  }
}