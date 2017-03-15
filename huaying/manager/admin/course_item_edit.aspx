<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course_item_edit.aspx.cs" Inherits="manager_admin_qanda_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/manager/admin/course_item_insert.aspx">添加课程条目</asp:HyperLink>
    <div>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="course_item_update.aspx?id={0}" DataTextField="name" HeaderText="课程名" />
                <asp:BoundField DataField="ctime" HeaderText="开班时间" SortExpression="ctime" />
                <asp:BoundField DataField="etime" HeaderText="结束时间" SortExpression="etime" />
                <asp:BoundField DataField="isfull" HeaderText="是否已满" SortExpression="isfull" />
                <asp:ImageField  ControlStyle-Width="200px"  DataImageUrlField="picpath" HeaderText="课程图片">
<ControlStyle Width="200px"></ControlStyle>
                </asp:ImageField>
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" DeleteCommand="DELETE FROM [course_item] WHERE [id] = @id" InsertCommand="INSERT INTO [course_item] ([name], [ctime], [etime], [duration], [location], [circum], [isfull], [picpath], [type], [filter]) VALUES (@name, @ctime, @etime, @duration, @location, @circum, @isfull, @picpath, @type, @filter)" SelectCommand="SELECT * FROM [course_item] ORDER BY [id]" UpdateCommand="UPDATE [course_item] SET [name] = @name, [ctime] = @ctime, [etime] = @etime, [duration] = @duration, [location] = @location, [circum] = @circum, [isfull] = @isfull, [picpath] = @picpath, [type] = @type, [filter] = @filter WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="ctime" Type="String" />
                <asp:Parameter Name="etime" Type="String" />
                <asp:Parameter Name="duration" Type="String" />
                <asp:Parameter Name="location" Type="Int32" />
                <asp:Parameter Name="circum" Type="String" />
                <asp:Parameter Name="isfull" Type="Int32" />
                <asp:Parameter Name="picpath" Type="String" />
                <asp:Parameter Name="type" Type="Int32" />
                <asp:Parameter Name="filter" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="ctime" Type="String" />
                <asp:Parameter Name="etime" Type="String" />
                <asp:Parameter Name="duration" Type="String" />
                <asp:Parameter Name="location" Type="Int32" />
                <asp:Parameter Name="circum" Type="String" />
                <asp:Parameter Name="isfull" Type="Int32" />
                <asp:Parameter Name="picpath" Type="String" />
                <asp:Parameter Name="type" Type="Int32" />
                <asp:Parameter Name="filter" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
