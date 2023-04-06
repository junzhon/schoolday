using System;
using System.Linq;
public partial class Chap8_GridSub : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {   
      MyPetShopDataContext db = new MyPetShopDataContext();
      var results = from r in db.Product
                    where r.CategoryId == int.Parse(Request.QueryString
["CategoryId"])
                    select r;
      gvProduct.DataSource = results;
      gvProduct.DataBind();  
  }
}