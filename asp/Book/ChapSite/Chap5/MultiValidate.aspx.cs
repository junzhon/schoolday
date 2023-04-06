using System;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Chap5_MultiValidate : System.Web.UI.Page
{
  protected void CvInput_ServerValidate(object source, ServerValidateEventArgs args)
  {
    string strID = args.Value;  //获取输入的身份证号    
    args.IsValid = true;  //验证控件状态初使设置为“通过”
    try
    {
      DateTime.Parse(strID.Substring(6, 4) + "-" + strID.Substring(10, 2) + "-" + strID.Substring(12, 2));  //获取身份证号中的出生日期并转换为DateTime类型
    }
    catch
    {
      args.IsValid = false;  //若转换出错，则验证未通过
    }
  }
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    lblMsg.Text = "";
    if (Page.IsValid)
    {
      lblMsg.Text = "验证通过！";
    }
  }
}