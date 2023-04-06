using MyPetShop.BLL;
using System;
using System.Web.UI.WebControls;

public partial class ProShow : System.Web.UI.Page
{
  ProductService productSrv = new ProductService();

protected void Page_Load(object sender, EventArgs e)
{
  if (Request.QueryString.Count == 0)
  {
    Response.Redirect("Default.aspx");
  }
  else
  {
    Bind();  //调用自定义方法Bind()
  }
}

  /// <summary>
  /// 根据从Category.ascx、PetTree.ascx传递过来的ProductId或CategoryId值，显示与ProductId值相等的单个商品信息，或者显示CategoryId值确定的分类中的所有商品信息
  /// </summary>
protected void Bind()
{
  gvProduct.DataSource = productSrv.GetProductByProductIdOrCategoryId(Request.QueryString["ProductId"], Request.QueryString["CategoryId"]);
  gvProduct.DataBind();
}

protected void GvProduct_PageIndexChanging(Object sender, GridViewPageEventArgs e)
{
  gvProduct.PageIndex = e.NewPageIndex;
  Bind();  //调用自定义方法Bind()
}
}