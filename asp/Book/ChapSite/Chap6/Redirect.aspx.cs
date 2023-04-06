using System;
public partial class Chap6_Redirect : System.Web.UI.Page
{
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    if (rdoltStatus.SelectedValue == "teacher")
    {
      //以查询字符串形式传递用户名信息并且被重定向到Teacher.aspx
      Response.Redirect("~/Chap6/Teacher.aspx?name=" + txtName.Text);
    }
    else
    {
      Response.Redirect("~/Chap6/Student.aspx?name=" + txtName.Text);
    }
  }
}