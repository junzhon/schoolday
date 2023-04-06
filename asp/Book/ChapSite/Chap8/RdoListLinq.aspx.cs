using System;
using System.Linq;
public partial class Chap8_RdoListLinq : System.Web.UI.Page
{
  MyPetShopDataContext db = new MyPetShopDataContext();
  protected void Page_Load(object sender, EventArgs e)
  {
    //页面首次载入时查询Category表并将查询结果绑定到rdoltCategory
    if (!IsPostBack)
    {
      var results = from r in db.Category
                    select r;
      rdoltCategory.DataSource = results;
      rdoltCategory.DataBind();
    }
  }
  protected void RdoltCategory_SelectedIndexChanged(object sender, EventArgs e)
  {
    //查询Product表中CategoryId字段值与选中单选按钮对应的Category表中CategoryId字段值相同的记录
    var results = from r in db.Product
                  where r.CategoryId == int.Parse(rdoltCategory.SelectedValue)
                  select r;
    lstProduct.DataSource = results;
    lstProduct.DataBind();
  }
}