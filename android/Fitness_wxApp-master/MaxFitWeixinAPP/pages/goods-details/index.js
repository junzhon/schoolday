//index.js
//获取应用实例
var app = getApp();
var WxParse = require('../../wxParse/wxParse.js');

Page({
  data: {
    autoplay: true,
    interval: 3000,
    duration: 1000,
    goodsDetail:{},
    swiperCurrent: 0,  
    hasMoreSelect:false,
    selectSize:"上课时间选择：",
    selectSizePrice:0,
    shopNum:0,
    hideShopPopup:true,
    buyNumber:0,
    buyNumMin:0,
    buyNumMax:0,

    propertyChildIds:"",
    propertyChildNames:"",
    canSubmit:false, //  选中规格尺寸时候是否允许加入购物车
    shopCarInfo:{},
    modalContent:"",
    modalHidden:true
  },

  //事件处理函数
  swiperchange: function(e) {
      //console.log(e.detail.current)
       this.setData({  
        swiperCurrent: e.detail.current  
    })  
  },
  onLoad: function (e) {
    console.log('onLoad');
    var that = this;
    // 获取购物车数据
    wx.getStorage({
      key: 'shopCarInfo',
      success: function(res) {
        console.log(res.data)
        that.setData({
          shopCarInfo:res.data,
          shopNum:res.data.shopNum
        });
      } 
    })

    wx.request({
      url: 'https://api.it120.cc/'+ app.globalData.subDomain +'/shop/goods/detail',
      data: {
        id: e.id
      },
      success: function(res) {
        var selectSizeTemp = "";
        console.log(res)
        if (res.data.data.properties) {
          for(var i=0;i<res.data.data.properties.length;i++){
            selectSizeTemp = selectSizeTemp + " " + res.data.data.properties[i].name;
          }
          that.setData({
            hasMoreSelect:true,
            selectSize:that.data.selectSize + selectSizeTemp,
            selectSizePrice:res.data.data.basicInfo.minPrice,
          });
        }
        that.data.goodsDetail = res.data.data;
        that.setData({
          goodsDetail:res.data.data,
          selectSizePrice:res.data.data.basicInfo.minPrice,
          buyNumMax:res.data.data.basicInfo.stores,
          buyNumber:(res.data.data.basicInfo.stores>0) ? 1: 0
        });
        WxParse.wxParse('article', 'html', res.data.data.content, that, 15);
      }
    })


  },
  bindGuiGeTap: function() {
     this.setData({  
        hideShopPopup: false 
    })  
  },
  closePopupTap: function() {
     this.setData({  
        hideShopPopup: true 
    })  
  },
  numJianTap: function() {
    //  if(this.data.buyNumber > this.data.buyNumMin){
    //     var currentNum = this.data.buyNumber;
    //     currentNum--; 
    //     this.setData({  
    //         buyNumber: currentNum
    //     })  
    //  }
  },
  numJiaTap: function() {
    //  if(this.data.buyNumber < this.data.buyNumMax){
    //     var currentNum = this.data.buyNumber;
    //     currentNum++ ;
    //     this.setData({  
    //         buyNumber: currentNum
    //     })  
    //  }
  },
  labelItemTap: function(e) {
    var that = this;
    /*
    console.log(e)
    console.log(e.currentTarget.dataset.propertyid)
    console.log(e.currentTarget.dataset.propertyname)
    console.log(e.currentTarget.dataset.propertychildid)
    console.log(e.currentTarget.dataset.propertychildname)
    */
    // 取消该分类下的子栏目所有的选中状态
    var childs = that.data.goodsDetail.properties[e.currentTarget.dataset.propertyindex].childsCurGoods;
    for(var i = 0;i < childs.length;i++){
      that.data.goodsDetail.properties[e.currentTarget.dataset.propertyindex].childsCurGoods[i].active = false;
    }
    // 设置当前选中状态
    that.data.goodsDetail.properties[e.currentTarget.dataset.propertyindex].childsCurGoods[e.currentTarget.dataset.propertychildindex].active = true;
    // 获取所有的选中规格尺寸数据
    var needSelectNum = that.data.goodsDetail.properties.length;
    var curSelectNum = 0;
    var propertyChildIds= "";
    var propertyChildNames = "";
    for (var i = 0;i < that.data.goodsDetail.properties.length;i++) {
      childs = that.data.goodsDetail.properties[i].childsCurGoods;
      for (var j = 0;j < childs.length;j++) {
        if(childs[j].active){
          curSelectNum++;
          propertyChildIds = propertyChildIds + that.data.goodsDetail.properties[i].id + ":"+ childs[j].id +",";
          propertyChildNames = propertyChildNames + that.data.goodsDetail.properties[i].name + ":"+ childs[j].name +"  ";
        }
      }
    }
    var canSubmit = false;
    if (needSelectNum == curSelectNum) {
      canSubmit = true;
    }
    // 计算当前价格
    if (canSubmit) {
      wx.request({
        url: 'https://api.it120.cc/'+ app.globalData.subDomain +'/shop/goods/price',
        data: {
          goodsId: that.data.goodsDetail.basicInfo.id,
          propertyChildIds:propertyChildIds
        },
        success: function(res) {
          that.setData({
            selectSizePrice:res.data.data.price,
            propertyChildIds:propertyChildIds,
            propertyChildNames:propertyChildNames,
            buyNumMax:res.data.data.stores,
            buyNumber:(res.data.data.stores>0) ? 1: 0
          });
        }
      })
    }

    
    this.setData({
      goodsDetail: that.data.goodsDetail,
      canSubmit:canSubmit
    })  
  },
  addShopCar:function(){
    if (this.data.goodsDetail.properties && !this.data.canSubmit) {
      this.bindGuiGeTap();
      console.log(this.data.goodsDetail.properties);
      console.log(!this.data.canSubmit);
      return;
    }
    if(this.data.buyNumber < 1){
      wx.showModal({
        title: '提示',
        content: '课程爆满了哦~',
        showCancel:false
      })
      return;
    }
    // 加入购物车
    var shopCarMap = {};
    shopCarMap.goodsId=this.data.goodsDetail.basicInfo.id;
    shopCarMap.pic=this.data.goodsDetail.basicInfo.pic;
    shopCarMap.name=this.data.goodsDetail.basicInfo.name;
    // shopCarMap.label=this.data.goodsDetail.basicInfo.id; 规格尺寸 
    shopCarMap.propertyChildIds=this.data.propertyChildIds;
    shopCarMap.label=this.data.propertyChildNames;
    shopCarMap.price=this.data.selectSizePrice;
    shopCarMap.left="";
    shopCarMap.active=true;
    shopCarMap.number = this.data.buyNumber;
    shopCarMap.logisticsType=this.data.goodsDetail.basicInfo.logisticsId;

    var shopCarInfo = this.data.shopCarInfo;
    if (!shopCarInfo.shopNum){
      shopCarInfo.shopNum = 0;
    }
    if (!shopCarInfo.shopList){
      shopCarInfo.shopList = [];
    }
    var hasSameGoodsIndex = -1;
    for (var i = 0;i<shopCarInfo.shopList.length;i++) {
      var tmpShopCarMap = shopCarInfo.shopList[i];
      if (tmpShopCarMap.goodsId == shopCarMap.goodsId && tmpShopCarMap.propertyChildIds == shopCarMap.propertyChildIds) {
        hasSameGoodsIndex = i;
        shopCarMap.number=shopCarMap.number + tmpShopCarMap.number;
        break;
      }
    }

    shopCarInfo.shopNum = shopCarInfo.shopNum + this.data.buyNumber;
    if (hasSameGoodsIndex > -1) {
      shopCarInfo.shopList.splice(hasSameGoodsIndex,1, shopCarMap);
    } else {
       shopCarInfo.shopList.push(shopCarMap);
    }

    this.setData({
      shopCarInfo:shopCarInfo,
      shopNum:shopCarInfo.shopNum
    });

    // 写入本地存储
    wx.setStorage({
      key:"shopCarInfo",
      data:shopCarInfo
    })
    this.closePopupTap();
    wx.showToast({
      title: '加入待确认课程成功',
      icon: 'success',
      duration: 2000
    })
    //console.log(shopCarInfo);

    //shopCarInfo = {shopNum:12,shopList:[]}
  },
  goShopCar:function () {
    wx.navigateTo({
      url: "/pages/shop-cart/index"
    });
  },
  tobuy:function(){
    if (this.data.goodsDetail.properties && !this.data.canSubmit) {
      this.bindGuiGeTap();
      return;
    }

    //临时代码，根据商户需求更改
    this.setData({
      modalContent: '请确认您预定的课程信息\r\n课程名称: ' + this.data.goodsDetail.basicInfo.name + '\r\n上课时间: ' + this.data.propertyChildNames + '\r\n请检查无误后点击确认',
      modalHidden: false
    });

    // if(this.data.buyNumber < 1){
    //   wx.showModal({
    //     title: '提示',
    //     content: '课程爆满了哦~',
    //     showCancel:false
    //   })
    //   return;
    // }
    // this.addShopCar();
    // this.goShopCar();
  },
  modalHide:function () {
    this.setData({
      modalContent: '',
      modalHidden: true
    });
    wx.showModal({
      title: '提示',
      content: '具体预定方式待与商家沟通后继续开发。谢谢配合。',
    })
  },
  modalHideCancle:function (){
    this.setData({
      modalContent: '',
      modalHidden: true
    });
  },
  onShareAppMessage: function () {
    return {
      title: this.data.goodsDetail.basicInfo.name,
      path: '/pages/goods-details/index?id=' + this.data.goodsDetail.basicInfo.id,
      success: function (res) {
        // 转发成功
      },
      fail: function (res) {
        // 转发失败
      }
    }
  }
})
