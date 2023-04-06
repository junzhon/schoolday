using System;
public partial class WebServiceTest : System.Web.UI.Page
{
  protected void BtnTest_Click(object sender, EventArgs e)
  {
    ServiceRefWeb.WebServiceSoapClient soapClient = new ServiceRefWeb.WebServiceSoapClient();
    lblMsg.Text = soapClient.HelloWorld();
  }
}