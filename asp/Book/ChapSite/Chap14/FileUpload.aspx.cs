using System;
using System.IO;
public partial class Chap14_FileUpload : System.Web.UI.Page
{
  private string uploadDir;  //uploadDir变量存放文件保存路径
  protected void Page_Load(object sender, EventArgs e)
  {
    //默认将文件保存到网站根文件夹下的Uploads子文件夹中
    uploadDir = Path.Combine(Request.PhysicalApplicationPath, "Uploads");
  }
  protected void BtnUpload_Click(object sender, EventArgs e)
  {
    if (fupImg.PostedFile.FileName == "")  //无文件上传
    {
      lblMsg.Text = "无文件上传！";
    }
    else  //有文件上传
    {
      if (fupImg.PostedFile.ContentLength > 204800)  //文件大小超过200KB
      {
        lblMsg.Text = "文件大小不能操过200KB！";
      }
      else  //文件大小未超过200KB
      {
        string extension = Path.GetExtension(fupImg.PostedFile.FileName);
        switch (extension.ToLower())  //判断文件类型
        {
          case ".bmp":
          case ".gif":
          case ".jpg":
            break;
          default:  //文件扩展名不是bmp、gif或jpg
            lblMsg.Text = "文件扩展名必须是bmp、gif或jpg！";
            return;
        }
        //获取上传文件的文件名
        string fileName = Path.GetFileName(fupImg.PostedFile.FileName);
        //上传的文件将以原文件名保存到网站根文件夹下的Uploads子文件夹中
        string fullPath = Path.Combine(uploadDir, fileName);
        try
        {
          fupImg.PostedFile.SaveAs(fullPath);  //上传文件
          lblMsg.Text = "文件" + fileName + "成功上传到" + fullPath;
        }
        catch (Exception ee)
        {
          lblMsg.Text = ee.Message;  //上传文件失败，显示出错信息。
        }
      }
    }
  }
}