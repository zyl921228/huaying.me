<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course_image_edit.aspx.cs" Inherits="manager_admin_qanda_edit" %>

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
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="course_image_update.aspx?id={0}" DataTextField="name" HeaderText="大类名称" />
                <asp:ImageField DataImageUrlField="picpath_top" HeaderText="上部图" ControlStyle-Width="300px">
<ControlStyle Width="300px"></ControlStyle>
                </asp:ImageField>
                <asp:ImageField DataImageUrlField="picpath_right" HeaderText="右部图" ControlStyle-Width="100px">
<ControlStyle Width="100px"></ControlStyle>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" DeleteCommand="DELETE FROM [course_image] WHERE [id] = @id" InsertCommand="INSERT INTO [course_image] ([name], [picpath_top], [picpath_right]) VALUES (@name, @picpath_top, @picpath_right)" SelectCommand="SELECT * FROM [course_image]" UpdateCommand="UPDATE [course_image] SET [name] = @name, [picpath_top] = @picpath_top, [picpath_right] = @picpath_right WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="picpath_top" Type="String" />
                <asp:Parameter Name="picpath_right" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="picpath_top" Type="String" />
                <asp:Parameter Name="picpath_right" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
