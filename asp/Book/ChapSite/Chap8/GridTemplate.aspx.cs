using System;
using System.Web.UI.WebControls;
public partial class Chap8_GridTemplate : System.Web.UI.Page
{
  protected void ChkAll_CheckedChanged(object sender, EventArgs e)
  {  
    //获取GridView标题行中chkAll对象  
    CheckBox chkAll = (CheckBox)sender;  
    foreach (GridViewRow gvRow in gvProduct.Rows)
    {
      //获取GridView数据行中chkItem对象
      CheckBox chkItem = (CheckBox)gvRow.FindControl("chkItem");
      chkItem.Checked = chkAll.Checked;
    }
  }
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    lblProductId.Text = "您选择的ProductId为：";
    foreach (GridViewRow gvRow in gvProduct.Rows)
    {
      CheckBox chkItem = (CheckBox)gvRow.FindControl("chkItem");
      if (chkItem.Checked)
      {
        lblProductId.Text += gvRow.Cells[1].Text + "、";
      }
    }
  }
}