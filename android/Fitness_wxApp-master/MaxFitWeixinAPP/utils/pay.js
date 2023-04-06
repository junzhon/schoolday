function wxpay(app, money, orderId, redirectUrl) {
  wx.request({
    url: 'https://api.it120.cc/' + app.globalData.subDomain + '/pay/wxapp/get-pay-data',
    data: {
      token:app.globalData.token,
      money:money,
      remark:"支付订单 ：" + orderId,
      payName:"在线支付",
      nextAction:{type:0, id:orderId}
    },
    //method:'POST',
    success: function(res){
      console.log('api result:');
      console.log(res.data);
      if(res.data.code == 0){
        // 发起支付
        wx.requestPayment({
          timeStamp:res.data.data.timeStamp,
          nonceStr:res.data.data.nonceStr,
          package:'prepay_id=' + res.data.data.prepayId,
          signType:'MD5',
          paySign:res.data.data.sign,
          fail:function (aaa) {
            wx.showToast({title: '支付失败:' + aaa})
          },
          success:function () {
            wx.showToast({title: '支付成功'})
            wx.reLaunch({
              url: redirectUrl
            });
          }
        })
      } else {
        wx.showToast({title: '服务器忙' + res.data.code})
      }
    }
  })
}

module.exports = {
  wxpay: wxpay
}
