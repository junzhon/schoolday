using System;
using System.Linq;
using System.Xml.Linq;
public partial class Chap7_LinqXml : System.Web.UI.Page
{
  protected void BtnCreate_Click(object sender, EventArgs e)
  {
    string xmlFilePath = Server.MapPath("~/Chap7/BookLinq.xml");  //要建立的XML文件路径    
    XDocument doc = new XDocument  //建立XDocument类实例doc
      (
        new XDeclaration("1.0", "utf-8", "yes"),
        new XComment("Book示例"),
        new XElement("Books",
          new XElement("Book",
            new XAttribute("ID", "100"),
            new XElement("BookName", "ASP.NET高级编程"),
            new XElement("Price", 156)
                      ),
          new XElement("Book",
            new XAttribute("ID", "101"),
            new XElement("BookName", "精通LINQ数据访问"),
            new XElement("Price", 39.8)
                      ),
          new XElement("Book",
            new XAttribute("ID", "102"),
            new XElement("BookName", "ASP.NET教程"),
            new XElement("Price", 41.6)
                      )
                    )
      );
    doc.Save(xmlFilePath);  //保存到XML文件    
    Response.Redirect("~/Chap7/BookLinq.xml");  //以重定向方式显示BookLinq.xml
  }
  protected void BtnQuery_Click(object sender, EventArgs e)
  {
    string xmlFilePath = Server.MapPath("~/Chap7/BookLinq.xml");
    XElement els = XElement.Load(xmlFilePath);  //导入XML文件
    //查询元素
    var elements = from el in els.Elements("Book")
                   where (string)el.Element("BookName") == "ASP.NET高级编程"
                   select el;
    foreach (XElement el in elements)
    {
      //输出元素的ID属性的值
      Response.Write(el.Name + "的ID为:" + el.Attribute("ID").Value + "<br />");
      //输出BookName元素的值
      Response.Write("书名为:" + el.Element("BookName").Value + "<br />");
      //输出Price元素的值
      Response.Write("价格为:" + el.Element("Price").Value);
    }
  }
  protected void BtnInsert_Click(object sender, EventArgs e)
  {
    string xmlFilePath = Server.MapPath("~/Chap7/BookLinq.xml");
    XElement els = XElement.Load(xmlFilePath);
    //新建Book元素
    XElement el = new XElement
      ("Book",
        new XAttribute("ID", "104"),
        new XElement("BookName", "C#高级编程"),
        new XElement("Price", 119.8)
      );
    els.Add(el);  //添加Book元素到XElement对象els
    els.Save(xmlFilePath);
    Response.Redirect("~/Chap7/BookLinq.xml");
  }
  protected void BtnUpdate_Click(object sender, EventArgs e)
  {
    string xmlFilePath = Server.MapPath("~/Chap7/BookLinq.xml");
    XElement els = XElement.Load(xmlFilePath);
    var elements = from el in els.Elements("Book")
                   where el.Attribute("ID").Value == "101"
                   select el;
    foreach (XElement el in elements)
    {
      el.SetAttributeValue("ID", "106");  //设置ID属性值
      //修改Book元素的子元素
      el.ReplaceNodes
        (
          new XElement("BookName", "基于C#精通LINQ数据访问"),
          new XElement("Price", 45.9)
        );
    }
    els.Save(xmlFilePath);
    Response.Redirect("~/Chap7/BookLinq.xml");
  }
  protected void BtnDelete_Click(object sender, EventArgs e)
  {
    string xmlFilePath = Server.MapPath("~/Chap7/BookLinq.xml");
    XElement els = XElement.Load(xmlFilePath);
    var elements = from el in els.Elements("Book")
                   where el.Attribute("ID").Value == "102"
                   select el;
    foreach (XElement el in elements)
    {
      el.Remove();  //删除一个节点元素
    }
    els.Save(xmlFilePath);
    Response.Redirect("~/Chap7/BookLinq.xml");
  }
}