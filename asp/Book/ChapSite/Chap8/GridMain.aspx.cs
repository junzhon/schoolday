using System;
using System.Linq;
public partial class Chap8_GridMain : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      MyPetShopDataContext db = new MyPetShopDataContext();
      var results = from r in db.Category
                    select r;
      gvCategory.DataSource = results;
      gvCategory.DataBind();
    }
  }
}