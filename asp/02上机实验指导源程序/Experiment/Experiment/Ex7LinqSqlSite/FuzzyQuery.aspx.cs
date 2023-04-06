using System;
using System.Collections.Generic;
using System.Data.Linq.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FuzzyQuery : System.Web.UI.Page
{
  protected void BtnSearch_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();
    //查找分类名中包含输入内容的分类
    var results = from c in db.Category
                  where SqlMethods.Like(c.Name, "%" + txtSearch.Text + "%")
                  select c;
    if (results.Count() != 0)  //有满足条件的数据
    {
      gvCategory.DataSource = results;
      gvCategory.DataBind();
    }
    else                     //没有满足条件的数据
    {
      lblMsg.Text = "没有满足条件的数据！";
    }
  }
  protected void BtnReturn_Click(object sender, EventArgs e)
  {
    Response.Redirect("DataManage.aspx");
  }
}