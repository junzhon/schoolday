using System;
public partial class Chap12_UpdatePnlIn : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    lblInterior.Text = "我在UpdatePanel控件中";
    lblExterior.Text = "我在UpdatePanel控件外";
  }
  protected void BtnRefresh_Click(object sender, EventArgs e)
  {
    lblInterior.Text = DateTime.Now.ToLongTimeString();
    lblExterior.Text = DateTime.Now.ToLongTimeString();
  }
}