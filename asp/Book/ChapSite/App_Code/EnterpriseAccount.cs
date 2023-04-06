/// <summary>
/// 继承Account类，增加Type属性
/// </summary>
public class EnterpriseAccount : Account
{
  private string _Type;  //定义_Type私有字段，对应Type属性
  public string Type
  {
    get { return _Type; }
    set { _Type = value; }
  }
}