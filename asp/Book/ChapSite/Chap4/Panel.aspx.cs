using System;
public partial class Chap4_Panel : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      pnlStep1.Visible = true;  //设置pnlStep1可见
      pnlStep2.Visible = false;  //设置pnlStep2不可见
      pnlStep3.Visible = false;  //设置pnlStep3不可见
    }
  }
  protected void BtnStep1_Click(object sender, EventArgs e)
  {
    pnlStep1.Visible = false;
    pnlStep2.Visible = true;
    pnlStep3.Visible = false;
  }
  protected void BtnStep2_Click(object sender, EventArgs e)
  {
    pnlStep1.Visible = false;
    pnlStep2.Visible = false;
    pnlStep3.Visible = true;    
    lblMsg.Text = "用户名：" + txtUser.Text + "<br />姓名：" + txtName.Text + "<br />电话：" + txtTelephone.Text;  //输出用户信息
  }
  protected void BtnStep3_Click(object sender, EventArgs e)
  {
    //TODO:将用户信息保存到数据库
  }
}