using System;
public partial class Chap4_TextBox : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    txtName.Focus();
  }
  protected void TxtName_TextChanged(object sender, EventArgs e)
  {
    if (txtName.Text == "leaf")
    {
      lblValidate.Text = "用户名已占用！";
    }
    else
    {
      lblValidate.Text = "√";
    }
  }
}