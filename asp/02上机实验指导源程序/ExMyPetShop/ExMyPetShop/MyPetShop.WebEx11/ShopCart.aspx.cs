using MyPetShop.BLL;
using System;
using System.Web.UI.WebControls;

public partial class ShopCart : System.Web.UI.Page
{
  CartItemService cartSrv = new CartItemService();
  ProductService productSrv = new ProductService();

  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      if (Session["CustomerId"] == null)    //一般用户未登录
      {
        Response.Redirect("~/Login.aspx");
      }
      else
      {
        lblWelcome.Text = "您好, " + Session["CustomerName"].ToString();
        lnkbtnPwd.Visible = true;
        lnkbtnOrder.Visible = true;
        lnkbtnLogout.Visible = true;
      }

      if (Request.QueryString["ProductId"] != null)
      {
        int productId = int.Parse(Request.QueryString["ProductId"]);
        //调用CartItemService类中的Insert()方法将指定商品号的商品添加到当前用户购物车
        cartSrv.Insert(Convert.ToInt32(Session["CustomerId"]), productId, 1);
      }
      lblHint.Text = "温馨提示：更改购买数量后，请单击'重新计算'按钮进行更新！";
      Bind();  //调用自定义方法，显示当前用户购物车中的所有商品
    }
  }

  protected void Bind()
  {
    //调用CartItemService类中的GetTotalPriceByCustomerId()方法获取当前用户购物车中所有商品的总价
    lblTotalPrice.Text = cartSrv.GetTotalPriceByCustomerId(Convert.ToInt32(Session["CustomerId"])).ToString();
    //调用CartItemService类中的GetCartItemByCustomerId()方法获取当前用户购物车中的所有商品
    gvCart.DataSource = cartSrv.GetCartItemByCustomerId(Convert.ToInt32(Session["CustomerId"]));
    gvCart.DataBind();
    if (gvCart.Rows.Count != 0)   //当前用户购物车中有商品
    {
      pnlCart.Visible = true;
      lblCart.Text = "";
    }
    else  //当前用户购物车中无商品
    {
      pnlCart.Visible = false;
      lblCart.Text = "购物车内无商品，请先购物！";
    }
  }

  ///// <summary>
  ///// 计算购物车中购物总金额
  ///// </summary>
  ///// <returns>返回总金额</returns>
  //protected decimal TotalPrice()
  //{
  //  return cartSrv.GetTotalPriceByCustomerId(Convert.ToInt32(Session["CustomerId"]));
  //}

  /// <summary>
  /// 循环利用FindControl()找到CheckBox控件chkProduct，然后判断其Checked值，若为True，则执行删除操作
  /// </summary>
  protected void BtnDelete_Click(object sender, EventArgs e)
  {
    int productId = 0;
    for (int i = 0; i < gvCart.Rows.Count; i++)
    {
      CheckBox chkProduct = new CheckBox();
      chkProduct = (CheckBox)gvCart.Rows[i].FindControl("chkProduct");
      if (chkProduct != null)
      {
        if (chkProduct.Checked)
        {
          productId = int.Parse(gvCart.Rows[i].Cells[1].Text);
          //调用CartItemService类中的Delete()方法删除当前用户购物车中指定商品编号的商品
          cartSrv.Delete(Convert.ToInt32(Session["CustomerId"]), productId);
        }
      }
    }
    Bind();  //调用自定义方法，显示当前用户购物车中的所有商品
  }

  protected void BtnClear_Click(object sender, EventArgs e)
  {
    //调用CartItemService类中的Clear()方法清除当前用户购物车中的所有商品
    cartSrv.Clear(Convert.ToInt32(Session["CustomerId"]));
    Response.Redirect("Default.aspx");
  }

  protected void BtnComputeAgain_Click(object sender, EventArgs e)
  {
    lblError.Text = "";
    //循环利用FindControl()找到TextBox控件txtQty，然后判断其是否为空值，若非空，则通过调用ProductService类中的GetProductByProductId()方法查找txtQty所在行商品编号确定的商品，以便比较txtQty中的输入值和商品的库存量
    for (int i = 0; i < gvCart.Rows.Count; i++)
    {
      TextBox txtQty = new TextBox();
      txtQty = (TextBox)gvCart.Rows[i].FindControl("txtQty");
      if (txtQty != null)
      {
        var product = productSrv.GetProductByProductId(Convert.ToInt32(gvCart.Rows[i].Cells[1].Text));

        if (int.Parse(txtQty.Text) > product.Qty)  //库存不足
        {
          lblError.Text += "Error：库存不足，商品名为 " + product.Name + " 的库存数量为 " + product.Qty.ToString() + "<br />";
        }
        else
        {
          //调用CartItemService类中的Update()方法更新当前用户购物车中商品的购买数量
          cartSrv.Update(Convert.ToInt32(Session["CustomerId"]), product.ProductId, Convert.ToInt32(txtQty.Text));
        }
      }
    }
    Bind();  //调用自定义方法，显示当前用户购物车中的所有商品
  }

  protected void BtnSettle_Click(object sender, EventArgs e)
  {
    //如果不为匿名访问，则转到订单地址提交页面，否则转到用户登录页面
    if (Session["CustomerId"] != null)
    {
      Response.Redirect("SubmitCart.aspx");
    }
    else
    {
      Response.Redirect("Login.aspx");
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
}