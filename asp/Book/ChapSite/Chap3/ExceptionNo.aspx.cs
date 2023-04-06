using System;
using System.IO;
public partial class Chap3_ExceptionNo : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //定义要读取文件的物理路径
    string filePath = @"D:\ASPNET\Book\ChapSite\Chap3\Test.txt";
    //定义streamReader对象
    StreamReader streamReader = new StreamReader(filePath);
    char[] buffer = new char[5];
    //从文件中读取内容到buffer数组
    streamReader.ReadBlock(buffer, 0, 10);
    //关闭streamReader对象，释放占用的资源
    streamReader.Close();
  }
}