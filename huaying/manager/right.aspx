<%@ Page Language="C#" AutoEventWireup="true" CodeFile="right.aspx.cs" Inherits="manage_right" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/Admin_Style.css" />
    <script language="javascript" type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" language="javascript">
    function switchSysBar(){
  //  
	if ($("#imgshow").attr("alt")=="3"){
	    //alert("aa");
		$("#imgshow").attr("alt","4");
		$("#imgshow").attr("src","images/admin_top_open.gif");
		//$('#leftMenu', window.parent.document).hide();
		closeFrameset();
	}
	else{
		$("#imgshow").attr("alt","3");
		$("#imgshow").attr("src","images/admin_top_close.gif");
		//$("#leftMenu").show();
		openFrameset();
	    }
    }
    function closeFrameset(){
var fs = parent.document.getElementsByTagName("frameset")[0];
fs.cols = "0,*";
//$("#leftFrame_display").text("打开菜单");
}

function openFrameset(){
var fs = parent.document.getElementsByTagName("frameset")[0];
fs.cols = "185,*";
//$("#leftFrame_display").text("隐藏菜单");
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/admin_main_02.gif" width="481" height="43"></td>
    <td valign="top"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="images/admin_main_03.gif" width="481" height="35"></td>
    <td align="right" background="images/admin_main_04bg.gif"><img src="images/admin_main_04.gif" width="68" height="35"></td>
    <td background="images/admin_main_04bg.gif">&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10">&nbsp;</td>
    <td style="font-size:12px">欢迎您进入网站后台管理系统！<asp:HyperLink Font-Bold=true ID="hpkadmin" runat=server NavigateUrl="~/Default.aspx" Target=_blank>返回首页</asp:HyperLink>
    </td>
    <td width="21">&nbsp;</td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<div style="margin-left:10px">
<table cellpadding="2" cellspacing="1" border="0" width="100%" class="border" align=center>
  <tr align="center"> 
    <td height=25 colspan=2 class="topbg"><span class="Glow">服 务 器 信 息</span><tr> 
    <td width="50%"  class="tdbg" height=23>服务器的主机名： <asp:Label ID="lblleixing" runat=server></asp:Label></td>
    <td width="50%" class="tdbg">站点物理路径： <asp:Label ID="lblpath" runat=server></asp:Label></td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>IP地址：<asp:Label ID="lblip" runat=server></asp:Label></td>
    <td width="50%" class="tdbg">服务器操作系统：<asp:Label ID="lblos" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>脚本解释引擎：<asp:Label ID="lblnet" runat=server></asp:Label></td>
    <td class="tdbg">WEB服务器的名称和版本：<asp:Label ID="lblweb" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>服务器CPU数量：<asp:Label ID="lblcpu" runat=server></asp:Label></td>
    <td class="tdbg">CPU类型：<asp:Label ID="lblcpuclass" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>服务器IIS版本：<asp:Label ID="lbliis" runat=server></asp:Label></td>
    <td class="tdbg">服务器脚本超时时间：<asp:Label ID="lblchaoshi" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>网站域名：<asp:Label ID="lbldomain" runat=server></asp:Label></td>
    <td class="tdbg">客户端的操作系统： <asp:Label ID="lblclientos" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>客户端电脑名：<asp:Label ID="lblclientName" runat=server></asp:Label> </td>
    <td class="tdbg">虚拟内存： <asp:Label ID="lblxunineicun" runat=server></asp:Label></td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>协议的名称和版本：<asp:Label ID="lblxieyi" runat=server></asp:Label> </td>
    <td width="50%" class="tdbg">返回服务器处理请求的端口： <asp:Label ID="lblport" runat=server></asp:Label></td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>客户端地址：<asp:Label ID="lbluser" runat=server></asp:Label>
      </td>
    <td width="50%" class="tdbg">服务器当前时间：<asp:Label ID="lblshijian" runat=server></asp:Label>
      </td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>Asp.net所占CPU：<asp:Label ID="lblcputime" runat=server></asp:Label>
      </td>
    <td width="50%" class="tdbg">当前Session数量：<asp:Label ID="lblsession" runat=server></asp:Label>
      </td>
  </tr>
</table>
</div>
<div align=center style="font-size:12px; margin-top:10px">
<font color="336699"><strong>Powered and Maintained by Huaying<strong>
</div>
</body>
</html>