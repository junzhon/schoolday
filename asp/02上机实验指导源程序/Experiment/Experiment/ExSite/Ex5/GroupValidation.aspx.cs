using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex5_GroupValidation : System.Web.UI.Page
{
  protected void BtnValidateName_Click(object sender, EventArgs e)
  {
    if (txtName.Text == "leaf")  //在实际工程中，应与数据库中的用户名比较
    {
      lblName.Text = "抱歉！该用户名已被占用！";
    }
    else
    {
      lblName.Text = "恭喜！该用户名可用！";
    }
  }

  protected void CvIdentity_ServerValidate(object source, ServerValidateEventArgs args)
  {
    //获取输入的身份证号码 
    string cid = args.Value;
    //初使设置为验证通过
    args.IsValid = true;
    try
    {
      //获取身份证号码中的出生日期并转换为DateTime类型
      DateTime.Parse(cid.Substring(6, 4) + "-" + cid.Substring(10, 2) + "-" + cid.Substring(12, 2));
    }
    catch
    {
      //若转换出错，则验证未通过
      args.IsValid = false;
    }
  }

  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    lblMsg.Text = "";
    if (Page.IsValid)
    {
      lblMsg.Text = "验证通过！";
      //TODO:将注册信息存入数据库
    }
  }
}