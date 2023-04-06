using System;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Chap5_CustomServer : System.Web.UI.Page
{
  protected void CvInput_ServerValidate(object source, ServerValidateEventArgs args)
  {
    int value = int.Parse(args.Value);  //获取被验证控件中输入的值
    if ((value % 2) == 0)
    {
      args.IsValid = true;
    }
    else
    {
      args.IsValid = false;
    }
  }
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    if (Page.IsValid)
    {
      lblMsg.Text = "验证通过！";
    }
  }
}