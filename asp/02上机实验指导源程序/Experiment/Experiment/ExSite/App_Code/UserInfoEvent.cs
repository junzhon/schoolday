using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///UserInfoEvent包含属性Name和Birthday，方法DecideAge()，事件ValidateBirthday
/// </summary>
public class UserInfoEvent
{
  private string _Name;
  private DateTime _Birthday;
  public event EventHandler ValidateBirthday;

  public string Name
  {
    get { return _Name; }
    set { _Name = value; }
  }

  public DateTime Birthday
  {
    get { return _Birthday; }
    set { _Birthday = value; }
  }

  public UserInfoEvent(string name, DateTime birthday)
  {
    this._Name = name;
    this._Birthday = birthday;
  }

  /// <summary>
  /// 判断用户是否达到规定年龄，当输入的生日值大于当前日期或小于1900-1-1时触发事件ValidateBirthday
  /// </summary>
  /// <returns>当年龄大于等于18岁时返回值“XXX，您是成人了！”；当年龄小于18岁时返回值“XXX，您还没长大呢？”；当触发事件ValidateBirthday时返回空字符串</returns>
  public string DecideAge()
  {
    DateTime firstDate = DateTime.ParseExact("19000101", "yyyyMMdd", null);
    if ((_Birthday.Ticks - firstDate.Ticks) < 0 | (_Birthday.Ticks - DateTime.Now.Ticks) > 0)
    {
      OnValidateBirthday(this, EventArgs.Empty);
      return "";
    }
    else
    {
      if (DateTime.Now.Year - _Birthday.Year < 18)
      {
        return "您还没长大呢?";
      }
      else
      {
        return "您是成人了！";
      }
    }
  }


  public void OnValidateBirthday(object sender, EventArgs e)
  {
    if (ValidateBirthday != null)
    {
      ValidateBirthday(this, e);
    }
  }
}