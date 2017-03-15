<%@ Page Language="C#" AutoEventWireup="true" CodeFile="students_update.aspx.cs" Inherits="editor" %>

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
            学生姓名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            学生信息：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            排序：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
        </div>
    <div>
        学生照片：
        <asp:FileUpload ID="studentPic" runat="server" Width="300px" />
        <asp:Image ID="laststudentPic" runat="server" Visible="false" Width="80" Height="100"
                            ImageAlign="AbsMiddle" />
    </div>
        <div>
            <br />
            下部详情:
<FCKeditorV2:FCKeditor ID="FCKeditor_bottom" runat="server"></FCKeditorV2:FCKeditor>
<br />
            右部详情:
<FCKeditorV2:FCKeditor ID="FCKeditor_right" runat="server"></FCKeditorV2:FCKeditor>
        </div>
 <asp:Button ID="Button2" runat="server" OnClick="Submit_Click2" Text="更新" />
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

</body>
</html>
