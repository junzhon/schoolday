using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class LinqXmlInsert : System.Web.UI.Page
{
  protected void btnInsert_Click(object sender, EventArgs e)
  {
    string xmlFilePath = Server.MapPath("~/Category.xml");
    XElement els = XElement.Load(xmlFilePath);
    //新建<Category>元素
    XElement el = new XElement("Category",
      new XElement("CategoryId", txtCategoryId.Text),
      new XElement("Name", txtName.Text),
      new XElement("Descn", txtDescn.Text));
    els.Add(el);  //添加<Category>元素
    els.Save(xmlFilePath);  //保存到Category.xml文件
  }

  protected void btnReturn_Click(object sender, EventArgs e)
  {
    Response.Redirect("LinqXml.aspx");
  }
}