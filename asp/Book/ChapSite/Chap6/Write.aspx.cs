using System;
public partial class Chap6_Write : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    for (int i = 10; i <= 18; i += 4)
    {
      Response.Write("<p style=\"font-size:" + i.ToString() + "px\">我喜欢ASP.NET!</p>");
    }
  }
}