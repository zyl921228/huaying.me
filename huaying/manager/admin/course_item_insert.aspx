<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course_item_insert.aspx.cs" Inherits="editor" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            课程名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            开课时间：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            结束时间：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            学时数：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <br />
            上课地点：
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="1" Text="天祥广场"></asp:ListItem>
                <asp:ListItem Value="2" Text="西大街"></asp:ListItem>
                <asp:ListItem Value="3" Text="仁和春天广场"></asp:ListItem>
            </asp:DropDownList>
            <br />
            当前报名情况（X/X人）：<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            是否已满？：<asp:CheckBox ID="CheckBox1" runat="server" />
        </div>
    <div>
        课程图片：
        <asp:FileUpload ID="courseitemPic" runat="server" Width="300px" />
        <asp:Image ID="lastcourseitemPic" runat="server" Visible="false" Width="80" Height="100"
                            ImageAlign="AbsMiddle" />
    </div>
        <br />
            所属小类：
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id">
            </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MeconnectionString %>" SelectCommand="SELECT * FROM [course_group] ORDER BY [id]"></asp:SqlDataSource>
         <br />
                                <br /><br /><br />
            语种：
            <asp:DropDownList ID="DDL_a" runat="server">
                <asp:ListItem Value="a0" Text="全部"></asp:ListItem>
                <asp:ListItem Value="a1" Text="英语"></asp:ListItem>
                <asp:ListItem Value="a2" Text="法语"></asp:ListItem>
                <asp:ListItem Value="a3" Text="日语"></asp:ListItem>
                <asp:ListItem Value="a4" Text="意大利语"></asp:ListItem>
            </asp:DropDownList>
            <br />
                    年级：
            <asp:DropDownList ID="DDL_b" runat="server">
                <asp:ListItem Value="b0" Text="全部"></asp:ListItem>
                <asp:ListItem Value="b1" Text="初中"></asp:ListItem>
                <asp:ListItem Value="b2" Text="高中"></asp:ListItem>
                <asp:ListItem Value="b3" Text="大学"></asp:ListItem>
                <asp:ListItem Value="b4" Text="研究生"></asp:ListItem>
            </asp:DropDownList>
            <br />
                    课程：
            <asp:DropDownList ID="DDL_c" runat="server">
                <asp:ListItem Value="c0" Text="全部"></asp:ListItem>
                <asp:ListItem Value="c1" Text="雅思"></asp:ListItem>
                <asp:ListItem Value="c2" Text="托福"></asp:ListItem>
                <asp:ListItem Value="c3" Text="SAT"></asp:ListItem>
                <asp:ListItem Value="c4" Text="AP"></asp:ListItem>
                <asp:ListItem Value="c5" Text="小语种"></asp:ListItem>
            </asp:DropDownList>
            <br />
                    时间：
            <asp:DropDownList ID="DDL_d" runat="server">
                <asp:ListItem Value="d0" Text="全部"></asp:ListItem>
                <asp:ListItem Value="d1" Text="本月新班"></asp:ListItem>
                <asp:ListItem Value="d2" Text="全日制"></asp:ListItem>
                <asp:ListItem Value="d3" Text="周末班"></asp:ListItem>
            </asp:DropDownList>
            <br />
                    人数：
            <asp:DropDownList ID="DDL_e" runat="server">
                <asp:ListItem Value="e0" Text="全部"></asp:ListItem>
                <asp:ListItem Value="e1" Text="5人班"></asp:ListItem>
                <asp:ListItem Value="e2" Text="15人班"></asp:ListItem>
                <asp:ListItem Value="e3" Text="一对一"></asp:ListItem>
            </asp:DropDownList>
            <br />
                    同学：
            <asp:DropDownList ID="DDL_f" runat="server">
                <asp:ListItem Value="f0" Text="全部"></asp:ListItem>
                <asp:ListItem Value="f1" Text="成外实外"></asp:ListItem>
                <asp:ListItem Value="f2" Text="国际课程"></asp:ListItem>
                <asp:ListItem Value="f3" Text="重点高中"></asp:ListItem>
                <asp:ListItem Value="f4" Text="大学生"></asp:ListItem>
                <asp:ListItem Value="f5" Text="海归再提升"></asp:ListItem>
            </asp:DropDownList>
            <br />
 <asp:Button ID="Button2" runat="server" OnClick="Submit_Click2" Text="上传" />
    </form>
<br /><br />

</body>
</html>
