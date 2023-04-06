using System;
using System.Web.UI.WebControls;
public partial class Chap4_DropDownList : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)  //页面第一次载入时向各下拉列表框填充数据
    {
      BindYear();  //调用自定义方法BindYear()向“年份”下拉列表框填充数据
      BindMonth();  //调用自定义方法BindMonth()向“月份”下拉列表框填充数据
      BindDay();  //调用自定义方法BindDay()向“日期”下拉列表框填充数据
    }
  }
  protected void BindYear()
  {
    ddlYear.Items.Clear();  //清空ddlYear
    int startYear = DateTime.Now.Year - 10;
    int currentYear = DateTime.Now.Year;
    for (int i = startYear; i <= currentYear; i++)  //向ddlYear添加最近十年的年份
    {
      ddlYear.Items.Add(new ListItem(i.ToString()));
    }
    ddlYear.SelectedValue = currentYear.ToString();  //设置ddlYear的默认项
  }
  protected void BindMonth()
  {
    ddlMonth.Items.Clear();
    for (int i = 1; i <= 12; i++)  //向ddlMonth添加一年的月份
    {
      ddlMonth.Items.Add(i.ToString());
    }
  }
  protected void BindDay()
  {
    ddlDay.Items.Clear();
    string year = ddlYear.SelectedValue;  //获取ddlYear中选定项的值
    string month = ddlMonth.SelectedValue;
    int days = DateTime.DaysInMonth(int.Parse(year), int.Parse(month));  //获取相应年、月对应的天数    
    for (int i = 1; i <= days; i++)  //向ddlDay添加相应年、月对应的天数
    {
      ddlDay.Items.Add(i.ToString());
    }
  }
  protected void DdlYear_SelectedIndexChanged(object sender, EventArgs e)
  {
    BindDay();
  }
  protected void DdlMonth_SelectedIndexChanged(object sender, EventArgs e)
  {
    BindDay();
  }
}