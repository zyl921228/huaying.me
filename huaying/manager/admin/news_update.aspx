<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_update.aspx.cs" Inherits="editor" %>

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
            新闻题目：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            新闻简介：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            新闻类型：
        <br />
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="1" Text="考试快讯"></asp:ListItem>
                <asp:ListItem Value="2" Text="留学前沿"></asp:ListItem>
            </asp:DropDownList>
                                    <br />
            新闻小类：
        <br />
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Value="1" Text="雅思快讯"></asp:ListItem>
                <asp:ListItem Value="2" Text="托福快讯"></asp:ListItem>
                <asp:ListItem Value="3" Text="SAT考试"></asp:ListItem>
                <asp:ListItem Value="4" Text="留学咨询"></asp:ListItem>
            </asp:DropDownList>
             <br />
            关键词标签<b>（请用英文分号";"分隔每个标签）</b>：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
             <br />
            新闻来源：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br /><br /><br />
        </div>
            <div>
                缩略图：
        <asp:FileUpload ID="newsPic" runat="server" Width="300px" />
        <asp:Image ID="lastnewsPic" runat="server" Visible="false" Width="80" Height="100"
                            ImageAlign="AbsMiddle" />
                                <br />
                宽版缩略图：
        <asp:FileUpload ID="newsPic_w" runat="server" Width="300px" />
        <asp:Image ID="lastnewsPic_w" runat="server" Visible="false" Width="360" Height="100"
                            ImageAlign="AbsMiddle" />
    </div>
    <div>
        新闻详情：
        <br />
        <FCKeditorV2:FCKeditor ID="FCKeditor1" Height="600px" runat="server"></FCKeditorV2:FCKeditor>
    </div>
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Submit_Click2" Text="更新" />
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

</body>
</html>
