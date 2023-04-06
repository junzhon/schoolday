using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// 能相互查找邮政编码和对应地区的ASP.NET Web服务
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
// [System.Web.Script.Services.ScriptService]
public class PostCode : System.Web.Services.WebService
{

  public PostCode()
  {
    //如果使用设计的组件，请取消注释以下行 
    //InitializeComponent(); 
  }

  /// <summary>
  /// 自定义方法GetPostCode()根据指定的地区名返回对应的邮政编码
  /// </summary>
  /// <param name="regionName">指定的地区名</param>
  /// <returns>邮政编码或null</returns>
  [WebMethod]
  public string GetPostCode(string regionName)
  {
    //调用自定义方法GetPostCodeDb()获取包含邮政编码和对应地区名的临时表
    DataTable dt = GetPostCodeDb();
    for (int i = 0; i < dt.Rows.Count; i++)
    {
      //根据指定的地区名返回对应的邮政编码
      if (dt.Rows[i][0].ToString() == regionName)
      {
        return dt.Rows[i][1].ToString();
      }
    }
    return null;
  }
  /// <summary>
  /// 自定义方法GetRegionName()根据指定的邮政编码返回对应的地区名
  /// </summary>
  /// <param name="postCode">指定的邮政编码</param>
  /// <returns>地区名或或null</returns>
  [WebMethod]
  public string GetRegionName(string postCode)
  {
    //调用自定义方法GetPostCodeDb()获取包含邮政编码和对应地区名的临时表
    DataTable dt = GetPostCodeDb();
    for (int i = 0; i < dt.Rows.Count; i++)
    {
      //根据指定的邮政编码返回对应的地区名
      if (dt.Rows[i][1].ToString() == postCode)
      {
        return dt.Rows[i][0].ToString();
      }
    }
    return null;
  }
  /// <summary>
  /// 自定义方法GetPostCodeDb()返回包含邮政编码和对应地区名的临时表
  /// </summary>
  /// <returns>包含邮政编码和对应地区名的临时表</returns>
  private DataTable GetPostCodeDb()
  {
    DataTable dt = new DataTable("PostCode");  // 创建临时表
    DataColumn dc = new DataColumn("Code");  //创建数据列Code
    dc.DataType = System.Type.GetType("System.String");     //指定数据列的数据类型
    dt.Columns.Add(dc);  //添加数据列Code到临时表中
    dc = new DataColumn("Region");
    dt.Columns.Add(dc);
    //添加数据到临时表中
    DataRow dr = dt.NewRow();
    dr[0] = "北京市";
    dr[1] = "100000";
    dt.Rows.Add(dr);
    dr = dt.NewRow();
    dr[0] = "西城区";
    dr[1] = "100032";
    dt.Rows.Add(dr);
    dr = dt.NewRow();
    dr[0] = "崇文区";
    dr[1] = "100061";
    dt.Rows.Add(dr);
    dr = dt.NewRow();
    dr[0] = "海淀区";
    dr[1] = "100080";
    dt.Rows.Add(dr);
    return dt;  //返回包含邮政编码和对应地区名的临时表
  }
}
