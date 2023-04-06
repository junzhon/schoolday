using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// WebService测试，调用HelloWorld()方法返回“我是调用Web服务返回的数据！”
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class WebService : System.Web.Services.WebService
{
  public WebService()
  {
      //如果使用设计的组件，请取消注释以下行 
    //InitializeComponent(); 
  }

  [WebMethod]
  public string HelloWorld()
  {
    return "我是调用Web服务返回的数据！";
  }
}
