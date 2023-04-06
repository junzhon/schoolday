using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// UserInfo类包含Name和Birthday两个属性及一个DecideAge()方法
/// </summary>
public class UserInfo
{
  //_Name字段对应Name属性，_Birthday字段对应Birthday属性
  private string _Name;  //下划线左边有一个空格，下同
  private DateTime _Birthday;
  /// <summary>
  /// 定义Name属性
  /// </summary>
  public string Name
  {
    get { return _Name; }
    set { _Name = value; }
  }
  /// <summary>
  /// 定义Birthday属性
  /// </summary>
  public DateTime Birthday
  {
    get { return _Birthday; }
    set { _Birthday = value; }
  }
  /// <summary>
  /// 定义构造函数
  /// </summary>
  /// <param name="name">姓名</param>
  /// <param name="birthday">生日</param>
  public UserInfo(string name, DateTime birthday)
  {
    this._Name = name;
    this._Birthday = birthday;
  }
  /// <summary>
  /// DecideAge()方法用于判断用户是否达到规定年龄
  /// </summary>
  /// <returns>当年龄大于等于18岁时返回值“XXX，您是成人了！”，否则返回值“XXX，您还没长大呢？”。</returns>
  public string DecideAge()
  {
    if (DateTime.Now.Year - _Birthday.Year < 18)
    {
      return this._Name + "，您还没长大呢?";
    }
    else
    {
      return this._Name + "，您是成人了！";
    }
  }
}