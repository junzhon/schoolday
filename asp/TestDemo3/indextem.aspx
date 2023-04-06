<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="indextem.aspx.cs" Inherits="TestDemo3.indextem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />


    <title>欢迎进入酒店预约管理系统!</title>
    <%--<link rel="stylesheet" href="css/BookStrap.min.css" />--%>
    <!-- BookStrap style -->
    <link rel="stylesheet" href="css/templatemo-style.css" />
    <link rel="stylesheet" href="css/picnic.css" />
    <script src="js/laydate/laydate.js"></script>
    <script src="js/json3.js"></script>
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
        //执行一个laydate实例
        laydate.render({
            elem: '#timeArrange',
            type: 'time',
            range: true
        });
    </script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="tm-left-right-container">
                <!-- Left column: logo and menu -->
                <div class="tm-blue-bg tm-left-column">
                    <div class="tm-logo-div">
                        <!-- 左上角的图标 -->
                        <img src="images/hust-logo2.png" title="Logo" />
                        <h1 class="tm-site-name">华中科技大学<br />教室场地预约系统</h1>
                    </div> 
                </div> 


                <!-- Right column: content -->
                <div class="tm-right-column">
                    <!-- 顶部用户信息 -->
                    <!-- 顶部用户信息 -->
                    <span style="float: right">欢迎用户<%Context.Response.Write(Request.Cookies["login_name"].Value); %>[<a href="login.aspx" onclick='delCookie("login_name")'>退出</a>]</span>
                    <div class="tm-content-div">
                        <!-- 欢迎 光临 -->
                        <section id="welcome" class="tm-section">
                            <header>
                                <h2 class="tm-blue-text tm-welcome-title tm-margin-b-45">欢迎进入华中科技大学教室预约系统！</h2>
                            </header>
                            <p>注：教室预约需提前一天，今天只能预约明天的教室，如无需再使用请及时取消您的预约，谢谢合作！</p>
                        </section>

                        <!-- 预约 教室-->
                        <section id="about" class="tm-section">

                            <div class="col-lg-8 col-md-7 col-sm-12 col-xs-12 push-lg-4 push-md-5">
                                <header>
                                    <h2 class="tm-blue-text tm-section-title tm-margin-b-45"> 预约明天（<%Context.Response.Write(DateTime.Now.AddDays(1).ToString("yyyy-MM-dd")+"，"+DateTime.Now.AddDays(1).ToString("dddd")); %>）的场地</h2>
                                </header>

                                <table class="primary" id="roomInfo" style="width: 100%">
                                </table>

                                <br />
                                <article class="card">
                                    <header>
                                        <h3>该场地明天已被预约的时间段有</h3>
                                    </header>
                                    <footer id="bookTimeSpan">
                                    </footer>
                                </article>
                                <label>
                                    <input type="text" style="width: 30%" id="timeArrange" placeholder="选择开始时间和结束时间" /></label>
                                <label>
                                    <input type="text" style="width: 40%" id="myRemarks" placeholder="备注信息（50字以内，没有则留空）" /></label>
                                <button type="button" class='success' onclick="bookRoom()">预约教室</button>&nbsp&nbsp
                                    <button type="button" onclick="flushRoom()">刷新教室信息</button>
                            </div>



                        </section>



                        <!-- 取消 预约-->
                        <section id="galleryone" class="tm-section">
                            <header>
                                <h2 class="tm-blue-text tm-section-title tm-margin-b-30">明天预约的教室</h2>
                            </header>

                            <table class="primary"  style="width: 100%">
                                <tr>
                                    <th>教室号</th>
                                    <th>教室类型</th>
                                    <th>容纳人数</th>
                                    <th>我的备注</th>
                                    <th>开始时间</th>
                                    <th>结束时间</th>
                                    <th>借用时长(小时)</th>
                                    <th>是否退订</th>
                                </tr>
                                <%--select BookInfo.RoomNumber, RoomType, RoomPeople, MyRemark,BookSt, 
                                        BookEt, BookDuration from BookInfo join RoomInfo 
                                        on BookInfo.RoomNumber = RoomInfo.RoomNumber--%>
                                <tbody id="bookInfo">
                                <%
                                    System.Data.DataSet ds2 = MyDBUtils.DBHelper.ExecuteQuery("select BookInfo.ID, BookInfo.RoomNumber, RoomType, RoomPeople, MyRemark,BookSt, " +
                                        "BookEt, BookDuration from BookInfo join RoomInfo on " +
                                        "BookInfo.RoomNumber = RoomInfo.RoomNumber where " +
                                        "BookDate > '" + DateTime.Now.ToString("yyyy-MM-dd") + "' and CustomerName='" + Request.Cookies["login_name"].Value + "'");
                                    for (int i = 0; i < ds2.Tables[0].Rows.Count; i++)
                                    {
                                        Context.Response.Write("<tr>");

                                        for (int j = 1; j < 8; j++)
                                        {
                                            Context.Response.Write("<td>");
                                            Context.Response.Write(ds2.Tables[0].Rows[i][j].ToString());
                                            Context.Response.Write("</td>");
                                        }
                                        Context.Response.Write("<td>");
                                        Context.Response.Write("<label><input type='checkbox' name='checkbokRoom' value='" + ds2.Tables[0].Rows[i][0].ToString()+"-"+ ds2.Tables[0].Rows[i][1].ToString() + "' /><span class='checkable'>退订</span></label>");
                                        Context.Response.Write("</td>");
                                        Context.Response.Write("</tr>");
                                    }
                                %>
                                </tbody>
                            </table>
                            <center>
                                    <br />
                                    <button type="button" class="error" onclick="cancelBook()">取消预约</button>
                                </center>

                        </section>

                        <!-- 历史预约教室-->
                        <section id="myroom" class="tm-section">
                            <header>
                                <h2 class="tm-blue-text tm-section-title tm-margin-b-30">我的历史预约</h2>
                            </header>

                            <table class="primary"  style="width: 100%">
                                <tr>
                                    <th>教室号</th>
                                    <th>教室类型</th>
                                    <th>容纳人数</th>
                                    <th>我的备注</th>
                                    <th>日期</th>
                                    <th>开始时间</th>
                                    <th>结束时间</th>
                                    <th>借用时长(小时)</th>
                                </tr>
                                <tbody>
                                <%
                                    System.Data.DataSet ds3 = MyDBUtils.DBHelper.ExecuteQuery("select BookInfo.RoomNumber, RoomType, RoomPeople, MyRemark,BookDate,BookSt, " +
                                        "BookEt, BookDuration from BookInfo join RoomInfo on " +
                                        "BookInfo.RoomNumber = RoomInfo.RoomNumber " +
                                        "where BookDate < '" + DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") +"' and CustomerName='" + Request.Cookies["login_name"].Value + "'");
                                    for (int i = 0; i < ds3.Tables[0].Rows.Count; i++)
                                    {
                                        Context.Response.Write("<tr>");

                                        for (int j = 0; j < 8; j++)
                                        {
                                            Context.Response.Write("<td>");
                                            Context.Response.Write(ds3.Tables[0].Rows[i][j].ToString());
                                            Context.Response.Write("</td>");
                                        }
                                        Context.Response.Write("</tr>");
                                    }
                                %>
                                </tbody>
                            </table>

                        </section>

                        <!-- 我的 信息 -->
                        <section id="contact" class="tm-section">
                            <header>
                                <h2 class="tm-blue-text tm-section-title tm-margin-b-30">我的信息</h2>
                            </header>

                            <div class="row">
                                <div class="col-lg-6">

                                    <div class="form-group">
                                        姓名：<%Context.Response.Write(Request.Cookies["login_name"].Value);%>
                                    </div>
                                    <div class="form-group">
                                        电话：<%System.Data.DataSet webUserDataSet = MyDBUtils.DBHelper.ExecuteQuery("select * from WebUser where username='" + Request.Cookies["login_name"].Value + "'");
                                               Response.Write(webUserDataSet.Tables[0].Rows[0][2].ToString());
                                        %>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- 尾部 -->
                        <footer>
                            <p class="tm-copyright-p">
                                Copyright &copy; <span class="tm-current-year">2021</span> HUST 
                                
                                | Designed by <a href="#" target="_parent">邓发珩</a>
                            </p>
                        </footer>
                    </div>

                </div>

            </div>
        </div>
        <!-- row -->
    </div>
    <!-- container -->
</body>
<script type="text/javascript">
    function bookRoom() {
        var bookT = document.getElementById("timeArrange").value;
        if (bookT === "") {
            alert("必须选择要借用的时间范围！");
            return false;
        }
        var myR = document.getElementById("myRemarks").value;
        var roomNumber = getSelectedRadioValue();
        if (roomNumber === "") {
            alert("必须选择要借用的教室！");
            return false;
        }
        //要发送的数据，教室号，预定开始时间-结束时间，我的备注

        $.ajax({
            type: 'post',
            url: 'RoomBookHandler.ashx',
            async: true,
            data: {
                action: 'bookRoom',
                roomNo: roomNumber,
                bookTime: bookT,
                myRemark: myR
            },
            success: function (result) {
                alert(result);
                getRoomTimeSpan();
                updateBookedTable();
            },
            error: function () {
                alert('请求失败!');
            }
        });
    }

    function cancelBook() {
        var checkList = [];
        var timeSpanUpList = [];
        var checkbokContext = document.getElementsByName("checkbokRoom");
        for (i = 0; i < checkbokContext.length; ++i) {
            if (checkbokContext[i].checked) {
                var dataStr = checkbokContext[i].value.split('-');
                checkList.push(dataStr[0]);
                timeSpanUpList.push(dataStr[1]);
            }
        }
        if (checkList.length == 0) {
            alert("请选择您需要取消预约的教室！");
            return false;
        }
        var cancelListStr = checkList.join(','); //转成1,3,4这种形式，后台再解析
        $.ajax({
            type: 'post',
            url: 'RoomBookHandler.ashx',
            async: true,
            data: {
                action: 'cancelBook',
                cancel: cancelListStr
            },
            success: function (result) {
                alert(result);
                //刷新本表
                updateBookedTable();
                //刷新foot
                if (timeSpanUpList.indexOf(getSelectedRadioValue()) != -1) {
                    getRoomTimeSpan();
                }
            },
            error: function () {
                alert('连接失败!');
            }
        });
    }

    function updateBookedTable() {
        $.ajax({
            type: 'get',
            url: 'RoomBookHandler.ashx',
            async: true,
            data: {
                action: 'flushBook',
            },
            success: function (result) {
                document.getElementById("bookInfo").innerHTML = creatBookTable(result);
                //alert(result);
            },
            error: function () {
                alert('获取数据失败!');
            }
        });
    }

    function creatBookTable(dataStr) {
        var dataList = JSON.parse(dataStr);
        var trStr = '<tbody id="bookInfo">';
        //循环遍历出json对象中的每一个数据并显示在对应的td中
        for (i = 0; i < dataList.length; i++) {
            trStr += '<tr>';
            //RoomNumber, RoomType, RoomPeople, MyRemark,BookSt, BookEt, BookDuration
            trStr += '<td>' + dataList[i].RoomNumber + '</td>';
            trStr += '<td>' + dataList[i].RoomType + '</td>';
            trStr += '<td>' + dataList[i].RoomPeople + '</td>';
            trStr += '<td>' + dataList[i].MyRemark + '</td>';
            trStr += '<td>' + dataList[i].BookSt + '</td>';
            trStr += '<td>' + dataList[i].BookEt + '</td>';
            trStr += '<td>' + dataList[i].BookDuration + '</td>';
            trStr += '<td>';
            trStr += '<label><input type="checkbox" name="checkbokRoom" value="' + dataList[i].ID.toString() + '-' + dataList[i].RoomNumber.toString() + '" /><span class="checkable">退订</span></label>';
            trStr += '</td>';
            trStr += '</tr>';
        }
        trStr += '</tbody>'
        return trStr;
    }

    function flushRoom() {
        $.ajax({
            type: 'get',
            url: 'RoomBookHandler.ashx',
            async: true,
            data: {
                action: 'flushRoom',
            },
            success: function (result) {
                document.getElementById("roomInfo").innerHTML = creatRoomTable(result);
                var footerStr = '<footer id="bookTimeSpan" ></footer >';
                document.getElementById("bookTimeSpan").innerHTML = footerStr;
            },
            error: function () {
                alert('获取数据失败!');
            }
        });
    }
    //就是等页面加载完毕之后，才开始执行函数。
    $(function () {
        flushRoom();
    });
    
    function creatRoomTable(dataStr) {
        var dataList = JSON.parse(dataStr);
        var trStr = '<table class="primary" id="roomInfo" style="width: 100%"><tr>' +
            '<th> 教室号</th> <th>教室类型</th><th>容纳人数</th>' +
            '<th> 教室状态</th> <th>教室说明</th><th>是否预约</th></tr >';
        //循环遍历出json对象中的每一个数据并显示在对应的td中
        for (i = 0; i < dataList.length; i++) {
            trStr += '<tr>';
            trStr += '<td>' + dataList[i].RoomNumber + '</td>';
            trStr += '<td>' + dataList[i].RoomType + '</td>';
            trStr += '<td>' + dataList[i].RoomPeople + '</td>';
            trStr += '<td>' + dataList[i].RoomStatus + '</td>';
            trStr += '<td>' + dataList[i].Remarks + '</td>';
            trStr += '<td>';
            if (dataList[i].RoomStatus.toString().trim() === "空闲") {
                trStr += '<label><input type="radio" onClick="getRoomTimeSpan()" name="selectRoom" value="' + dataList[i].RoomNumber.toString() + '" /><span class="checkable">预定</span></label>';
            }
            else {
                trStr += "不可用";
            }
            trStr += '</td>';
            trStr += '</tr>';
        }
        trStr += '</table>'
        return trStr;
    }

    function getRoomTimeSpan() {
        var roomNumber = getSelectedRadioValue();
        //发送请求获预约的时间段
        $.ajax({
            type: 'get',
            url: 'RoomBookHandler.ashx',
            async: true,
            data: {
                action: 'getBookTime',
                roomNo: roomNumber
            },
            success: function (result) {
                var dataList = JSON.parse(result);
                var footerStr = '<footer id="bookTimeSpan" >';
                for (var ind in dataList) {
                    footerStr += '<span class="label warning" style="font-size: 110%">';
                    footerStr += dataList[ind].BookSt.toString().trim().substring(0, 5);
                    footerStr += ' - ';
                    footerStr += dataList[ind].BookEt.toString().trim().substring(0, 5);
                    footerStr += '</span >';
                }
                footerStr += '</footer >';
                document.getElementById("bookTimeSpan").innerHTML = footerStr;
            },
            error: function () {
                alert('获取数据失败!');
            }
        });
    }

    function getSelectedRadioValue() {
        var radioContext = document.getElementsByName("selectRoom");
        for (i = 0; i < radioContext.length; ++i) {
            if (radioContext[i].checked) {
                return radioContext[i].value;
                break;
            }
        }
        return "";
    }

</script>
</html>
