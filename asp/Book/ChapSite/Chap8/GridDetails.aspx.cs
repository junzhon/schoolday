using System.Web.UI.WebControls;
public partial class Chap8_GridDetails : System.Web.UI.Page
{
  protected void DvProduct_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
  {
    gvProduct.DataBind();
  }
  protected void DvProduct_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
  {
    gvProduct.DataBind();
  }
}