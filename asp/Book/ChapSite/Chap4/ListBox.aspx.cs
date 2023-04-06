using System;
public partial class Chap4_ListBox : System.Web.UI.Page
{
  protected void BtnMove_Click(object sender, EventArgs e)
  {
    for (int i = 0; i < lstLeft.Items.Count; i++)  //遍历左边列表框中所有项
    {
      if (lstLeft.Items[i].Selected)  //判断数据项是否选中
      {
        lstRight.Items.Add(lstLeft.Items[i]);  //向右边列表框添加选中的一项
        lstLeft.Items.Remove(lstLeft.Items[i]);
        i--;  //调整左边列表框中剩余项索引号
      }
    }
  }
}