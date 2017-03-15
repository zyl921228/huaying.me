<%@ Page Language="C#" AutoEventWireup="true" CodeFile="qanda_insert.aspx.cs" Inherits="editor" %>

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
            问题：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            排序：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
        </div>
    <div>
        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server"></FCKeditorV2:FCKeditor>
    </div>
        <br /><asp:Button ID="Button2" runat="server" OnClick="Submit_Click2" Text="上传" />
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

</body>
</html>
