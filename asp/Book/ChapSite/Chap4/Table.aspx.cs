using System;
using System.Web.UI.WebControls;
public partial class Chap4_Table : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    string[] name = { "张三", "李四" };  //设置姓名初使值，实际工程中数据来源于数据库
    string[] number = { "200301", "200302" };  //设置学号初使值          
    for (int i = 1; i <= 2; i++)  //动态生成表格
    {
      TableRow row = new TableRow();  //建立一个行对象        
      TableCell cellNumber = new TableCell();  //建立第一个单元格对象     
      TableCell cellName = new TableCell();  //建立第二个单元格对象
      TableCell cellInput = new TableCell();  //建立第三个单元格对象       
      cellNumber.Text = number[i - 1];  //设置第一个单元格的显示内容
      cellName.Text = name[i - 1];  //设置第二个单元格的显示内容        
      TextBox txtInput = new TextBox();  //建立一个文本框对象        
      cellInput.Controls.Add(txtInput);  //添加文本框对象到第三个单元格中
      row.Cells.Add(cellNumber); //添加第一个单元格到行对象
      row.Cells.Add(cellName);  //添加第二个单元格到行对象
      row.Cells.Add(cellInput);  //添加第三个单元格到行对象
      tblScore.Rows.Add(row);  //添加行对象到表格对象
    }
  }
}