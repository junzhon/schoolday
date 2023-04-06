using System;
using System.Linq;
using System.Xml.Linq;

public partial class TableToXml : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //要建立的XML文件路径
    string xmlFilePath = Server.MapPath("~/Category.xml");
    //建立XDocument对象doc
    XDocument doc = new XDocument
      (
        new XDeclaration("1.0", "utf-8", "yes"),
        new XComment("分类"),
        new XElement("Categories")
      );
    doc.Save(xmlFilePath);  //保存到文件
    XElement els = XElement.Load(xmlFilePath);  //创建XElement对象
    MyPetShopDataContext db = new MyPetShopDataContext();
    var results = from c in db.Category
                  select c;
    foreach (Category category in results)
    {
      //建立Category元素以及相应的子元素CategoryId、Name和Descn
      XElement el = new XElement("Category",
        new XElement("CategoryId", category.CategoryId),
        new XElement("Name", category.Name),
        new XElement("Descn", category.Descn));
      els.Add(el);  //添加到XElement对象中
    }
    els.Save(xmlFilePath);   //保存XElement对象    
    Response.Redirect("~/Category.xml");  //重定向方式查看Category.xml文件内容
  }
}