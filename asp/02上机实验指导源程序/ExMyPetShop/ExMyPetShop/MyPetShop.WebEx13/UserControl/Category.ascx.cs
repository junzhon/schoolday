using MyPetShop.BLL;
using System;

public partial class UserControl_Category : System.Web.UI.UserControl
{
  CategoryService categorySrv = new CategoryService();

protected void Page_Load(object sender, EventArgs e)
{
  gvCategory.DataSource = categorySrv.GetAllCategory();
  gvCategory.DataBind();
}

  /// <summary>
  /// 统计指定商品分类中包含的商品数量
  /// </summary>
  /// <param name="id"></param>
  /// <returns></returns>
protected string GetProductCountByCategoryId(string id)
{
  return "("
          + categorySrv.GetProductCountByCategoryId(int.Parse(id)).ToString()
          + ")";
}
}