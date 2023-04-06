using System;
using System.IO;
using System.Text;
public partial class Chap14_FileStream : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    string fileName = Path.Combine(Request.PhysicalApplicationPath, @"Chap14\Test.txt");
    if (File.Exists(fileName))  //文件存在
    {
      lblShow.Text = ReadText();  //调用自定义方法ReadText()，读取文件并显示到lblShow
    }
    else  //文件不存在
    {
      AppendText("The First Line!");  //调用自定义方法AppendText()，新建文件并添加内容
      lblShow.Text = "The First Line!";
    }
  }
  protected void BtnAppend_Click(object sender, EventArgs e)
  {
    string appStr = txtAppend.Text.Trim();
    if (appStr.Length > 0)  //输入不空
    {
      AppendText(appStr);  //调用自定义方法AppendText()，将文本框中输入值添加到文件后面
      lblShow.Text = ReadText();  //调用自定义方法ReadText()，读取文件并显示到lblShow
    }
  }
  /// <summary>
  /// 自定义方法ReadText()，读取网站根文件夹下的Chap14\Test.txt文件内容
  /// </summary>
  /// <returns>返回文件内容字符串</returns>
  private string ReadText()
  {
    //获取文件的物理路径
    string fileName = Path.Combine(Request.PhysicalApplicationPath, @"Chap14\Test.txt");
    //创建一个输出流
    FileStream fs = File.Open(fileName, FileMode.Open, FileAccess.Read, FileShare.Read);
    byte[] data = new byte[fs.Length];
    fs.Read(data, 0, (int)fs.Length);
    fs.Close();
    return Encoding.UTF8.GetString(data);  //返回内容字符串
  }
  /// <summary>
  /// 自定义方法AppendText()，添加内容到网站根文件夹下的Chap14\Test.txt文件
  /// </summary>
  /// <param name="addText">要添加的文件内容</param>
  private void AppendText(string addText)
  {
    //获取文件的物理路径
    string fileName = Path.Combine(Request.PhysicalApplicationPath, @"Chap14\Test.txt");
    //创建一个输入流
    FileStream fs = File.Open(fileName, FileMode.Append, FileAccess.Write, FileShare.None);
    byte[] data = Encoding.UTF8.GetBytes(addText);
    fs.Write(data, 0, data.Length);
    fs.Flush();
    fs.Close();
  }
}