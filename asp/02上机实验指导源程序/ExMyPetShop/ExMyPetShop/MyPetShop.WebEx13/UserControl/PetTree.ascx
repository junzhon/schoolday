<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PetTree.ascx.cs" Inherits="UserControl_PetTree" %>
<asp:TreeView ID="tvProducts" runat="server" ExpandDepth="0">
  <Nodes>
    <asp:TreeNode SelectAction="None" Text="分类商品" Value="分类商品"></asp:TreeNode>
  </Nodes>
</asp:TreeView>