using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex5_Register : System.Web.UI.Page
{
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    lblMsg.Text = "";
    if (Page.IsValid)
    {
      lblMsg.Text = "验证通过！";
      //TODO:将注册信息存入数据库
    }
  }

  protected void CsvIdentity_ServerValidate(object source, ServerValidateEventArgs args)
  {
    string cid = args.Value;  //获取输入的身份证号码    
    args.IsValid = true;  //初使设置为验证通过
    try
    {
      //获取身份证号中的出生日期并转换为DateTime类型
      DateTime.Parse(cid.Substring(6, 4) + "-" + cid.Substring(10, 2) + "-" + cid.Substring(12, 2));
    }
    catch
    {
      //若转换出错，则验证未通过
      args.IsValid = false;
    }
  }
}