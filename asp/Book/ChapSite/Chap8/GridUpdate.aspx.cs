using System;
using System.Linq;
public partial class Chap8_GridUpdate : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();
    var results = from r in db.Category
                  select r;
    gvCategory.DataSource = results;
    gvCategory.DataBind();
  }
}