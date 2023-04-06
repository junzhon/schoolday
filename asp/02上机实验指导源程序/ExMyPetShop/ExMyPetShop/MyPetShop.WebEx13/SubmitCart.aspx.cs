using MyPetShop.BLL;
using System;
public partial class SubmitCart : System.Web.UI.Page
{
  OrderService orderSrv = new OrderService();
  protected void Page_Load(object sender, EventArgs e)
  {
    if (Session["CustomerId"] == null)
    {
      Response.Redirect("~/Login.aspx");
    }
    else
    {
      lblWelcome.Text = "您好, " + Session["CustomerName"].ToString();
      lnkbtnPwd.Visible = true;
      lnkbtnOrder.Visible = true;
      lnkbtnLogout.Visible = true;
      pnlConsignee.Visible = true;
      lblMsg.Text = "";
    }
  }

  protected void LnkbtnRegister_Click(object sender, EventArgs e)
  {
    Session.Clear();    //注销当前用户      
    Response.Redirect("~/NewUser.aspx");
  }

  protected void LnkbtnLogin_Click(object sender, EventArgs e)
  {
    Session.Clear();    //注销当前用户
    Response.Redirect("~/Login.aspx");
  }
  protected void LnkbtnLogout_Click(object sender, EventArgs e)
  {
    Session.Clear();    //注销当前用户
    Response.Redirect("~/Default.aspx");
  }
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    //调用OrderService类中的CreateOrderFromCart()方法根据当前用户购物车中的商品清单创建该用户的订单以及该订单的详细信息记录
    orderSrv.CreateOrderFromCart(
      Convert.ToInt32(Session["CustomerId"]),
      Session["CustomerName"].ToString(),
      txtAddr1.Text.Trim(), txtAddr2.Text.Trim(), txtCity.Text.Trim(),
      txtState.Text.Trim(), txtZip.Text.Trim(), txtPhone.Text.Trim());

    pnlConsignee.Visible = false;
    lblMsg.Text = "已经成功结算，谢谢光临！";
  }
}