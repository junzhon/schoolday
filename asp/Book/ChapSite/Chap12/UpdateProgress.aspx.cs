using System;
public partial class Chap12_UpdateProgress : System.Web.UI.Page
{
  protected void BtnRefresh_Click(object sender, EventArgs e)
  {
    //为查看UpdateProgress控件效果，延时10秒
    System.Threading.Thread.Sleep(TimeSpan.FromSeconds(10));
    lblTime.Text = DateTime.Now.ToLongTimeString();
  }
}