using System;
using System.IO;
public partial class Chap14_StreamRW : System.Web.UI.Page
{
  protected void BtnWrite_Click(object sender, EventArgs e)
  {
    string bootDir = Server.MapPath("");  //获取当前页面的物理路径
    string fileName = Path.Combine(bootDir, @"Temp\Txt.txt");  //指定写入的文件
    TextWriter sw = new StreamWriter(fileName);  //建立使用覆盖模式的StreamWriter对象
    sw.Write("李明");  //写字符串到缓冲区
    sw.WriteLine(23);  //写整数到缓冲区
    sw.Flush();  //将缓冲区中数据写入指定的文件，再清除缓冲区内容
    sw.Close();  //关闭StreamWriter对象并释放系统资源
  }
  protected void BtnRead_Click(object sender, EventArgs e)
  {
    string bootDir = Server.MapPath("");
    string fileName = Path.Combine(bootDir, @"Temp\Txt.txt");
    TextReader sr = new StreamReader(fileName);  //建立StreamReader对象
    string tmpStr = sr.ReadToEnd();  //读取所有数据到tmpStr中
    sr.Close();  //关闭StreamReader对象并释放系统资源
    lblShow.Text = tmpStr;  //在lblShow中显示文本内容
  }
}