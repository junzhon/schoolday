using System;
public partial class Chap12_CalendarExtender : System.Web.UI.Page
{
  protected void BtnSearch_Click(object sender, EventArgs e)
  {
    lblDisplay.Text = "显示从" + txtStartTime.Text + "到" + txtEndTime.Text + "的数据！";
    //实际情况常显示数据库中的数据
  }
}