using System;
using System.Linq;
public partial class Chap8_DropLinq : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      MyPetShopDataContext db = new MyPetShopDataContext();
      var results = from r in db.Category
                    select r;
      ddlCategory.DataSource = results;
      ddlCategory.DataBind();
    }
  }
  protected void DdlCategory_SelectedIndexChanged(object sender, EventArgs e)
  {
    lblMsg.Text = "您选择的CategoryId为：" + ddlCategory.SelectedValue;
  }
}