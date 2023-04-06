using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;

namespace MyPetShop.BLL
{
  public class OrderService
  {
    MyPetShopDataContext db = new MyPetShopDataContext();

    /// <summary>
    /// 根据指定用户购物车中的商品清单创建该用户的订单以及订单的详细信息记录
    /// </summary>
    /// <param name="cutomerId"></param>
    /// <param name="customerName"></param>
    /// <param name="addr1"></param>
    /// <param name="addr2"></param>
    /// <param name="city"></param>
    /// <param name="state"></param>
    /// <param name="zip"></param>
    /// <param name="phone"></param>
    public void CreateOrderFromCart(int cutomerId, string customerName, string addr1, string addr2, string city, string state, string zip, string phone)
    {
      //由于需要对多张表的数据进行操作，所以，通过使用数据库事务来保证数据的一致性
      using (TransactionScope ts = new TransactionScope())
      {
        //获取指定用户购物车内的所有商品列表
        List<CartItem> cartItemList = (from c in db.CartItem
                                       where c.CustomerId == cutomerId
                                       select c).ToList();

        //首先，创建存储于Order表中的指定用户的一条订单，状态为“未审核”
        Order order = new Order
        {
          CustomerId = cutomerId,
          UserName = customerName,
          OrderDate = DateTime.Now,
          Addr1 = addr1,
          Addr2 = addr2,
          City = city,
          State = state,
          Zip = zip,
          Phone = phone,
          Status = "未审核"
        };

        //其次，根据指定用户购物车内的所有商品列表创建存储于OrderItem表中的该用户订单的详细信息记录
        OrderItem orderItem = null;
        Product product = null;
        foreach (CartItem cartItem in cartItemList)
        {
          //依次添加每件商品为订单的详细信息记录
          orderItem = new OrderItem
          {
            OrderId = order.OrderId,
            ProName = cartItem.ProName,
            ListPrice = cartItem.ListPrice,
            Qty = cartItem.Qty,
            TotalPrice = cartItem.Qty * cartItem.ListPrice
          };
          order.OrderItem.Add(orderItem);

          //再次，修改Product表中相应商品的库存量
          product = (from p in db.Product
                     where p.ProductId == cartItem.ProId
                     select p).First();
          product.Qty = product.Qty - cartItem.Qty;

          //最后，删除用户购物车中的所有商品
          db.CartItem.DeleteOnSubmit(cartItem);
        }

        db.Order.InsertOnSubmit(order);
        db.SubmitChanges();
        ts.Complete(); //提交事务
      }
    }
  }
}
