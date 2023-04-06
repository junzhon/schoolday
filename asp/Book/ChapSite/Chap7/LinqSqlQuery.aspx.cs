using System;
using System.Linq;
public partial class Chap7_LinqSqlQuery : System.Web.UI.Page
{
  protected void BtnAll_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();  //定义MyPetShopDataContext类实例db
    var products = from r in db.Product  //db是公共的MyPetShopDataContext类实例
                   select r;
    gvProduct.DataSource = products;  //将LINQ查询结果设置为gvProduct的数据源
    gvProduct.DataBind();  //显示数据源中的数据
  }
  protected void BtnProject_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();  //定义MyPetShopDataContext类实例db
    var products = from r in db.Product  //db是公共的MyPetShopDataContext类实例
                   select new
                   {
                     r.ProductId,
                     r.CategoryId,
                     r.Name
                   };
    gvProduct.DataSource = products;
    gvProduct.DataBind();
  }
  protected void BtnSelect_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();
    var products = from r in db.Product
                   where r.UnitCost > 20
                   select r;
    gvProduct.DataSource = products;
    gvProduct.DataBind();
  }
  protected void BtnOrder_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();
    var results = from r in db.Product
                  orderby r.UnitCost descending
                  select r;
    gvProduct.DataSource = results;
    gvProduct.DataBind();
  }
  protected void BtnGroup_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();
    //根据CategoryId分组，再将结果存入results
    var results = from r in db.Product
                  group r by r.CategoryId;
    foreach (var g in results)  //results为外集合，g为外集合中的一个元素并且g也是一个集合
    {
      if (g.Key == 5)  //获取键值等于5的外集合元素
      {
        var results2 = from r in g  //r为键值等于5的组中的一个元素
                       select r;
        gvProduct.DataSource = results2;
        gvProduct.DataBind();
      }
    }
  }
  protected void BtnPolymerize_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();
    var results = from r in db.Product
                  group r by r.CategoryId into g
                  select new
                  {
                    Key = g.Key,
                    Count = g.Count(),
                    MaxPrice = g.Max(p => p.ListPrice),
                    MinPrice = g.Min(p => p.ListPrice),
                    AvgPrice = g.Average(p => p.ListPrice)
                  };
    gvProduct.DataSource = results;
    gvProduct.DataBind();
  }
  protected void BtnQuote_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();
    var results = from r in db.Product
                  select new
                  {
                    r.ProductId,
                    r.CategoryId,
                    CategoryName = r.Category.Name  //直接引用Category对象
                  };
    gvProduct.DataSource = results;
    gvProduct.DataBind();
  }
  protected void BtnJoin_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();
    var results = from product in db.Product
                  join category in db.Category on product.CategoryId equals category.CategoryId
                  select new
                  {
                    product.ProductId,
                    product.CategoryId,
                    CategoryName = category.Name
                  };
    gvProduct.DataSource = results;
    gvProduct.DataBind();
  }
  protected void BtnFuzzy_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();
    var results = from r in db.Product
                  where System.Data.Linq.SqlClient.SqlMethods.Like(r.Name, "%fly%")
                  select r;
    gvProduct.DataSource = results;
    gvProduct.DataBind();
  }
}