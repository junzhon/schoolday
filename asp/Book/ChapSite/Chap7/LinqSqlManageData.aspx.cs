using System;
using System.Linq;
public partial class Chap7_LinqSqlManageData : System.Web.UI.Page
{
  MyPetShopDataContext db = new MyPetShopDataContext();  //定义MyPetShopDataContext类实例db
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      Bind();  //调用自定义方法，用于在gvCategory中显示最新结果
    }
  }
  protected void Bind()
  {
    var results = from r in db.Category
                  select r;
    gvCategory.DataSource = results;
    gvCategory.DataBind();
  }
  protected void BtnInsert_Click(object sender, EventArgs e)
  {
    Category category = new Category();  //建立Category实例category
    category.Name = txtName.Text;
    category.Descn = txtDescn.Text;
    db.Category.InsertOnSubmit(category);   //插入实体category
    db.SubmitChanges();  //提交更改
    Bind();  //调用自定义方法，用于在gvCategory中显示最新结果
  }
  protected void BtnUpdate_Click(object sender, EventArgs e)
  {
    var results = from r in db.Category
                  where r.CategoryId == int.Parse(txtCategoryId.Text)
                  select r;
    if (results != null)
    {
      foreach (Category r in results)
      {
        r.Name = txtName.Text;
        r.Descn = txtDescn.Text;
      }
      db.SubmitChanges();
      Bind();  //调用自定义方法，用于在gvCategory中显示最新结果
    }
  }
  protected void BtnDelete_Click(object sender, EventArgs e)
  {
    var results = from r in db.Category
                  where r.CategoryId == int.Parse(txtCategoryId.Text)
                  select r;
    db.Category.DeleteAllOnSubmit(results);
    db.SubmitChanges();
    Bind();  //调用自定义方法，用于在gvCategory中显示最新结果
  }
  protected void BtnProcedure_Click(object sender, EventArgs e)
  {
    db.CategoryInsert(txtName.Text.ToString(), txtDescn.Text.ToString());
    Bind();  //调用自定义方法，用于在gvCategory中显示最新结果
  }
}