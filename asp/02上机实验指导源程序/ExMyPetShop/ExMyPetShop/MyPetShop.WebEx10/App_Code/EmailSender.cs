using System.Configuration;
using System.Net;
using System.Net.Mail;
public class EmailSender
{
  //从Web.config中的<appSettings>配置节获取相应的键值
  private string mailFromAddress = ConfigurationManager.AppSettings["MailFromAddress"];
  private bool useSsl = bool.Parse(ConfigurationManager.AppSettings["UseSsl"]);
  private string userName = ConfigurationManager.AppSettings["UserName"];
  private string password = ConfigurationManager.AppSettings["Password"];
  private string serverName = ConfigurationManager.AppSettings["ServerName"];
  private int serverPort = int.Parse(ConfigurationManager.AppSettings["ServerPort"]);
  private string findPassword;  //重置后的密码
  private string mailToAddress = "";  //收件人邮箱

  /// <summary>
  /// 构造函数
  /// </summary>
  /// <param name="address">收件人邮箱</param>
  /// <param name="pwd">重置后的密码</param>
  public EmailSender(string address, string pwd)
  {
    mailToAddress = address;
    findPassword = pwd;
  }
  /// <summary>
  /// 自定义方法，根据设置的SMTP服务器名、端口号、账户名、授权码等信息发送给定发件人邮箱、收件人邮箱、Email主题、Email内容等信息的邮件
  /// </summary>
  public void Send()
  {
    //新建SmtpClient类实例smtpClient对象，using语句块结束时释放smtpClient对象
    using (var smtpClient = new SmtpClient())
    {
      //设置是否使用SSL协议连接
      smtpClient.EnableSsl = useSsl;
      //设置SMTP服务器名
      smtpClient.Host = serverName;
      //设置SMTP服务器的端口号
      smtpClient.Port = serverPort;
      //设置SMTP服务器发送邮件的凭据（用户名和授权码)
      smtpClient.Credentials = new NetworkCredential(userName, password);
      string body = "您登录MyPetShop的密码已重置为：" + findPassword;
      MailMessage mailMessage = new MailMessage(
                              mailFromAddress,   // 发件人邮箱
                              mailToAddress,     // 收件人邮箱
                              "MyPetShop用户密码重置",  // Email主题
                              body);  // Email内容
                                      //调用smtpClient对象的Send()方法发送邮件
      smtpClient.Send(mailMessage);
    }
  }
}

