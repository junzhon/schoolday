using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex4_Course : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)  //页面第一次载入，向各下拉列表框填充列表项
    {
      BindYear();     //调用自定义方法向“学年”下拉列表框填充列表项
      BindTerm();     //调用自定义方法向“学期”下拉列表框填充列表项
      BindCollege();  //调用自定义方法向“分院”下拉列表框填充列表项
      BindTeacher();  //调用自定义方法向“教师”下拉列表框填充列表项
    }
  }

  /// <summary>
  /// 自定义方法，向“学年”下拉列表框添加十个列表项：当前学年及之前的九个学年
  /// </summary>
  protected void BindYear()
  {
    ddlYear.Items.Clear();  //清空“学年”下拉列表框中的列表项
    int startYear = DateTime.Now.Year - 10;
    int currentYear = DateTime.Now.Year;
    //向“学年”下拉列表框添加列表项
    for (int i = startYear; i <= currentYear; i++)
    {
      ddlYear.Items.Add(new ListItem((i - 1).ToString() + "-" + i.ToString()));
    }
    //设置“学年”下拉列表框的默认列表项
    ddlYear.SelectedValue = (currentYear - 1).ToString() + "-" + currentYear.ToString();
  }

  /// <summary>
  /// 自定义方法，向“学期”下拉列表框添加1和2
  /// </summary>
  protected void BindTerm()
  {
    ddlTerm.Items.Clear();
    //向“学期”下拉列表框添加列表项
    for (int i = 1; i <= 2; i++)
    {
      ddlTerm.Items.Add(i.ToString());
    }
  }

  /// <summary>
  /// 自定义方法，向“学院”下拉列表框添加“计算机学院”、“外国语学院”和“机电学院”
  /// </summary>
  protected void BindCollege()
  {
    ddlCollege.Items.Clear();
    ddlCollege.Items.Add(new ListItem("计算机学院"));
    ddlCollege.Items.Add(new ListItem("外国语学院"));
    ddlCollege.Items.Add(new ListItem("机电学院"));
  }

  /// <summary>
  /// 根据不同的分院，向“教师”下拉列表框添加不同的教师姓名
  /// </summary>
  protected void BindTeacher()
  {
    ddlTeacher.Items.Clear();
    switch (ddlCollege.SelectedValue)  //根据不同的分院添加不同的教师姓名
    {
      case "计算机学院":  //在实际工程中，添加的数据应来源于数据库
        ddlTeacher.Items.Add(new ListItem("曹明"));
        ddlTeacher.Items.Add(new ListItem("李妙"));
        ddlTeacher.Items.Add(new ListItem("王芳"));
        break;
      case "外国语学院":
        ddlTeacher.Items.Add(new ListItem("张强"));
        ddlTeacher.Items.Add(new ListItem("王第男"));
        break;
      case "机电学院":
        ddlTeacher.Items.Add(new ListItem("朱兆清"));
        ddlTeacher.Items.Add(new ListItem("毛沁程"));
        break;
    }
  }

  protected void DdlCollege_SelectedIndexChanged(object sender, EventArgs e)
  {
    BindTeacher();  //调用自定义方法向“教师”下拉列表框填充列表项
  }
}