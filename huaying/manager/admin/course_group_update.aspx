<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course_group_update.aspx.cs" Inherits="editor" %>

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
            课程组名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            适合学员：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            课程介绍：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            授课内容：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            上课时间：<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
        </div>
    <div>
        <br />
        课程小类图片：
        <br />
        <asp:FileUpload ID="coursegroupPic" runat="server" Width="300px" />
        <asp:Image ID="lastcoursegroupPic" runat="server" Visible="false" Width="80" Height="100"
                            ImageAlign="AbsMiddle" />
    </div>
        <div>
            <br />
            所属大类：
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="1" Text="雅思"></asp:ListItem>
                <asp:ListItem Value="2" Text="托福"></asp:ListItem>
                <asp:ListItem Value="3" Text="美国高考"></asp:ListItem>
                <asp:ListItem Value="4" Text="综合英语"></asp:ListItem>
                <asp:ListItem Value="5" Text="小语种"></asp:ListItem>
            </asp:DropDownList>
            <br /><br />
 <asp:Button ID="Button2" runat="server" OnClick="Submit_Click2" Text="更新" />
    </form>
<br /><br />

</body>
</html>
