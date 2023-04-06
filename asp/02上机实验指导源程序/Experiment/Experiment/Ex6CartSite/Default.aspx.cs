using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
  protected void BtnBuy_Click(object sender, EventArgs e)
  {
    //循环查找选中的宠物
    for (int i = 0; i < chklsPet.Items.Count; i++)
    {
      if (chklsPet.Items[i].Selected)
      {
        //将宠物名和英文逗号连接到Session变量cart中，其中英文逗号用于分隔不同的宠物名
        Session["cart"] += chklsPet.Items[i].Text + ",";
      }
    }
  }

  protected void BtnView_Click(object sender, EventArgs e)
  {
    Response.Redirect("ViewCart.aspx");
  }
}