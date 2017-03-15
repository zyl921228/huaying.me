<%@ Page Language="C#" AutoEventWireup="true" CodeFile="qanda_edit.aspx.cs" Inherits="manager_admin_qanda_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/manager/admin/qanda_insert.aspx">添加备考须知</asp:HyperLink>
    <div>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="qanda_update.aspx?id={0}" DataTextField="question" HeaderText="问题" SortExpression="question" />
                <asp:BoundField DataField="q_order" HeaderText="排序" SortExpression="q_order" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" DeleteCommand="DELETE FROM [q_and_a] WHERE [id] = @id" InsertCommand="INSERT INTO [q_and_a] ([q_order], [question]) VALUES (@q_order, @question)" SelectCommand="SELECT [id], [q_order], [question] FROM [q_and_a] ORDER BY [q_order]" UpdateCommand="UPDATE [q_and_a] SET [q_order] = @q_order, [question] = @question WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="q_order" Type="Int32" />
                <asp:Parameter Name="question" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="q_order" Type="Int32" />
                <asp:Parameter Name="question" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
