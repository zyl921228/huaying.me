<%@ Page Language="C#" AutoEventWireup="true" CodeFile="keywords_update.aspx.cs" Inherits="editor" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h1>站内关键词</h1>
    <form id="form1" runat="server">
        <div>
            关键词名称：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            指向url地址：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
        </div>

        <br /><asp:Button ID="Button2" runat="server" OnClick="Submit_Click2" Text="更新" />
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

</body>
</html>
