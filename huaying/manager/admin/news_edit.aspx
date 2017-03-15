<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_edit.aspx.cs" Inherits="manager_admin_qanda_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/manager/admin/news_insert.aspx">添加新闻</asp:HyperLink>
    <div>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="date" HeaderText="添加时间" SortExpression="date" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="news_update.aspx?id={0}" DataTextField="title" HeaderText="标题" />
                <asp:BoundField DataField="intro" HeaderText="简介" SortExpression="intro" />
                <asp:ImageField DataImageUrlField="picpath" ControlStyle-Width="100px" HeaderText="缩略图">
<ControlStyle Width="100px"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="type" HeaderText="类型(1:考试快讯；2：留学前沿)" SortExpression="type" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" DeleteCommand="DELETE FROM [news] WHERE [id] = @id" InsertCommand="INSERT INTO [news] ([title], [intro], [date], [detail], [picpath], [type]) VALUES (@title, @intro, @date, @detail, @picpath, @type)" SelectCommand="SELECT * FROM [news] ORDER BY [date] DESC" UpdateCommand="UPDATE [news] SET [title] = @title, [intro] = @intro, [date] = @date, [detail] = @detail, [picpath] = @picpath, [type] = @type WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="intro" Type="String" />
                <asp:Parameter Name="date" Type="DateTime" />
                <asp:Parameter Name="detail" Type="String" />
                <asp:Parameter Name="picpath" Type="String" />
                <asp:Parameter Name="type" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="intro" Type="String" />
                <asp:Parameter Name="date" Type="DateTime" />
                <asp:Parameter Name="detail" Type="String" />
                <asp:Parameter Name="picpath" Type="String" />
                <asp:Parameter Name="type" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
