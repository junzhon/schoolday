using MyPetShop.DAL;
using System.Collections.Generic;
using System.Data.Linq.SqlClient;
using System.Linq;
namespace MyPetShop.BLL
{
  public class ProductService
  {
    MyPetShopDataContext db = new MyPetShopDataContext();

    /// <summary>
    /// 查找指定商品分类中包含的所有商品，再返回以Product类为元素的列表
    /// </summary>
    /// <param name="categoryId">指定的商品分类编号</param>
    /// <returns>Product类为元素的列表</returns>
    public List<Product> GetProductByCategoryId(int categoryId)
    {
      return (from p in db.Product
              where p.CategoryId == categoryId
              select p).ToList();
    }

    /// <summary>
    /// 查找指定商品编号的商品，并返回满足条件的商品对象
    /// </summary>
    /// <param name="productId">商品编号</param>
    /// <returns>满足条件的商品对象</returns>
    public Product GetProductByProductId(int productId)
    {
      return (from p in db.Product
              where p.ProductId == productId
              select p).First();
    }

public List<Product> GetAllProduct()
{
  return (from p in db.Product
          select p).ToList();
}
    /// <summary>
    /// 根据指定的ProductId或CategoryId值，查找并返回与ProductId值相等的单个商品信息，或者查找并返回CategoryId值确定的分类中的所有商品信息
    /// </summary>
    /// <param name="productId"></param>
    /// <param name="categoryId"></param>
    /// <returns></returns>
    public List<Product> GetProductByProductIdOrCategoryId(string productId, string categoryId)
{
  if (!string.IsNullOrEmpty(productId))
  {
    return (from p in db.Product
            where p.ProductId == int.Parse(productId)
            select p).ToList();
  }
  else
  {
    return (from p in db.Product
            where p.CategoryId == int.Parse(categoryId)
            select p).ToList();
  }
}

    /// <summary>
    /// 模糊查找商品名中包含指定文本的商品，再返回满足条件的商品列表
    /// </summary>
    /// <param name="searchText">指定的文本</param>
    /// <returns>满足条件的商品列表</returns>
    //public List<Product> GetProductBySearchText(string searchText)
    //{
    //  return (from p in db.Product
    //          where SqlMethods.Like(p.Name, "%" + searchText + "%")
    //          select p).ToList();
    //}
  }
}
