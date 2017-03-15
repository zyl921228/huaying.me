<%@ Page Language="C#" AutoEventWireup="true" CodeFile="keywords_edit.aspx.cs" Inherits="manager_admin_qanda_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/manager/admin/keywords_insert.aspx">添加站内关键词</asp:HyperLink>
    <div>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="keywords_update.aspx?id={0}" DataTextField="name" HeaderText="关键词名称" />
                <asp:BoundField DataField="url" HeaderText="指向url" SortExpression="url" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" DeleteCommand="DELETE FROM [keywords] WHERE [id] = @id" InsertCommand="INSERT INTO [keywords] ([name], [url]) VALUES (@name, @url)" SelectCommand="SELECT * FROM [keywords] ORDER BY [id]" UpdateCommand="UPDATE [keywords] SET [name] = @name, [url] = @url WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="url" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="url" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
