using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// 注意: 使用“重构”菜单上的“重命名”命令，可以同时更改代码和配置文件中的接口名“IPassport”。
[ServiceContract]
public interface IPassport
{
  [OperationContract]
  //根据个人身份证号码id返回个人出生地所在省或直辖市的名称
  string GetBirthPlace(string id);
}
