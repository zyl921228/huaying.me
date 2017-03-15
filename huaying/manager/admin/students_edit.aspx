<%@ Page Language="C#" AutoEventWireup="true" CodeFile="students_edit.aspx.cs" Inherits="manager_admin_qanda_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/manager/admin/students_insert.aspx">添加学生</asp:HyperLink>
    <div>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="students_update.aspx?id={0}" DataTextField="name" HeaderText="学生姓名" />
                <asp:BoundField DataField="info" HeaderText="信息" SortExpression="info" />
                <asp:BoundField DataField="s_order" HeaderText="排序" SortExpression="s_order" />
                <asp:ImageField DataImageUrlField="picpath" ControlStyle-Width="100px" HeaderText="图片预览">
<ControlStyle Width="100px"></ControlStyle>
                </asp:ImageField>
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" DeleteCommand="DELETE FROM [students] WHERE [id] = @id" InsertCommand="INSERT INTO [students] ([name], [info], [picpath], [s_order]) VALUES (@name, @info, @picpath, @s_order)" SelectCommand="SELECT * FROM [students] ORDER BY [s_order]" UpdateCommand="UPDATE [students] SET [name] = @name, [info] = @info, [picpath] = @picpath, [s_order] = @s_order WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="info" Type="String" />
                <asp:Parameter Name="picpath" Type="String" />
                <asp:Parameter Name="s_order" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="info" Type="String" />
                <asp:Parameter Name="picpath" Type="String" />
                <asp:Parameter Name="s_order" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
