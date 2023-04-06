<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TestDemo3._1" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>欢迎登陆</title>

    <script src="https://cdn.bootcss.com/json3/3.3.2/json3.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script type="text/javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>

    <!-- css files -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
</head>

<body>

    <div class="main-bg" id="mian">
        <!-- title -->
        <h1>HUST教室预约管理系统</h1>
        <!-- //title -->
        <div class="sub-main-w3">
            <%--			<div class="image-style">
			</div>--%>
            <!-- vertical tabs -->
            <div class="vertical-tab">
                <div id="section1" class="section-w3ls">
                    <input type="radio" name="sections" id="option1" checked>
                    <label for="option1" class="icon-left-w3pvt"><span class="fa fa-user-circle" aria-hidden="true"></span>登录</label>
                    <article>
                        <form runat="server">
                            <h3 class="legend">账号登录</h3>
                            <div class="input">
                                <span class="fa fa-user-o" aria-hidden="true"></span>
                                <input type="text" placeholder="用户名" name="inputEmail" required />
                            </div>
                            <div class="input">
                                <span class="fa fa-key" aria-hidden="true"></span>
                                <input type="password" placeholder="密码" name="inputPassword" required />
                            </div>
                            <asp:Button ID="Button1" class="btn submit" runat="server" Text="登陆" OnClick="Button1_Click" />
                            <a href="#" class="bottom-text-w3ls">忘记密码?</a>
                        </form>
                    </article>
                </div>
                <div id="section2" class="section-w3ls">
                    <input type="radio" name="sections" id="option2">
                    <label for="option2" class="icon-left-w3pvt"><span class="fa fa-pencil-square" aria-hidden="true"></span>注册</label>
                    <article>
                        <form action="#" method="post">
                            <h3 class="legend">注册帐户</h3>
                            <div class="input">
                                <span class="fa fa-user-o" aria-hidden="true"></span>
                                <input type="text" placeholder="用户名" name="regName" required />
                            </div>
                            <div class="input">
                                <span class="fa fa-phone" aria-hidden="true"></span>
                                <input type="text" placeholder="手机号" name="regTelephone" required />
                            </div>
                            <div class="input">
                                <span class="fa fa-key" aria-hidden="true"></span>
                                <input type="password" placeholder="密码" name="regPassword" required />
                            </div>
                            <button type="submit" class="btn submit">注 册</button>
                        </form>
                    </article>
                </div>
                <div id="section3" class="section-w3ls">
                    <input type="radio" name="sections" id="option3">
                    <label for="option3" class="icon-left-w3pvt"><span class="fa fa-lock" aria-hidden="true"></span>忘记密码?</label>
                    <article>
                        <form action="#" method="post">
                            <h3 class="legend last">重置密码</h3>
                            <p class="para-style">请在下面输入您的电子邮件地址，我们将给您发送一封带有说明的电子邮件。</p>
                            <p class="para-style-2"><strong>需要帮助?</strong>了解更多关于如何 <a href="#">#</a></p>
                            <div class="input">
                                <span class="fa fa-envelope-o" aria-hidden="true"></span>
                                <input type="email" placeholder="邮箱" name="email" required />
                            </div>
                            <button type="submit" class="btn submit last-btn">提交</button>
                        </form>
                    </article>
                </div>
            </div>
            <!-- //vertical tabs -->
            <div class="clear"></div>
        </div>
    </div>

</body>
<script type="text/javascript">
    function onClickLogin() {
        var emailAccount = document.getElementById("inputEmail").value;
        var passwd = document.getElementById("inputPassword").value;
        $.ajax({
            type: 'post',
            url: 'login.aspx',
            async: true,
            data: {
                email: emailAccount,
                password: passwd
            },
            success: function (result) {
                //document.getElementById("stuTb").innerHTML = createTable(result);
                alert(result);
            },
            error: function () {
                alert('登录失败!');
            }
        });
    }
</script>
</html>

