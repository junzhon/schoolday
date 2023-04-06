using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DataManage : System.Web.UI.Page
{
  MyPetShopDataContext db = new MyPetShopDataContext();  //定义MyPetShopDataContext类实例db 

  /// <summary>
  ///自定义方法Bind()，用于在gvCategory中显示Category表的最新结果 
  /// </summary>
  protected void Bind()
  {
    var results = from c in db.Category
                  select c;
    gvCategory.DataSource = results;
    gvCategory.DataBind();
  }

  protected void BtnQueryAll_Click(object sender, EventArgs e)
  {
    Bind();  //调用自定义方法，在gvCategory中显示Category表的最新结果
  }

  protected void BtnFuzzy_Click(object sender, EventArgs e)
  {
    Response.Redirect("FuzzyQuery.aspx");
  }

  protected void BtnInsert_Click(object sender, EventArgs e)
  {
    Response.Redirect("Insert.aspx");
  }

  protected void BtnUpdate_Click(object sender, EventArgs e)
  {
    Response.Redirect("Update.aspx?CategoryId=" + txtCategoryId.Text);
  }

  protected void BtnDelete_Click(object sender, EventArgs e)
  {
    var results = from c in db.Category
                  where c.CategoryId == int.Parse(txtCategoryId.Text)
                  select c;
    db.Category.DeleteAllOnSubmit(results);
    db.SubmitChanges();
    Bind();  //调用自定义方法，在gvCategory中显示Category表的最新结果
  }
}