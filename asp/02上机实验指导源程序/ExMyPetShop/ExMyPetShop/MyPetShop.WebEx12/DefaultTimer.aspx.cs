using MyPetShop.BLL;
using System;
using System.Web.UI.WebControls;

public partial class _DefaultTimer : System.Web.UI.Page
{
  ProductService productSrv = new ProductService();

  protected void Page_Load(object sender, EventArgs e)
  {
    Bind();  //调用自定义方法Bind()绑定所有商品信息到gvProduct
  }

  protected void Bind()
  {
    //调用ProductService类的GetAllProduct()方法查找并返回所有商品对象（以Product类为元素）列表
    gvProduct.DataSource = productSrv.GetAllProduct();
    gvProduct.DataBind();
  }

  protected void GvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
  {
    gvProduct.PageIndex = e.NewPageIndex;  //设置当前页索引值为新的页面索引值
    Bind();  //调用自定义方法Bind()
  }

  protected void TmrAutoShow_Tick(object sender, EventArgs e)
  {
    int newPageIndex = gvProduct.PageIndex;
    if (newPageIndex == gvProduct.PageCount - 1)
    {
      newPageIndex = 0;
    }
    else
    {
      newPageIndex += 1;
    }
    gvProduct.PageIndex = newPageIndex;
  }

  protected void ChkAutoShow_CheckedChanged(object sender, EventArgs e)
  {
    tmrAutoShow.Enabled = chkAutoShow.Checked;
  }
}