using System;
public partial class Chap3_AccountPage : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    Account account = new Account("03401", "李明", 200);  //建立account对象  
    Response.Write("初始金额为：" + account.Balance.ToString() + "<br />");  //输出初始金额信息      
    account.Deposit(100);  //存款100      
    Response.Write("存款100后，" + account.Name + "的账户金额为：" + account.Balance.ToString() + "<br />");  //输出存款100后账户金额信息      
    account.Acquire(150);  //取款150      
    Response.Write("取款150后，" + account.Name + "的账户金额为：" + account.Balance.ToString());  //输出取款150后账户金额信息
  }
}