using System;
public partial class Chap12_MultiUpdatePanel : System.Web.UI.Page
{
  protected void BtnUp1_Click(object sender, EventArgs e)
  {
    lblUp1.Text = "刷新时间：" + DateTime.Now.ToLongTimeString();
  }
  protected void BtnUp2_Click(object sender, EventArgs e)
  {
    lblUp2.Text = "刷新时间：" + DateTime.Now.ToLongTimeString();
  }
}