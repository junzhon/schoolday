using System;
using System.Web.UI.WebControls;
public partial class Chap4_PlaceHolder : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    Button btnSubmit = new Button();  //定义btnSubmit按钮控件
    btnSubmit.ID = "btnSubmit";  //设置btnSubmit按钮控件的ID属性
    btnSubmit.Text = "确定";     //设置btnSubmit按钮控件的Text属性 
    btnSubmit.Click += new EventHandler(BtnSubmit_Click);  //注册Click事件
    plhTest.Controls.Add(btnSubmit);  //将btnSubmit按钮控件添加到plhTest中
    TextBox txtInput = new TextBox();  //定义txtInput文本框控件
    txtInput.ID = "txtInput";
    plhTest.Controls.Add(txtInput);
  }
  protected void BtnSubmit_Click(object sender, EventArgs e)  //本行需自行输入
  {
    Response.Write("触发了“确定”按钮的Click事件！");
  }
  protected void BtnAcquire_Click(object sender, EventArgs e)
  {
    TextBox txtInput = (TextBox)plhTest.FindControl("txtInput");  //查找txtInput文本框控件
    Response.Write(txtInput.Text);
  }
}