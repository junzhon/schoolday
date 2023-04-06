using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex4_Choice : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //定义Label控件lblQuestion
    Label lblQuestion = new Label
    {
      ID = "lblQuestion",
      //设置题目要求。在实际工程中，数据应来源于数据库
      Text = "1.&nbsp;Web服务器控件不包括（&nbsp;&nbsp;&nbsp;&nbsp;）。"
    };
    //将lblQuestion控件添加到plhChoice控件中
    plhChoice.Controls.Add(lblQuestion);
    //定义RadioButtonList控件rdoltChoice
    RadioButtonList rdoltChoice = new RadioButtonList
    {
      ID = "rdoltChoice"
    };
    //设置单项选择题的选择项。在实际工程中，数据应来源于数据库
    rdoltChoice.Items.Add(new ListItem("A. Wizard", "A"));
    rdoltChoice.Items.Add(new ListItem("B. input", "B"));
    rdoltChoice.Items.Add(new ListItem("C. AdRotator", "C"));
    rdoltChoice.Items.Add(new ListItem("D. Calendar", "D"));
    plhChoice.Controls.Add(rdoltChoice);
  }

  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    //在plhChoice控件中查找rdoltChoice控件
    RadioButtonList rdoltChoice = (RadioButtonList)plhChoice.FindControl("rdoltChoice");
    lblDisplay.Text = "您选择了：" + rdoltChoice.SelectedValue;
  }
}