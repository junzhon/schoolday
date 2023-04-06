using dotnetApp;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace TestDemo3
{
    /// <summary>
    /// RoomBookHandler 的摘要说明
    /// </summary>
    public class RoomBookHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string action = context.Request["action"];
            if (!string.IsNullOrEmpty(action))
            {
                switch (action)
                {
                    case "bookRoom":
                        string[] bookTime = context.Request["bookTime"].Split('-');
                        string bookSt = bookTime[0].Trim();
                        string bookEt = bookTime[1].Trim();
                        string bookDate = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
                        string roomNumber = context.Request["roomNo"];
                        //预定时间区间判断
                        var bookInfoSql = "select BookSt, BookSt from BookInfo where " +
                            "BookDate='{0}' And RoomNumber='{1}'";
                        bookInfoSql = string.Format(bookInfoSql, bookDate, roomNumber);
                        DataTable dtBookInfo = SqlHelper.getDataTable(bookInfoSql);
                        Boolean notOverlap = true;
                        for (int i = 0; i < dtBookInfo.Rows.Count; i++)
                        {
                            //大于已预约右边，小于已预约左边
                            notOverlap &= ( (string.Compare(bookSt, dtBookInfo.Rows[i][1].ToString().Trim(), true) > 0) ||
                                            (string.Compare(bookEt, dtBookInfo.Rows[i][0].ToString().Trim(), true) < 0) );
                        }
                        if (!notOverlap)
                        {
                            context.Response.Write("该时间段已经有别人预约啦，请重新选择！");
                        }
                        else
                        {
                            string customerName = context.Request.Cookies["login_name"].Value;
                            string myRemark = context.Request["myRemark"];
                            if (string.IsNullOrEmpty(myRemark))
                            {
                                myRemark = "无";
                            }

                            DateTime dt1 = DateTime.Parse(bookDate + " " + bookSt);
                            DateTime dt2 = DateTime.Parse(bookDate + " " + bookEt);
                            TimeSpan ts = dt2.Subtract(dt1);
                            double bookDurationHours = Math.Round(ts.TotalHours, 2);

                            DataTable dtLastID = SqlHelper.getDataTable("select top 1 ID from BookInfo order by ID DESC");
                            string insIdStr = dtLastID.Rows[0][0].ToString();
                            int insId = int.Parse(insIdStr) + 1;
                            //插入到数据库中去
                            var bookSql = "INSERT INTO BookInfo(ID, CustomerName,MyRemark,BookDate,BookSt,BookDuration,RoomNumber,BookEt) " +
                                "VALUES ({0},'{1}','{2}','{3}','{4}','{5}','{6}','{7}')";
                            bookSql = string.Format(bookSql, insId, customerName, myRemark, bookDate, bookSt, bookDurationHours,
                                roomNumber, bookEt);
                            if (SqlHelper.ExecuteSql(bookSql) > 0)
                            {
                                context.Response.Write("预定成功！");
                            }
                            else
                            {
                                context.Response.Write("后台数据插入出错！");
                            }
                        }
                        break;
                    case "flushRoom":
                        DataTable dtRoom = SqlHelper.getDataTable("select * from RoomInfo");
                        string sJson = JsonConvert.SerializeObject(dtRoom);
                        context.Response.Write(sJson);
                        break;
                    case "getBookTime":
                        string roomNum = context.Request["roomNo"];
                        var sqlBookSp = "select BookSt, BookEt from BookInfo " +
                            "where BookDate = '" + DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + "' and RoomNumber = '{0}' order by BookSt";
                        sqlBookSp = string.Format(sqlBookSp, roomNum);
                        DataTable dtTimeSp = SqlHelper.getDataTable(sqlBookSp);
                        string sJson2 = JsonConvert.SerializeObject(dtTimeSp);
                        context.Response.Write(sJson2);
                        break;
                    case "postData":
                        var name = context.Request["name"];
                        var sex = context.Request["sex"];
                        var age = context.Request["age"];
                        var sql = "INSERT INTO UserInfo(Name,Sex,Age) VALUES ('{0}','{1}','{2}')";
                        sql = string.Format(sql, name, sex, age);
                        if(SqlHelper.ExecuteSql(sql) > 0)
                        {
                            context.Response.Write("数据插入成功！");
                        }
                        else
                        {
                            context.Response.Write("数据插入失败！");
                        }
                        break;
                    case "cancelBook":
                        //删除预订的数据
                        string[] delListStr = context.Request["cancel"].Split(',');
                        int totalCancel = 0;
                        foreach(var delRoom in delListStr)
                        {
                            var delSql = "delete from BookInfo where ID = " + delRoom;
                            if (SqlHelper.ExecuteSql(delSql) > 0)
                            {
                                
                                totalCancel++;
                            }
                        }
                        context.Response.Write("取消预订完成，共取消 " + totalCancel.ToString() + " 间教室！");
                        break;
                    case "flushBook":
                        string customerName2 = context.Request.Cookies["login_name"].Value;
                        var sqlBook = "select BookInfo.ID, BookInfo.RoomNumber, RoomType, RoomPeople, " +
                            "MyRemark,BookSt, BookEt, BookDuration from " +
                            "BookInfo join RoomInfo on BookInfo.RoomNumber = RoomInfo.RoomNumber " +
                            "where BookDate > '{0}' and CustomerName = '{1}'";
                        sqlBook = string.Format(sqlBook, DateTime.Now.ToString("yyyy-MM-dd"), customerName2);
                        DataTable dtBook = SqlHelper.getDataTable(sqlBook);
                        string sBookJson = JsonConvert.SerializeObject(dtBook);
                        context.Response.Write(sBookJson);
                        break;
                    default:
                        break;
                }
                context.Response.End(); //停止Response后续写入动作，保证Response内只有我们写入内容
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}