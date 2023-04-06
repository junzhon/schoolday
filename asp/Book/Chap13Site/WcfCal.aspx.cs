using System;
public partial class WcfCal : System.Web.UI.Page
{
  protected void BtnAdd_Click(object sender, EventArgs e)
  {
    ServiceRefCal.CalClient calClient = new ServiceRefCal.CalClient();
    int a = int.Parse(txtA.Text);
    int b = int.Parse(txtB.Text);
    int result = calClient.Add(a, b);  //调用WCF服务Cal中的Add()方法
    lblResult.Text = a.ToString() + "+" + b.ToString() + "=" + result.ToString();
    calClient.Close();
  }
  protected void BtnSubtract_Click(object sender, EventArgs e)
  {
    ServiceRefCal.CalClient calClient = new ServiceRefCal.CalClient();
    int a = int.Parse(txtA.Text);
    int b = int.Parse(txtB.Text);
    int result = calClient.Subtract(a, b);  //调用WCF服务Cal中的Subtract()方法
    lblResult.Text = a.ToString() + "-" + b.ToString() + "=" + result.ToString();
    calClient.Close();
  }
}