using System;
using System.Web.UI;
public partial class Chap5_Regular : System.Web.UI.Page
{
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    if (Page.IsValid)
    {
      lblMsg.Text = "验证通过！";
    }
  }
}