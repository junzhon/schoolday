using System;
using System.Web.UI.WebControls;
public partial class Chap8_GridPageSort : System.Web.UI.Page
{
  protected void DdlPageSize_SelectedIndexChanged(object sender, EventArgs e)
  {
    gvProduct.PageSize = int.Parse(ddlPageSize.SelectedValue);
    gvProduct.DataBind();
  }
  protected void GvProduct_RowDataBound(object sender, GridViewRowEventArgs e)
  {
    lblMsg.Text = "当前页为第" + (gvProduct.PageIndex + 1).ToString() + "页，共有" + (gvProduct.PageCount).ToString() + "页";
  }
}