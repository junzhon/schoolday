using System;
using System.IO;
public partial class Chap3_Exception : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    string filePath = @"D:\ASPNET\Book\ChapSite\Chap3\Test.txt";
    StreamReader streamReader = new StreamReader(filePath);
    char[] buffer = new char[5];
    try
    {
      streamReader.ReadBlock(buffer, 0, 10);
    }
    catch (Exception ee)
    {
      Response.Write("系统提示：" + ee.Message + "<br />");  //输出捕获的错误信息
      Response.Write("用户自定义：" + "读取文件错误！");  //输出用户自定义的错误信息
    }
    finally
    {
      streamReader.Close();
    }
  }
}