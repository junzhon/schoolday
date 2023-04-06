using MyPetShop.BLL;  //导入MyPetShop.BLL命名空间
using System;
using System.Web.UI;

public partial class NewUser : System.Web.UI.Page
{
  //新建MyPetShop.BLL业务逻辑层中的CustomerService类实例customerSrv
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

  protected void BtnReg_Click(object sender, EventArgs e)
  {
    if (Page.IsValid)
    {
      //调用CustomerService类中的IsNameExist()方法判断用户名是否重名
      if (customerSrv.IsNameExist(txtName.Text.Trim()))
      {
        lblMsg.Text = "用户名已存在！";
      }
      else
      {
        //调用CustomerService类中的Insert()方法插入新用户记录
        customerSrv.Insert(txtName.Text.Trim(), txtPwd.Text.Trim(), txtEmail.Text.Trim());
        Response.Redirect("Login.aspx?name=" + txtName.Text);
      }
    }
  }
}