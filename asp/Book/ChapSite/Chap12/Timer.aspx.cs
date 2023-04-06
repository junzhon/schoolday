using System;
public partial class Chap12_Timer : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    lblPageTime.Text = DateTime.Now.ToLongTimeString();
  }
  protected void TmrStock_Tick(object sender, EventArgs e)
  {
    //显示通过调用自定义方法产生的随机汇率值
    lblPrice.Text = GetStockPrice();
    //显示汇率时间
    lblPriceTime.Text = DateTime.Now.ToLongTimeString();
  }
  /// <summary>
  /// 自定义方法，用于产生一个随机的汇率值
  /// </summary>
  /// <returns>汇率值</returns>
  private string GetStockPrice()
  {
    double randomStockPrice = 5.8 + new Random().NextDouble();
    return randomStockPrice.ToString("C");
  }
  protected void RdoltFrequency_SelectedIndexChanged(object sender, EventArgs e)
  {
    if (rdoltFrequency.SelectedValue == "0")  //选择“不刷新”
    {
      tmrStock.Enabled = false;
    }
    else  //选择“5秒”或“10秒”
    {
      tmrStock.Enabled = true;
      tmrStock.Interval = int.Parse(rdoltFrequency.SelectedValue);
    }
  }
}