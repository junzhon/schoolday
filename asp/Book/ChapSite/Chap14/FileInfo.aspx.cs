using System;
using System.IO;
public partial class Chap14_FileInfo : System.Web.UI.Page
{
  protected void BtnMove_Click(object sender, EventArgs e)
  {
    //获取源文件和目标文件路径
    string pathSouce = txtSource.Text.Trim();
    string pathTarget = txtTarget.Text.Trim();
    //若两个路径字符串不空，则执行移动操作
    if ((pathSouce.Length > 0) && (pathTarget.Length > 0))
    {
      lblMsg.Text = MoveCopyFile(pathSouce, pathTarget, false);
    }
  }
  protected void BtnCopy_Click(object sender, EventArgs e)
  {
    //获取源文件和目标文件路径
    string pathSouce = txtSource.Text.Trim();
    string pathTarget = txtTarget.Text.Trim();
    //若两个路径字符串不空，则执行复制操作
    if ((pathSouce.Length > 0) && (pathTarget.Length > 0))
    {
      lblMsg.Text = MoveCopyFile(pathSouce, pathTarget, true);
    }
  }
  /// <summary>
  /// 自定义方法MoveCopyFile()，用于移动或复制文件
  /// </summary>
  /// <param name="pathSource">源路径</param>
  /// <param name="pathTarget">目标路径</param>
  /// <param name="act">值为true表示复制，false表示移动</param>
  /// <returns>提示信息</returns>
  private string MoveCopyFile(string pathSource, string pathTarget, bool act)
  {
    String resMsg = "";
    string pathRoot = Server.MapPath("");  //获取网站根文件夹    
    pathSource = Path.Combine(pathRoot, pathSource);  //获取源文件的物理路径    
    pathTarget = Path.Combine(pathRoot, pathTarget);  //获取目标文件的物理路径
    try
    {
      //获取源文件所在的文件夹
      string directoryName = Path.GetDirectoryName(pathSource);
      if (!Directory.Exists(directoryName))  //若源文件夹不存在，则新建文件夹
      {
        Directory.CreateDirectory(directoryName);
        resMsg = resMsg + "1、源文件所在文件夹不存在，新建源文件所在的文件夹。<br />";
      }
      if (!File.Exists(pathSource))  //若源文件不存在，则新建文件
      {
        using (FileStream fs = File.Create(pathSource)) { }
        resMsg = resMsg + "2、源文件不存在，新建源文件。<br />";
      }
      //获取目标文件所在的文件夹
      directoryName = Path.GetDirectoryName(pathTarget);
      if (!Directory.Exists(directoryName))  //若目标文件夹不存在，则新建
      {
        Directory.CreateDirectory(directoryName);
        resMsg = resMsg + "3、目标文件所在的文件夹不存在，新建目标文件所在的文件夹。<br />";
      }
      if (act)  //若act为true，则复制文件
      {
        File.Copy(pathSource, pathTarget, true);  //复制文件，若目标文件存在则覆盖
        resMsg = resMsg + "5、复制文件。<br />";
      }
      else  //移动文件
      {
        if (File.Exists(pathTarget))  //若目标文件存在，则删除文件
        {
          File.Delete(pathTarget);
          resMsg = resMsg + "4、目标文件存在，删除目标文件。<br />";
        }
        File.Move(pathSource, pathTarget);  //移动文件
        resMsg = resMsg + "5、移动文件。<br />";
      }
      if (File.Exists(pathSource))  //源文件存在
      {
        resMsg = resMsg + "6-1、源文件存在，复制操作完成。<br />";
      }
      else  //源文件不存在
      {
        resMsg = resMsg + "6-2、源文件不存在，移动操作完成。<br />";
      }
    }
    catch (Exception e)
    {
      resMsg = resMsg + "7、程序执行异常。错误信息：" + e.ToString();
    }
    return resMsg;  //返回提示信息
  }
}