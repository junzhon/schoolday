using System;

public partial class ChatLogin : System.Web.UI.Page
{
  //user数组存放所有的用户名和密码。在实际工程中，数据应来源于数据库
  string[,] user = { { "张三", "111111" }, { "王五", "111111" }, { "李四", "111111" } };

  protected void Page_Load(object sender, EventArgs e)
  {
    txtName.Focus();  //焦点定位在“用户名”文本框
  }

  protected void BtnLogin_Click(object sender, EventArgs e)
  {
    //在user数组中循环查找能匹配的用户名和密码
    for (int i = 0; i <= 2; i++)
    {
      if (txtName.Text == user[i, 0] && txtPassword.Text == user[i, 1])  //匹配成功
      {
        Session["user"] = user[i, 0];  //将用户名存入Session变量user
        Response.Redirect("Chat.aspx");  //将页面重定向到聊天页
      }
    }
    //在user数组中找不到匹配的用户，输出“用户名或密码错误！”提示信息
    Response.Write("<script type='text/javascript'>alert('用户名或密码错误！');</script>");
  }
}