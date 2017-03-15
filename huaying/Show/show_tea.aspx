<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_tea.aspx.cs" Inherits="Show_show_stu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    		<link href="../css/style_show.css" rel='stylesheet' type='text/css' />
</head>
<body>
    <form id="form1" runat="server">
    <div class="show-up">
    <div class="show-up-left">
        <asp:Image ID="lastteacherPic" runat="server" Visible="false" Width="220" Height="220"
                            ImageAlign="AbsMiddle" />
<div class="show-up-left-text">
     <asp:Literal ID="ltlbottom" runat="server" Visible="true"></asp:Literal>
    </div>
    </div>
    <div class="show-up-right">
<asp:Literal ID="ltlright" runat="server" Visible="true"></asp:Literal>    </div>
        </div>
    </form>
</body>
</html>
