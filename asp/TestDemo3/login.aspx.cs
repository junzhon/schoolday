using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dotnetApp;
using MyDBUtils;

namespace TestDemo3
{
    public partial class _1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var name = Request["regName"];
                if (!string.IsNullOrEmpty(name))
                {
                    if (DBHelper.ExecuteQuery("select * from WebUser where username='" + name + "'").Tables[0].Rows.Count > 0)
                    {
                        //检测该用户名是否注册
                        Response.Write("<script language=javascript>alert('注册失败，用户名已被使用！');</script>");
                    }
                    else
                    {
                        var passwd = Request["regPassword"];
                        passwd = MD5Helper.ToMD5(passwd.ToString());
                        var telephone = Request["regTelephone"];
                        var sql = "INSERT INTO WebUser(username,password,telephone) VALUES ('{0}','{1}','{2}')";
                        sql = string.Format(sql, name, passwd, telephone);
                        if (SqlHelper.ExecuteSql(sql) > 0)
                        {
                            var str = "注册成功，您的用户名：" + name + " ，现在去登录试试吧~";
                            Response.Write("<script language=javascript>alert('" + str + "');</script>");
                        }
                        else
                        {
                            Response.Write("<script language=javascript>alert('注册失败，数据库出错！');</script>");
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            string username = Request.Params["inputEmail"].ToString();
            string password = MD5Helper.ToMD5(Request.Params["inputPassword"].ToString());
       
            if (DBHelper.ExecuteQuery("select * from WebUser where username='" + username + "' and password='" + password + "'").Tables[0].Rows.Count > 0)
            {
                //放一个Cookie来指示是哪名用户登陆了
                HttpCookie cookie = new HttpCookie("login_name", username);
                Response.Cookies.Add(cookie);
                Response.Redirect("indextem.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>alert('用户名或密码错误');</script>");
            }
        }
    }


       
 
}