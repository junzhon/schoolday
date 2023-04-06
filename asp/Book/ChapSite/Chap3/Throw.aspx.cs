using System;
public partial class Chap3_Throw : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    int i = 10;
    int j = 0;
    int k;
    if (j == 0)
    {
      throw new Exception("除数不能为零！");
    }
    else
    {
      k = i / j;
      Response.Write(k);
    }
  }
}