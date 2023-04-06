<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreeView.aspx.cs" Inherits="Chap11_TreeView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>运用TreeView控件</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <table>
        <tr>
          <td style="width: 150px">
            <asp:TreeView ID="tvCity" runat="server" ShowLines="True">
              <SelectedNodeStyle BorderStyle="Solid" />
              <Nodes>
                <asp:TreeNode Text="浙江" Value="zhejiang">
                  <asp:TreeNode Text="杭州" Value="hangzhou"></asp:TreeNode>
                  <asp:TreeNode Text="嘉兴" Value="jiaxing"></asp:TreeNode>
                  <asp:TreeNode Text="宁波" Value="ningbo"></asp:TreeNode>
                </asp:TreeNode>
              </Nodes>
            </asp:TreeView>
          </td>
          <td>
            <asp:TextBox ID="txtNode" runat="server" Width="105px"></asp:TextBox><br />
            <asp:Button ID="btnAddNode" runat="server" OnClick="BtnAddNode_Click" Text="添加节点" Width="110px" /><br />
            <asp:Button ID="btnRemoveNode" runat="server" OnClick="BtnRemoveNode_Click" Text="移除当前节点" Width="110px" /><br />
            <asp:Button ID="btnExpandAll" runat="server" OnClick="BtnExpandAll_Click" Text="全部展开" Width="110px" /><br />
            <asp:Button ID="btnCollapseAll" runat="server" OnClick="BtnCollapseAll_Click" Text="全部折叠" Width="110px" />
          </td>
        </tr>
      </table>
    </div>
  </form>
</body>
</html>
