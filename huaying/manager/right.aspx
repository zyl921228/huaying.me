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
//$("#leftFrame_display").text("�򿪲˵�");
}

function openFrameset(){
var fs = parent.document.getElementsByTagName("frameset")[0];
fs.cols = "185,*";
//$("#leftFrame_display").text("���ز˵�");
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
    <td style="font-size:12px">��ӭ��������վ��̨����ϵͳ��<asp:HyperLink Font-Bold=true ID="hpkadmin" runat=server NavigateUrl="~/Default.aspx" Target=_blank>������ҳ</asp:HyperLink>
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
    <td height=25 colspan=2 class="topbg"><span class="Glow">�� �� �� �� Ϣ</span><tr> 
    <td width="50%"  class="tdbg" height=23>���������������� <asp:Label ID="lblleixing" runat=server></asp:Label></td>
    <td width="50%" class="tdbg">վ������·���� <asp:Label ID="lblpath" runat=server></asp:Label></td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>IP��ַ��<asp:Label ID="lblip" runat=server></asp:Label></td>
    <td width="50%" class="tdbg">����������ϵͳ��<asp:Label ID="lblos" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>�ű��������棺<asp:Label ID="lblnet" runat=server></asp:Label></td>
    <td class="tdbg">WEB�����������ƺͰ汾��<asp:Label ID="lblweb" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>������CPU������<asp:Label ID="lblcpu" runat=server></asp:Label></td>
    <td class="tdbg">CPU���ͣ�<asp:Label ID="lblcpuclass" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>������IIS�汾��<asp:Label ID="lbliis" runat=server></asp:Label></td>
    <td class="tdbg">�������ű���ʱʱ�䣺<asp:Label ID="lblchaoshi" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>��վ������<asp:Label ID="lbldomain" runat=server></asp:Label></td>
    <td class="tdbg">�ͻ��˵Ĳ���ϵͳ�� <asp:Label ID="lblclientos" runat=server></asp:Label></td>
  </tr>
  <tr>
    <td class="tdbg" height=23>�ͻ��˵�������<asp:Label ID="lblclientName" runat=server></asp:Label> </td>
    <td class="tdbg">�����ڴ棺 <asp:Label ID="lblxunineicun" runat=server></asp:Label></td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>Э������ƺͰ汾��<asp:Label ID="lblxieyi" runat=server></asp:Label> </td>
    <td width="50%" class="tdbg">���ط�������������Ķ˿ڣ� <asp:Label ID="lblport" runat=server></asp:Label></td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>�ͻ��˵�ַ��<asp:Label ID="lbluser" runat=server></asp:Label>
      </td>
    <td width="50%" class="tdbg">��������ǰʱ�䣺<asp:Label ID="lblshijian" runat=server></asp:Label>
      </td>
  </tr>
  <tr> 
    <td width="50%" class="tdbg" height=23>Asp.net��ռCPU��<asp:Label ID="lblcputime" runat=server></asp:Label>
      </td>
    <td width="50%" class="tdbg">��ǰSession������<asp:Label ID="lblsession" runat=server></asp:Label>
      </td>
  </tr>
</table>
</div>
<div align=center style="font-size:12px; margin-top:10px">
<font color="336699"><strong>Powered and Maintained by Huaying<strong>
</div>
</body>
</html>