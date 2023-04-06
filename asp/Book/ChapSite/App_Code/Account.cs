using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// 银行账户类Account
/// </summary>
public class Account
{
  private string _ID; //定义_ID私有字段，对应ID属性
  private string _Name;  //定义_Name私有字段，对应Name属性
  private decimal _Balance;  //定义_Balance私有字段，对应Balance属性

  /// <summary>
  /// 定义ID属性
  /// </summary>
  public string ID
  {
    get { return _ID; }
    set { _ID = value; }
  }

  /// <summary>
  /// 定义Name属性
  /// </summary>
  public string Name
  {
    get { return _Name; }
    set { _Name = value; }
  }

  /// <summary>
  /// 定义Balance属性
  /// </summary>
  public decimal Balance
  {
    get { return _Balance; }
    set { _Balance = value; }
  }

  /// <summary>
  /// 定义构造函数
  /// </summary>
  /// <param name="id">账户编号参数</param>
  /// <param name="name">账户所有者姓名参数</param>
  /// <param name="balance">账户金额参数</param>
  public Account(string id, string name, decimal balance)
  {
    _ID = id;  //将id参数值传递给_ID私有字段
    _Name = name;  //将name参数值传递给_Name私有字段
    _Balance = balance; //将balance参数值传递给_Balance私有字段
  }

  /// <summary>
  /// 默认构造函数
  /// </summary>
  public Account()
  {
  }

  /// <summary>
  /// 存款方法
  /// </summary>
  /// <param name="amount">存款金额</param>
  public void Deposit(decimal amount)
  {
    if (amount > 0)
    {
      _Balance += amount;
    }
    else
    {
      throw new Exception("存款金额不能小于或等于0！");
    }
  }

  /// <summary>
  /// 取款方法
  /// </summary>
  /// <param name="amount">取款金额</param>
  public void Acquire(decimal amount)
  {
    if (amount < _Balance)
    {
      _Balance -= amount;
    }
    else
    {
      throw new Exception("账户金额不足！");
    }
  }
}