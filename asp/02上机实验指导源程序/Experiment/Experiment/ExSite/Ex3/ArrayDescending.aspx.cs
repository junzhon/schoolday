using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex3_ArrayDescending : System.Web.UI.Page
{
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    //获取文本框中输入的字符串,并在最后添加一个空格
    string sInput = txtInput.Text.Trim() + " ";  //引号中包含一个空格
    //j控制数组下标;每个aInput数组元素存储一个整数;temp存储一个整数字符串
    int j = 0;
    int[] aInput = new int[10];
    string temp = "0";
    //逐个获取sInput中每个字符。若不是空格，则将该字符连接到temp中；否则，将temp值转换为整数后存储到数组元素
    for (int i = 0; i <= sInput.Length - 1; i++)
    {
      if (sInput.Substring(i, 1) != " ")  //引号中包含一个空格
      {
        temp += sInput.Substring(i, 1);
      }
      else
      {
        aInput[j] = int.Parse(temp);
        j++;
        temp = "0";
      }
    }
    Array.Sort(aInput);  //升序排列数组    
    Array.Reverse(aInput);  //反转数组顺序
    foreach (int i in aInput)
    {
      if (i != 0)  //数组元素不为0
      {
        Response.Write(i + "&nbsp;&nbsp;");
      }
    }
  }
}