using MyPetShop.BLL;
using System;
using System.Web.UI.WebControls;

public partial class UserControl_PetTree : System.Web.UI.UserControl
{
  CategoryService categorySrv = new CategoryService();
  ProductService productSrv = new ProductService();

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      //调用自定义方法BindTree()将所有的商品分类添加到TreeView控件tvProducts的父节点中
      BindTree();
    }
  }

  /// <summary>
  /// 将所有的商品分类添加到TreeView控件tvProducts的父节点中
  /// </summary>
  protected void BindTree()
  {
    var categories = categorySrv.GetAllCategory();
    foreach (var category in categories)
    {
      //将一个商品分类添加到TreeView控件tvProducts的父节点中
      TreeNode treeNode = new TreeNode
      {
        Text = category.Name,
        Value = category.CategoryId.ToString(),
        NavigateUrl = "~/ProShow.aspx?CategoryId=" + category.CategoryId.ToString()
      };
      tvProducts.Nodes.Add(treeNode);
      //调用自定义方法BindTreeChild()将指定分类号下的所有商品添加到该分类节点下
      BindTreeChild(treeNode, category.CategoryId);
    }
  }

  /// <summary>
  /// 将指定分类号下的所有商品绑定到子节点中
  /// </summary>
  /// <param name="tn">子节点名</param>
  /// <param name="categoryId">指定分类号</param>
  protected void BindTreeChild(TreeNode tn, int categoryId)
  {
    var products = productSrv.GetProductByCategoryId(categoryId);
    //将指定分类号下的所有商品添加到该分类节点下
    foreach (var product in products)
    {
      TreeNode treeNode = new TreeNode
      {
        Text = product.Name,
        Value = product.ProductId.ToString(),
        NavigateUrl = "~/ProShow.aspx?ProductId=" + product.ProductId.ToString()
      };
      tn.ChildNodes.Add(treeNode);
    }
  }
}