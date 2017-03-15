<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course_group_edit.aspx.cs" Inherits="manager_admin_qanda_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/manager/admin/course_group_insert.aspx">添加课程条目</asp:HyperLink>--%>
    <div>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="course_group_update.aspx?id={0}" DataTextField="name" HeaderText="课程组名" />
                <asp:BoundField DataField="intro" HeaderText="简介" SortExpression="intro" />
                <asp:BoundField DataField="ctime" HeaderText="开始时间" SortExpression="ctime" />
                <asp:ImageField DataImageUrlField="picpath" HeaderText="缩略图" ControlStyle-Width="100px">
                </asp:ImageField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" DeleteCommand="DELETE FROM [course_group] WHERE [id] = @id" InsertCommand="INSERT INTO [course_group] ([name], [fit], [intro], [content], [ctime], [picpath], [type]) VALUES (@name, @fit, @intro, @content, @ctime, @picpath, @type)" SelectCommand="SELECT * FROM [course_group] ORDER BY [id]" UpdateCommand="UPDATE [course_group] SET [name] = @name, [fit] = @fit, [intro] = @intro, [content] = @content, [ctime] = @ctime, [picpath] = @picpath, [type] = @type WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="fit" Type="String" />
                <asp:Parameter Name="intro" Type="String" />
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter Name="ctime" Type="String" />
                <asp:Parameter Name="picpath" Type="String" />
                <asp:Parameter Name="type" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="fit" Type="String" />
                <asp:Parameter Name="intro" Type="String" />
                <asp:Parameter Name="content" Type="String" />
                <asp:Parameter Name="ctime" Type="String" />
                <asp:Parameter Name="picpath" Type="String" />
                <asp:Parameter Name="type" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
