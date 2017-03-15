<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>欢迎光临huaying.me后台管理系统</title>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <script type="text/javascript" src="js/loginfile.js"></script>
</head>
<body style="margin-top:120px">
<form id="form1" runat="server">
<div align=center>
<table cellSpacing=0 cellPadding=0 border=0>
  <tbody>
  <tr>
    <td vAlign=top width=413 height=10></td></tr>
  <tr>
    <td vAlign=center>
      <div align=center>
      <table cellSpacing=0 cellPadding=0 width=426 align=center border=0>
        <tbody>
        <tr>
          <td align="center" width=336><img
            src="images/logo_align_grey.png" width=146></td>
          <td width=90>&nbsp;</td></tr>
        <tr>
          <td 
          style="BORDER-RIGHT: #bebebe 1px solid; BORDER-LEFT: #bebebe 1px solid"  height=28>
            <table cellSpacing=0 cellPadding=0 width="88%" align=center border=0>
              <tbody>
              <tr>
                <td width="77%">
                  <div class=title align=center>==&nbsp;欢迎光临huaying.me管理入口&nbsp;==</div></td></tr></tbody></table></td>
                    <td>&nbsp;</td></tr>
        <tr>
          <td style="BORDER-RIGHT: #bebebe 1px solid; BORDER-TOP: #bebebe 1px solid; BORDER-LEFT: #bebebe 1px solid; BORDER-BOTTOM: #bebebe 1px solid" vAlign=center width=331 background="images/login_bg.gif" height=204>
            <div align=center>
            <table cellSpacing=0 cellPadding=0 width="68%" border=0>
              <tbody>
              <tr>
                <td align=middle>
                  <p align=left>用 &nbsp;户： <asp:textbox id="UserName" runat="server"  Text="" BorderColor="gray" BorderWidth="1px" Width="120px" Height="18px"></asp:textbox> <br/><br/>
                                密 &nbsp;码： <asp:textbox id="PassWord" runat="server"  Text="" TextMode="Password" BorderColor="gray" BorderWidth="1px" Width="120px" Height="18px"></asp:textbox> <br/>
                  </p>
                  <p><asp:Button ID="login" runat="server" Width="50px" Text="登录" BorderColor="gray" BorderWidth="1px" OnClick="login_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="reset" runat="server" Width="50px" Text="取消" BorderColor="gray" BorderWidth="1px" OnClick="reset_Click" />
                  </p></td></tr>
            </tbody></table></div></td>
          <td vAlign=bottom><img  src="images/human.gif" width=144></td></tr></tbody></table></div></td></tr></tbody></table></div>
          </form>
          </body></html>
