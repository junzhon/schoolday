using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Chap14_DriveInfo : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!Page.IsPostBack)
    {
      //获取Web服务器中的所有逻辑驱动器
      DriveInfo[] allDrives = DriveInfo.GetDrives();
      foreach (DriveInfo driveInfo in allDrives)
      {
        if (driveInfo.IsReady == true)  //若驱动器已准备好，则显示该驱动器信息
        {
          //添加驱动器名节点
          TreeNode treeNode = new TreeNode();
          treeNode.Value = driveInfo.Name;
          tvDrive.Nodes.Add(treeNode);
          //添加驱动器卷标节点
          TreeNode childNode = new TreeNode();
          childNode.Value = "驱动器的卷标：" + driveInfo.VolumeLabel;
          treeNode.ChildNodes.Add(childNode);
          //添加驱动器文件系统节点
          childNode = new TreeNode();
          childNode.Value = "文件系统：" + driveInfo.DriveFormat;
          treeNode.ChildNodes.Add(childNode);
          //添加驱动器可用空闲容量节点
          childNode = new TreeNode();
          childNode.Value = "可用空闲容量：" + driveInfo.AvailableFreeSpace + "Bytes";
          treeNode.ChildNodes.Add(childNode);
          //添加驱动器存储空间总容量节点
          childNode = new TreeNode();
          childNode.Value = "存储空间总容量：" + driveInfo.TotalSize + "Bytes";
          treeNode.ChildNodes.Add(childNode);
        }
        else  //驱动器没有准备好
        {
          TreeNode nodeNotUse = new TreeNode();
          nodeNotUse.Value = driveInfo.Name + "(驱动器没有准备好)";
          tvDrive.Nodes.Add(nodeNotUse);
        }
      }
    }
  }
}