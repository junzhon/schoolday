using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingCity.AdminsManager
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        SQLHelper sqlhelper = new SQLHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
 
        }

        protected void VCodeRefresh_Click(object sender, ImageClickEventArgs e)
{
             VCode.ImageUrl = "../VCode.aspx";
}

protected void btnLogin_Click(object sender, EventArgs e)
{
    if (txtAdminName.Text == "" || txtAdminPwd.Text == "")
    {
        Response.Write("<script>alert('请输入账号和密码！')</script>");
        return;
    }
    if (txtVCode.Text == "")
    {
        Response.Write("<script>alert('请输入验证码！')</script>");
        return;
    }
    if (Request.Cookies["CheckCode"].Value != txtVCode.Text)
    {
        Response.Write("<script>alert('验证码有误！')</script>");
        return;
    }
    if (!sqlhelper.AdminLogin(txtAdminName.Text, txtAdminPwd.Text))
    {
        Response.Write("<script>alert('账号或密码有误！')</script>");
    }
    else
    {
     
        Session["AdminName"] = txtAdminName.Text;//创建session对象
        Response.Redirect("~/AdminsManager/AdminIndex.aspx");
    }
}
    }
}