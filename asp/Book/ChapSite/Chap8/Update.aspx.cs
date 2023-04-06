using System;
using System.Linq;
public partial class Chap8_Update : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack & Request.QueryString["CategoryId"] != null)
    {
      int categoryId = int.Parse(Request.QueryString["CategoryId"]);
      MyPetShopDataContext db = new MyPetShopDataContext();
      //获取要修改的记录
      var category = (from r in db.Category
                      where r.CategoryId == categoryId
                      select r).First();
      //分类编号是标识，不能更改
      txtCategoryId.ReadOnly = true;
      txtCategoryId.Text = category.CategoryId.ToString();
      txtName.Text = category.Name;
      txtDescn.Text = category.Descn;
    }
  }
  protected void BtnUpdate_Click(object sender, EventArgs e)
  {
    MyPetShopDataContext db = new MyPetShopDataContext();    
    var category = (from r in db.Category
                    where r.CategoryId == int.Parse(txtCategoryId.Text)
                    select r).First();
    category.Name = txtName.Text;
    category.Descn = txtDescn.Text;
    db.SubmitChanges();
    Response.Redirect("~/Chap8/GridUpdate.aspx");
  }
}