using MyPetShop.BLL;
using System;
using System.Web.UI;
public partial class Login : System.Web.UI.Page
{
  CustomerService customerSrv = new CustomerService();
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      //NewUser.aspx页面传递过来的查询字符串变量name值非空
      if (Request.QueryString["name"] != null)
      {
        txtName.Text = Request.QueryString["name"];
        lblMsg.Text = "注册成功，请登录!";
      }
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

  protected void BtnLogin_Click(object sender, EventArgs e)
  {
    if (Page.IsValid)
    {
      //调用CustomerService类中的CheckLogin()方法检查输入的用户名和密码是否正确
      int customerId = customerSrv.CheckLogin(txtName.Text.Trim(), txtPwd.Text.Trim());
      if (customerId > 0)   //用户名和密码正确
      {
        Session.Clear();   //清空Session中保存的内容        
        if (txtName.Text.Trim() == "admin")  //管理员登录
        {
          Session["AdminId"] = customerId;
          Session["AdminName"] = txtName.Text;
          Response.Redirect("~/Admin/Default.aspx");
        }
        else  //一般用户登录
        {
          Session["CustomerId"] = customerId;
          Session["CustomerName"] = txtName.Text;
          Response.Redirect("~/Default.aspx");
        }
      }
      else  //用户名或密码错误
      {
        lblMsg.Text = "用户名或密码错误！";
      }
    }
  }
}