using System;

public partial class Ex4_Calculator : System.Web.UI.Page
{   //num1存储算式中第1个数字字符串；num2存储算式中第2个数字字符串；total存储将所有输入的数连接后的数字字符串；sign存储运算符号
  static string num1 = "0", num2 = "0", total = "", sign = "";

  protected void BtnOne_Click(object sender, EventArgs e)
  {
    total += "1";  //将数字字符串"1"与total原值连接后再存入total
    txtDisplay.Text = total;
  }

  protected void BtnTwo_Click(object sender, EventArgs e)
  {
    total += "2";
    txtDisplay.Text = total;
  }

  protected void BtnThree_Click(object sender, EventArgs e)
  {
    total += "3";
    txtDisplay.Text = total;
  }

  protected void BtnAdd_Click(object sender, EventArgs e)
  {
    if (sign.Length == 1)  //sign已存储运算符号
    {
      Count();             //调用自定义方法Count()计算结果
      num1 = txtDisplay.Text;
      sign = "+";
    }
    else                  //sign未存储运算符号
    {
      num1 = txtDisplay.Text;
      txtDisplay.Text = "";
      total = "";
      sign = "+";
    }
  }

  protected void BtnSubtract_Click(object sender, EventArgs e)
  {
    if (sign.Length == 1)  //sign已存储运算符号
    {
      Count();             //调用自定义方法Count()计算结果
      num1 = txtDisplay.Text;
      sign = "-";
    }
    else                   //sign未存储运算符号
    {
      num1 = txtDisplay.Text;
      txtDisplay.Text = "";
      total = "";
      sign = "-";
    }
  }

  protected void BtnEqual_Click(object sender, EventArgs e)
  {
    Count();  //调用自定义方法Count()计算结果
  }

  /// <summary>
  /// 计算“num1 运算符 num2”的结果
  /// </summary>
  protected void Count()
  {
    num2 = txtDisplay.Text;
    if (num2 == "")  //num2值为空字符串
    {
      num2 = "0";
    }
    switch (sign)   //根据不同的运算符分别计算结果
    {
      case "+":
        txtDisplay.Text = (int.Parse(num1) + int.Parse(num2)).ToString();
        num1 = "0";
        num2 = "0";
        total = "";
        sign = "";
        break;
      case "-":
        txtDisplay.Text = (int.Parse(num1) - int.Parse(num2)).ToString();
        num1 = "0";
        num2 = "0";
        total = "";
        sign = "";
        break;
    }
  }
}