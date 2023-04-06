using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProShow : System.Web.UI.Page
{
  MyPetShopDataContext db = new MyPetShopDataContext();

  protected void Page_Load(object sender, EventArgs e)
  {
    //页面首次载入时填充ddlCategory下拉列表框
    if (!IsPostBack)
    {
      var categories = from c in db.Category
                       select new
                       {
                         c.CategoryId,
                         c.Name
                       };
      foreach (var category in categories)
      {
        ddlCategory.Items.Add(new ListItem(category.Name.ToString(), category.CategoryId.ToString()));
      }
      Bind();  //调用自定义方法，根据选择的CategoryId显示该分类中包含的商品
    }
  }

  protected void DdlCategory_SelectedIndexChanged(object sender, EventArgs e)
  {
    Bind();  //调用自定义方法，根据选择的CategoryId显示该分类中包含的商品
  }

  /// <summary>
  /// 根据选择的CategoryId显示该分类中包含的商品
  /// </summary>
  private void Bind()
  {
    int categoryId = int.Parse(ddlCategory.SelectedValue);  //获取选择的CategoryId
    //在Product中查找满足条件的商品
    var products = from p in db.Product
                   where p.CategoryId == categoryId
                   select p;
    gvProduct.DataSource = products;  //将查找到的商品绑定到gvProduct
    gvProduct.DataBind();
  }

  protected void GvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
  {
    gvProduct.PageIndex = e.NewPageIndex;//设置当前页索引值为新的页面索引值
    Bind();  //调用自定义方法，根据选择的CategoryId显示该分类中包含的商品
  }
}