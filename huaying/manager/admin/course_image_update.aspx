<%@ Page Language="C#" AutoEventWireup="true" CodeFile="course_image_update.aspx.cs" Inherits="editor" %>

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
        <br />
        课程大类名称：
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        课程大类上部图片：
        <br />
        <asp:FileUpload ID="coursePic_top" runat="server" Width="300px" />
        <asp:Image ID="lastcoursePic_top" runat="server" Visible="false" Width="300" Height="100"
                            ImageAlign="AbsMiddle" />
        <br />
        课程大类右侧图片：
        <br />
        <asp:FileUpload ID="coursePic_right" runat="server" Width="300px" />
        <asp:Image ID="lastcoursePic_right" runat="server" Visible="false" Width="80" Height="100"
                            ImageAlign="AbsMiddle" />
    </div>
            <br /><br />
 <asp:Button ID="Button2" runat="server" OnClick="Submit_Click2" Text="更新" />
    </form>
<br /><br />

</body>
</html>
