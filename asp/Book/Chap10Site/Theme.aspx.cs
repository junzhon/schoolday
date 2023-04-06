using System;
using System.Web.UI;
public partial class Theme : System.Web.UI.Page
{
  protected void Page_PreInit(object sender, EventArgs e)
  {
    //当选择ddlThemes下拉列表框中的Blue或Green时改变页面主题
    if (Request["ddlThemes"] != "0")
    {
      Page.Theme = Request["ddlThemes"];
    }
  }
}