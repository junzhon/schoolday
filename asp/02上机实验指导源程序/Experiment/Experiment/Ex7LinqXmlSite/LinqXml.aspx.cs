using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class LinqXml : System.Web.UI.Page
{
  protected void BtnQueryAll_Click(object sender, EventArgs e)
  {
    //输出JavaScript代码打开新窗口显示Category.xml
    Response.Write("<script>window.open('Category.xml','_blank')</script>");
  }

  protected void BtnQuery_Click(object sender, EventArgs e)
  {
    //从Category.xml载入XML元素
    string xmlFilePath = Server.MapPath("~/Category.xml");
    XElement els = XElement.Load(xmlFilePath);
    //查询元素
    var elements = from el in els.Elements("Category")
                   where (string)el.Element("Name") == txtName.Text
                   select el;
    if (elements.Count() == 0)  //没有满足条件的元素
    {
      lblMsg.Text = "没有满足条件的数据！";
    }
    else  //有满足条件的元素
    {
      foreach (XElement el in elements)
      {
        lblMsg.Text = "CategoryId：" + el.Element("CategoryId").Value + "<br />" + "Name：" + el.Element("Name").Value + "<br />" + "Descn：" + el.Element("Descn").Value;
      }
    }
  }

  protected void BtnInsert_Click(object sender, EventArgs e)
  {
    Response.Redirect("LinqXmlInsert.aspx");
  }
}