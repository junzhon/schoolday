using MyPetShop.DAL;
using System.Collections.Generic;
using System.Linq;

namespace MyPetShop.BLL
{
  public class CartItemService
  {
    MyPetShopDataContext db = new MyPetShopDataContext();

    /// <summary>
    /// 向MyPetShop数据库中的CartItem表插入新购商品
    /// </summary>
    /// <param name="customerId">用户编号</param>
    /// <param name="productId">商品编号</param>
    /// <param name="qty">购买数量</param>
    /// <returns>插入的新购商品对象</returns>
    public CartItem Insert(int customerId, int productId, int qty)
    {
      CartItem cartItem = null;

      Product product = (from p in db.Product
                         where p.ProductId == productId
                         select p).First();
      //新建当前需要添加的CartItem对象
      cartItem = new CartItem
      {
        CustomerId = customerId,
        ProId = product.ProductId,
        ProName = product.Name,
        ListPrice = (decimal)product.ListPrice,
        Qty = qty
      };

      //若当前商品已在当前用户的购物车内，则只要增加相应商品的数量
      int ExistCartItemCount = (from c in db.CartItem
                                where c.CustomerId == customerId && c.ProId == productId
                                select c).Count();
      if (ExistCartItemCount > 0) //当前商品已在当前用户的购物车内
      {
        CartItem existCartItem = (from c in db.CartItem
                                  where c.CustomerId == customerId && c.ProId == productId
                                  select c).First();
        existCartItem.Qty += qty;//增加相应商品的数量
      }
      else
      {
        db.CartItem.InsertOnSubmit(cartItem);
      }
      db.SubmitChanges();
      return cartItem;
    }

    /// <summary>
    /// 根据指定的数量更改当前用户购物车中商品的数量
    /// </summary>
    /// <param name="customerId">用户编号</param>
    /// <param name="productId">商品编号</param>
    /// <param name="qty">购买数量</param>
    /// <returns>修改购物数量后的商品对象</returns>
    public CartItem Update(int customerId, int productId, int qty)
    {
      CartItem cartItem = null;
      //在当前用户购物车内查找指定的商品，并根据指定的数量qty修改该商品的数量。其中，若qty<=0，则删除该商品
      cartItem = (from c in db.CartItem
                  where c.CustomerId == customerId && c.ProId == productId
                  select c).First();
      if (cartItem != null)
      {
        cartItem.Qty = qty;
        if (cartItem.Qty <= 0)
        {
          db.CartItem.DeleteOnSubmit(cartItem);
        }
        db.SubmitChanges();
      }
      return cartItem;
    }

    /// <summary>
    /// 删除当前用户购物车中指定的商品
    /// </summary>
    /// <param name="customerId">用户编号</param>
    /// <param name="productId">商品编号</param>
    public void Delete(int customerId, int productId)
    {
      CartItem cartItem = (from c in db.CartItem
                           where c.CustomerId == customerId && c.ProId == productId
                           select c).First();
      if (cartItem != null)
      {
        db.CartItem.DeleteOnSubmit(cartItem);
        db.SubmitChanges();
      }
    }

    /// <summary>
    /// 清除当前用户购物车中所有商品
    /// </summary>
    /// <param name="customerId">用户编号</param>
    public void Clear(int customerId)
    {
      List<CartItem> cartItemList = (from c in db.CartItem
                                     where c.CustomerId == customerId
                                     select c).ToList();
      foreach (CartItem cartItem in cartItemList)
      {
        db.CartItem.DeleteOnSubmit(cartItem);
      }
      db.SubmitChanges();
    }

    /// <summary>
    /// 获取指定用户购物车中的所有商品列表
    /// </summary>
    /// <param name="customerId">用户编号</param>
    /// <returns>指定用户购物车中的所有商品列表</returns>
    public List<CartItem> GetCartItemByCustomerId(int customerId)
    {
      return (from c in db.CartItem
              where c.CustomerId == customerId
              select c).ToList();
    }

    /// <summary>
    /// 获取指定用户购物车中商品的总价
    /// </summary>
    /// <param name="customerId">用户编号</param>
    /// <returns>指定用户购物车中商品的总价</returns>
    public decimal GetTotalPriceByCustomerId(int customerId)
    {
      List<CartItem> list = (from c in db.CartItem
                             where c.CustomerId == customerId
                             select c).ToList();
      return list.Sum(c => c.ListPrice * c.Qty);
    }
  }
}
