using MyPetShop.BLL;
using System;
using System.Web.UI;
public partial class ChangePwd : System.Web.UI.Page
{
  CustomerService customerSrv = new CustomerService();
  protected void Page_Load(object sender, EventArgs e)
  {
    if (Session["CustomerId"] == null)  //一般用户未登录
    {
      Response.Redirect("~/Login.aspx");
    }
    else
    {
      lblWelcome.Text = "您好, " + Session["CustomerName"].ToString();
      lnkbtnPwd.Visible = true;
      lnkbtnOrder.Visible = true;
      lnkbtnLogout.Visible = true;
    }
  }
  protected void LnkbtnRegister_Click(object sender, EventArgs e)
  {
    Session.Clear();    //注销当前用户
    Response.Redirect("~/NewUser.aspx");
  }

  protected void LnkbtnLogin_Click(object sender, EventArgs e)
  {
    Session.Clear();    //注销当前用户
    Response.Redirect("~/Login.aspx");
  }
  protected void LnkbtnLogout_Click(object sender, EventArgs e)
  {
    Session.Clear();    //注销当前用户
    Response.Redirect("~/Default.aspx");
  }
  protected void BtnChangePwd_Click(object sender, EventArgs e)
  {
    if (Page.IsValid)
    {
      //调用CustomerService类中的CheckLogin()方法检查Session变量CustomerName关联的用户名和输入的原密码，返回值大于0表示输入的原密码正确
      if (customerSrv.CheckLogin(Session["CustomerName"].ToString(), txtOldPwd.Text) > 0)
      {
        customerSrv.ChangePassword(Convert.ToInt32(Session["CustomerId"]), txtPwd.Text);
        lblMsg.Text = "密码修改成功！";
      }
      else  //输入的原密码不正确
      {
        lblMsg.Text = "原密码不正确！";
      }
    }
  }
}