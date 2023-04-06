using System;
using System.IO;
using System.Web.UI.WebControls;
public partial class Chap14_Directory : System.Web.UI.Page
{
  protected void BtnCompute_Click(object sender, EventArgs e)
  {
    string path = txtInput.Text;  //获取文件夹路径
    if (Directory.Exists(path))  //若文件夹存在，则遍历该文件夹
    {
      DirectoryInfo dirInfo = new DirectoryInfo(path);
      TreeNode node = new TreeNode(path);
      lblMsg.Text = "文件夹大小：" + DirSize(dirInfo, node).ToString() + " Bytes";
      tvDir.Nodes.Add(node);
    }
    else  //若文件夹不存在，则显示提示信息
    {
      lblMsg.Text = "输入的文件夹不存在";
    }
  }
  /// <summary>
  /// 自定义方法DirSize()，用于计算指定文件夹大小，并显示包含的子文件夹和文件
  /// </summary>
  /// <param name="dirInfo">指定文件夹</param>
  /// <param name="parent">上级文件夹</param>
  /// <returns>文件夹大小</returns>
  public static long DirSize(DirectoryInfo dirInfo, TreeNode parent)
  {
    long size = 0;
    FileInfo[] fis = dirInfo.GetFiles();  //获取指定文件夹中包含的文件集合
    foreach (FileInfo fi in fis)  //累计计算指定文件夹中的文件大小
    {
      //添加文件到TreeView中
      TreeNode node = new TreeNode();
      node.Value = "文件：" + fi.Name + " 大小：" + fi.Length + " 日期：" + fi.CreationTime;
      parent.ChildNodes.Add(node);
      //累计文件大小
      size += fi.Length;
    }
    DirectoryInfo[] dis = dirInfo.GetDirectories();  //获取指定文件夹中的子文件夹集合
    foreach (DirectoryInfo di in dis)  //累计计算指定文件夹中的子文件夹大小
    {
      //添加文件夹到TreeView中
      TreeNode nodeDir = new TreeNode();
      nodeDir.Value = di.Name;
      nodeDir.Text = "文件夹：" + di.Name + " 日期：" + di.CreationTime;
      parent.ChildNodes.Add(nodeDir);
      size += DirSize(di, nodeDir);  //递归调用自定义方法DirSize()
    }
    return (size);  //返回指定文件夹大小
  }
}