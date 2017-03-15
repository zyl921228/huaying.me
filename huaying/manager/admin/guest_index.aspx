<%@ Page Language="C#" AutoEventWireup="true" CodeFile="guest_index.aspx.cs" Inherits="manager_admin_guest_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../css/guestStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h1>首页免费领取体验课 - 用户信息</h1>
        <asp:Button ID="Button1" runat="server" Text="导出Excel" OnClick="Button1_Click" />
    <div>
        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
            <AlternatingItemStyle BackColor="White" />
            <Columns>
                <asp:BoundColumn DataField="id" HeaderText="id"></asp:BoundColumn>
                <asp:BoundColumn DataField="phone" HeaderText="电话"></asp:BoundColumn>
                <asp:BoundColumn DataField="email" HeaderText="email"></asp:BoundColumn>
                <asp:BoundColumn DataField="course" HeaderText="选择课程"></asp:BoundColumn>
                <asp:BoundColumn DataField="recommend" HeaderText="推荐人（电话）"></asp:BoundColumn>
                <asp:BoundColumn DataField="date" HeaderText="记录时间"></asp:BoundColumn>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#F7F7DE" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" Mode="NumericPages" />
            <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        </asp:DataGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" SelectCommand="SELECT * FROM [guest_info] WHERE ([type] = @type) ORDER BY [id] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="type" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
