using System.Web.UI.WebControls;
public partial class Chap8_GridDelete : System.Web.UI.Page
{
  protected void GvCategory_RowDataBound(object sender, GridViewRowEventArgs e)
  {
    if (e.Row.RowType == DataControlRowType.DataRow)  //判断数据行
    {
      try
      {
        //获取“删除”链接
        LinkButton lnkbtnDelete = (LinkButton)e.Row.Cells[4].Controls[0];
        //添加JavaScript代码实现客户端信息的提示
        lnkbtnDelete.OnClientClick = "return confirm('您真要删除分类名为" +
 e.Row.Cells[1].Text + "的记录吗?');";
      }
      catch
      {
        //若try块有异常，则不做任何操作
      }
    }
  }
}