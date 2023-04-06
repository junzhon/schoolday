using System;
public partial class Chap3_While : System.Web.UI.Page
{
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    int iSum = 0;  //iSum存放和
    int iInput = int.Parse(txtInput.Text);  //iInput存放类型转换后的文本框输入值
    int i = 1;  //循环变量i
    while (i <= iInput)
    {
      iSum += i;
      i += 2;
    }
    lblOutput.Text = "和为：" + iSum.ToString();
  }
}       