using System;
using System.Web.UI.WebControls;
public partial class Chap11_TreeView : System.Web.UI.Page
{
  protected void BtnRemoveNode_Click(object sender, EventArgs e)
  {
    if (tvCity.SelectedNode != null)  //存在当前节点
    {
      //获取当前节点的父节点
      TreeNode parentNode = tvCity.SelectedNode.Parent;
      //移除当前节点
      parentNode.ChildNodes.Remove(tvCity.SelectedNode);
    }
  }
  protected void BtnAddNode_Click(object sender, EventArgs e)
  {    
    if (txtNode.Text.Trim().Length < 1)  //若文本框中的值为空，则返回
    {
      return;
    }
    //建立新节点childNode
    TreeNode childNode = new TreeNode();
    childNode.Value = txtNode.Text.Trim();
    if (tvCity.SelectedNode != null)  //存在当前节点
    {
      //将childNode添加到当前节点
      tvCity.SelectedNode.ChildNodes.Add(childNode);
    }
    else  //不存在当前节点
    {
      //childNode作为根节点添加到tvCity中
      tvCity.Nodes.Add(childNode);
    }
    txtNode.Text = "";  //清除文本框
  }
  protected void BtnCollapseAll_Click(object sender, EventArgs e)
  {
    tvCity.CollapseAll();  //折叠所有的节点
  }
  protected void BtnExpandAll_Click(object sender, EventArgs e)
  {
    tvCity.ExpandAll();  //展开所有的节点
  }
}