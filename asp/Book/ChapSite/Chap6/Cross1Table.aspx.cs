public partial class Chap6_Cross1Table : System.Web.UI.Page
{
  public string Name  //公共属性Name,获取用户名文本框中内容
  {
    get { return txtName.Text; }
  }
}