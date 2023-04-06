using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCart : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      if (Session["cart"] == null)  //没有选购任何宠物
      {
        lblMsg.Text = "没有选购任何宠物！";
        btnClear.Enabled = false;
      }
      else  //已选购宠物
      {
        string strPets = Session["cart"].ToString();
        //数组列表pets用于存储每个宠物名
        System.Collections.ArrayList pets = new System.Collections.ArrayList();
        //取得第一个英文逗号的位置
        int iPosition = strPets.IndexOf(",");
        //当strPets中还包含宠物名时，执行循环体
        while (iPosition != -1)
        {
          string strPet = strPets.Substring(0, iPosition);
          if (strPet != "")
          {
            pets.Add(strPet);
            strPets = strPets.Substring(iPosition + 1);
            iPosition = strPets.IndexOf(",");
          }
        }
        lblMsg.Text = "购物车中现有宠物：";
        chklsPet.DataSource = pets;  //设置chklsPet的数据源      
        chklsPet.DataBind();         //显示数据
      }
    }
  }

  protected void BtnClear_Click(object sender, EventArgs e)
  {
    Session.Remove("cart"); //清空Session变量cart     
    lblMsg.Text = "没有选购任何宠物！";
    chklsPet.Visible = false;
    btnClear.Enabled = false;
  }

  protected void BtnContinue_Click(object sender, EventArgs e)
  {
    Response.Redirect("Default.aspx");
  }
}