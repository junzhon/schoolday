using MyPetShop.BLL;
using System;
using System.Web.UI.WebControls;

public partial class DefaultBak : System.Web.UI.Page
{
  CategoryService categorySrv = new CategoryService();
  ProductService productSrv = new ProductService();

  protected void Page_Load(object sender, EventArgs e)
  {
    if (Session["CustomerId"] != null)  //一般用户已登录
    {
      lblWelcome.Text = "您好, " + Session["CustomerName"].ToString();
      lnkbtnPwd.Visible = true;
      lnkbtnOrder.Visible = true;
      lnkbtnLogout.Visible = true;
    }

    //页面首次载入时填充ddlCategory下拉列表框
    if (!IsPostBack)
    {
      //调用CategoryService类中的GetAllCategory()方法返回所有的商品分类
      var categories = categorySrv.GetAllCategory();
      foreach (var category in categories)
      {
        ddlCategory.Items.Add(new ListItem(category.Name.ToString(), category.CategoryId.ToString()));
      }
      Bind();  //调用自定义方法，根据选择的CategoryId显示该商品分类中包含的商品
    }
  }

  /// <summary>
  /// 根据选择的CategoryId显示该分类中包含的商品
  /// </summary>
  private void Bind()
  {
    //获取选择的CategoryId
    int categoryId = int.Parse(ddlCategory.SelectedValue);
    //调用ProductService类中的GetProductByCategoryId()方法查找指定商品分类号的商品
    var products = productSrv.GetProductByCategoryId(categoryId);
    gvProduct.DataSource = products;  //将查找到的商品绑定到gvProduct
    gvProduct.DataBind();
  }
  protected void LnkbtnRegister_Click(object sender, EventArgs e)
  {
    Session.Clear();    //注销当前用户      
    Response.Redirect("~/NewUser.aspx");
  }

  protected void LnkbtnLogin_Click(object sender, EventArgs e)
  {
    Session.Clear();    //注销当前用户
    Response.Redirect("~/Login.aspx");
  }
  protected void LnkbtnLogout_Click(object sender, EventArgs e)
  {
    Session.Clear();    //注销当前用户
    Response.Redirect("~/Default.aspx");
  }

  protected void DdlCategory_SelectedIndexChanged(object sender, EventArgs e)
  {
    Bind();  //调用自定义方法，根据选择的CategoryId显示该分类中包含的商品
  }
  protected void GvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
  {
    gvProduct.PageIndex = e.NewPageIndex;//设置当前页索引值为新的页面索引值
    Bind();  //调用自定义方法，根据选择的CategoryId显示该分类中包含的商品
  }


}