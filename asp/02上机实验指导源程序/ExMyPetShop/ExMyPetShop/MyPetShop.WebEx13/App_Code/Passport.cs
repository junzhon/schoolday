using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// 注意: 使用“重构”菜单上的“重命名”命令，可以同时更改代码、svc 和配置文件中的类名“Passport”。
public class Passport : IPassport
{
  public string GetBirthPlace(string id)
  {
    string[,] placeNameCode = { { "北京", "11" }, { "天津", "12" },
{ "河北", "13" }, { "山西", "14" },{ "内蒙古", "15" }, { "辽宁", "21" },
{ "吉林", "22" }, { "黑龙江", "23" }, { "上海", "31" }, { "江苏", "32" },
{ "浙江", "33" }, { "安徽", "34" }, { "福建", "35" }, { "江西", "36" },
{ "山东", "37" }, { "河南", "41" }, { "湖北", "42" }, { "湖南", "43" },
{ "广东", "44" }, { "广西", "45" }, { "海南", "46" }, { "重庆", "50" },
{ "四川", "51" }, { "贵州", "52" }, { "云南", "53" }, { "西藏", "54" },
{ "陕西", "61" }, { "甘肃", "62" },  { "青海", "63" }, { "宁夏", "64" },
{ "新疆", "65" } };
    //取身份证号码前两位，即个人出生地所在省（自治区、直辖市）的编码
    string placeCode = id.Substring(0, 2);
    for (int i = 0; i < placeNameCode.GetLength(0); i++)
    {
      if (placeNameCode[i, 1] == placeCode)
      {
        return placeNameCode[i, 0];  //返回个人出生地所在省（自治区、直辖市）的名称
      }
    }
    return null;
  }
}

