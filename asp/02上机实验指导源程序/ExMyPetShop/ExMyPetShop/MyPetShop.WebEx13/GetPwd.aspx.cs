using MyPetShop.BLL;
using System;
using System.Web.UI;
public partial class GetPwd : System.Web.UI.Page
{
  CustomerService customerSrv = new CustomerService();
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
  protected void BtnResetPwd_Click(object sender, EventArgs e)
  {
    if (Page.IsValid)
    {
      //调用CustomerService类中的IsNameExist()方法判断输入的用户名是否存在
      if (!customerSrv.IsNameExist(txtName.Text.Trim()))
      {
        lblMsg.Text = "用户名不存在！";
      }
      else
      {
        //调用CustomerService类中的IsEmailExist()方法判断输入的邮箱是否正确
        if (!customerSrv.IsEmailExist(txtName.Text.Trim(), txtEmail.Text.Trim()))
        {
          lblMsg.Text = "邮箱不正确！";
        }
        else
        {
          //调用CustomerService类中的ResetPassword()方法重置用户密码为用户名
          customerSrv.ResetPassword(txtName.Text.Trim(), txtEmail.Text.Trim());
          //新建自定义的EmailSender类实例emailSender对象
          EmailSender emailSender = new EmailSender(txtEmail.Text.Trim(), txtName.Text.Trim());
          //调用自定义的EmailSender类中的Send()方法发送邮件
          emailSender.Send();
          lblMsg.Text = "密码已发送至邮箱！";
        }
      }
    }
  }
}