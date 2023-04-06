using System;
using System.IO;
public partial class Chap14_BinaryRW : System.Web.UI.Page
{
  protected void BtnWrite_Click(object sender, EventArgs e)
  {
    string bootDir = Server.MapPath("");  //获取当前页面的物理路径
    string fileName = Path.Combine(bootDir, @"Temp\Bin.bin");  //指定写入的文件
    BinaryWriter bw = new BinaryWriter(File.OpenWrite(fileName));  //建立BinaryWriter对象
    string name = "李明";
    int age = 23;
    bw.Write(name);  //写字符串到缓冲区
    bw.Write(age);  //写整数到缓冲区
    bw.Flush();  //将缓冲区中数据写入指定的文件，再清除缓冲区内容
    bw.Close();  //关闭BinaryWriter对象并释放系统资源
  }
  protected void BtnRead_Click(object sender, EventArgs e)
  {
    string bootDir = Server.MapPath("");
    string fileName = Path.Combine(bootDir, @"Temp\Bin.bin");
    BinaryReader br = new BinaryReader(File.OpenRead(fileName));  //建立BinaryReader对象
    string name;
    int age;
    name = br.ReadString();  //读字符串数据
    age = br.ReadInt32();  //读整型数据
    br.Close();  //关闭BinaryReader对象并释放系统资源
    lblShow.Text = "Name：" + name + " Age：" + age.ToString();
  }
}