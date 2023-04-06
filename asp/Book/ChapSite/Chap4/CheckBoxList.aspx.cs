using System;
using System.Web.UI.WebControls;
public partial class Chap4_CheckBoxList : System.Web.UI.Page
{
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    lblMsg.Text = "您选择了：";
    foreach (ListItem listItem in chklsSport.Items)  //遍历复选框列表中所有项
    {
      if (listItem.Selected)
      {
        lblMsg.Text = lblMsg.Text + listItem.Text + "&nbsp";
      }
    }
  }
}