using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WeatherServiceRef;
using System.Data;

public partial class Weather : System.Web.UI.Page
{
  WeatherWebService weather = new WeatherWebService();

  /// <summary>
  /// 获得天气预报服务支持的洲、国内外省份和城市信息，并调用自定义方法GetWeatherByCode()，获取北京天气情况
  /// </summary>
  /// <param name="sender"></param>
  /// <param name="e"></param>
  protected void Page_Load(object sender, EventArgs e)
  {
    try
    {
      //获得天气预报服务支持的洲、国内外省份和城市信息，并保存到DataSet对象ds中
      DataSet ds = weather.getSupportDataSet();
      if (!IsPostBack)
      {
        DataTable dt = ds.Tables[0];
        ddlProvince.DataSource = dt;
        //将支持的洲、国内省份（直辖市、特别行政区）代码绑定到DataValueField
        ddlProvince.DataValueField = "ID";
        //将支持的洲、国内省份（直辖市、特别行政区）名称绑定到DataTextField
        ddlProvince.DataTextField = "Zone";
        ddlProvince.DataBind();
        dllCity.SelectedIndex = 1;
        // 调用自定义方法CityDataBind()，"1"表示直辖市
        CityDataBind("1");
        // 调用自定义方法GetWeatherByCode()，"54511"表示北京
        GetWeatherByCode("54511");
      }
    }
    catch (Exception ee)
    {
      lblError.Text = ee.Message;
    }
  }

  /// <summary>
  /// 将指定区域编号对应的城市名和城市代码填充到城市下拉列表中
  /// </summary>
  /// <param name="zoneID">指定的区域编号</param>
  protected void CityDataBind(string zoneID)
  {
    DataView dv = new DataView(weather.getSupportDataSet().Tables[1]);
    //筛选的条件是ZoneID的值等于zoneID的值
    dv.RowFilter = "[ZoneID] = " + zoneID;
    dllCity.DataSource = dv;
    //选择数据视图dv中的城市名数据列Area绑定到DataTextField
    dllCity.DataTextField = "Area";
    dllCity.DataValueField = "AreaCode";
    dllCity.DataBind();
    dllCity.Items.Insert(0, new ListItem("选择城市", "0"));
    dllCity.SelectedIndex = 0;
  }

  /// <summary>
  /// 根据指定的城市代码查询未来三天内天气情况和现在的天气实况
  /// </summary>
  /// <param name="cityCode">指定的城市代码</param>
  protected void GetWeatherByCode(string cityCode)
  {
    //返回值存放在数组wa中，共有23个元素。
    String[] wa = weather.getWeatherbyCityName(cityCode.Trim());
    lblNow.Text = wa[10];  // 现在的天气实况
    //当天的气温、概况、风向和风力
    lblToday.Text = wa[5] + "&nbsp;&nbsp;&nbsp;" + wa[6] + "&nbsp;&nbsp;&nbsp;" + wa[7];
    //明天的气温、概况、风向和风力
    lblTomorrow.Text = wa[12] + "&nbsp;&nbsp;&nbsp;" + wa[13] + "&nbsp;&nbsp;&nbsp;" + wa[14];
    //后天的气温、概况、风向和风力
    lblAfterTmr.Text = wa[17] + "&nbsp;&nbsp;&nbsp;" + wa[18] + "&nbsp;&nbsp;&nbsp;" + wa[19];
    //最后更新时间
    lblTime.Text = DateTime.Parse(wa[4]).ToString("yyyy年MM月dd日 dddd HH:mm");
    lblCity.Text = wa[0] + " / " + wa[1];  // 选择的省份、城市
    //显示天气趋势开始图片名称(简称图标一)和天气趋势结束图片名称(简称图标二)
    imgWeathertrendsTdS.ImageUrl = "~/Images/Weather/" + wa[8];  // 今天的图标一
    imgWeathertrendsTdE.ImageUrl = "~/Images/Weather/" + wa[9];  // 今天的图标二
    imgWeathertrendsTmS.ImageUrl = "~/Images/Weather/" + wa[15];  // 明天的图标一
    imgWeathertrendsTmE.ImageUrl = "~/Images/Weather/" + wa[16];  // 明天的图标二
    imgWeathertrendsAfS.ImageUrl = "~/Images/Weather/" + wa[20];  // 后天的图标一
    imgWeathertrendsAfE.ImageUrl = "~/Images/Weather/" + wa[21];  // 后天的图标二
  }

  protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e)
  {
    CityDataBind(ddlProvince.SelectedItem.Value.Trim());  //调用自定义方法CityDataBind()
  }

  protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
  {
    if (dllCity.Items[0].Value == "0")
    {
      dllCity.Items.RemoveAt(0);
    }
    GetWeatherByCode(dllCity.SelectedItem.Value.Trim());  //调用自定义方法GetWeatherByCode()
  }
}