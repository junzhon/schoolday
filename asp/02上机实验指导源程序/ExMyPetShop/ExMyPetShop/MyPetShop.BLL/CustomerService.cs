using MyPetShop.DAL;  //引用MyPetShop.DAL数据访问层
using System.Collections.Generic;
using System.Linq;
namespace MyPetShop.BLL
{
  public class CustomerService
  {
    //建立MyPetShop.DAL数据访问层中的MyPetShopDataContext类实例db
    MyPetShopDataContext db = new MyPetShopDataContext();
    /// <summary>
    /// 检查输入的用户名和密码是否正确
    /// </summary>
    /// <param name="name">用户名</param>
    /// <param name="password">密码</param>
    /// <returns>若用户名和密码正确则返回用户Id，否则返回0</returns>
    public int CheckLogin(string name, string password)
    {
      //通过MyPetShop.DAL数据访问层中的Customer类查询输入的用户名和密码是否正确，若正确则返回相应的用户对象，否则返回null
      Customer customer = (from c in db.Customer
                           where c.Name == name && c.Password == password
                           select c).FirstOrDefault();
      if (customer != null)  //用户名和密码正确
      {
        return customer.CustomerId;
      }
      else  //用户名或密码错误
      {
        return 0;
      }
    }
    /// <summary>
    /// 修改用户Id对应用户的密码
    /// </summary>
    /// <param name="customerId">用户Id</param>
    /// <param name="password">新密码</param>
    public void ChangePassword(int customerId, string password)
    {
      Customer customer = (from c in db.Customer
                           where c.CustomerId == customerId
                           select c).First();
      customer.Password = password;
      db.SubmitChanges();
    }
    /// <summary>
    /// 将用户密码重置为相应的用户名
    /// </summary>
    /// <param name="name">输入的用户名</param>
    /// <param name="email">输入的Email</param>
    public void ResetPassword(string name, string email)
    {
      Customer customer = (from c in db.Customer
                           where c.Name == name && c.Email == email
                           select c).First();
      customer.Password = name;
      db.SubmitChanges();
    }
    /// <summary>
    /// 判断输入的用户名是否重名
    /// </summary>
    /// <param name="name">输入的用户名</param>
    /// <returns>当用户名重名时返回true，否则返回false</returns>
    public bool IsNameExist(string name)
    {
      //通过MyPetShop.DAL数据访问层中的Customer类查询输入的用户名是否重名，若重名则返回用户对象，否则返回null
      Customer customer = (from c in db.Customer
                           where c.Name == name
                           select c).FirstOrDefault();
      if (customer != null)
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    /// <summary>
    /// 判断Customer表中是否存在输入的用户名和Email
    /// </summary>
    /// <param name="name">输入的用户名</param>
    /// <param name="email">输入的Email</param>
    /// <returns>当输入的用户名和Email存在时返回true，否则返回false</returns>
    public bool IsEmailExist(string name, string email)
    {
      Customer customer = (from c in db.Customer
                           where c.Name == name && c.Email == email
                           select c).FirstOrDefault();
      if (customer != null)
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    /// <summary>
    /// 向MyPetShop数据库中的Customer表插入新用户记录
    /// </summary>
    /// <param name="name">用户名</param>
    /// <param name="password">密码</param>
    /// <param name="email">电子邮件地址</param>
    public void Insert(string name, string password, string email)
    {
      Customer customer = new Customer
      {
        Name = name,
        Password = password,
        Email = email
      };
      db.Customer.InsertOnSubmit(customer);
      db.SubmitChanges();
    }
  }
}
