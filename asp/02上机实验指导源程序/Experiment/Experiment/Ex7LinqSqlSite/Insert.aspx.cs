using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Insert : System.Web.UI.Page
{
  protected void BtnInsert_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();  //定义MyPetShopDataContext类实例db
    Category category = new Category();  //建立Category实例category
    category.Name = txtName.Text;
    category.Descn = txtDescn.Text;
    db.Category.InsertOnSubmit(category);   //插入实体category
    db.SubmitChanges();  //提交更改
  }
  protected void BtnReturn_Click(object sender, EventArgs e)
  {
    Response.Redirect("DataManage.aspx");
  }
}