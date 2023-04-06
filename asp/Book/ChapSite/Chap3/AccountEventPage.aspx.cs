using System;
public partial class Chap3_AccountEventPage : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    AccountEvent accountEvent = new AccountEvent("03401", "李明", 200);
    accountEvent.Overdraw += new EventHandler(account_Overdraw);  //注册Overdraw事件
    accountEvent.Acquire(400);  //取款400
  }

  private void account_Overdraw(object sender, EventArgs e)  //Overdraw事件处理代码
  {
    Response.Write("账户金额不足了！");
  }
}