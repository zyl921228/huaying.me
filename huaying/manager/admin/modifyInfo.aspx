<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modifyInfo.aspx.cs" Inherits="admin_role_modifyInfo"  ErrorPage="~/Mg_Admin/default.aspx"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <LINK href="../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../Js/pwdstr.js"></script>
    <script language="javascript">
		        function checkForm()
		        {
		            if(document.getElementById("oldPsw").value=="")
		            {
		                alert("�����������")
		                document.getElementById("oldPsw").focus();
		                return false;
		            }
		            if(document.getElementById("newPsw1").value=="")
		            {
		                alert("������������")
		                document.getElementById("newPsw1").focus();
		                return false;
		            }
		            if(document.getElementById("newPsw2").value=="")
		            {
		                alert("������ȷ������")
		                document.getElementById("newPsw2").focus();
		                return false;
		            }
		            if(document.getElementById("newPsw1").value != document.getElementById("newPsw2").value)
		            {
		                alert("�����������벻ͬ")
		                document.getElementById("newPsw1").focus();
		                return false;
		            }
		            return true;
		            
		       }
    </script>
</head>
<body style="margin-top: 0px; margin-left: 0px; background-color: #f2f8ff">
    <form id="form1" runat="server">
       <div>
            <table align="center" cellpadding="0" cellspacing="0" width="100%" border="0" id="TABLE2"
                class="tdbg" bgcolor="#f2f8ff">
                <tr height="20">
                    <td align="center" class="title">
                        <b>������Ϣ</b></td>
                </tr>
            </table>
        </div>
        <div style="margin-left:10px">
            <table cellpadding="0" cellspacing="0" border="1" style="background-color: #F5F5F5;
                                border: solid 1px #ece9d8; border-collapse: collapse; width:100%">
                                <tr>
                                    <td colspan="2" align="center" style="height: 30px" valign="middle">
                                        <b>�޸�����</b></td>
                                </tr>
                                <tr>
                                    <td align="right" valign="middle" style="height: 30px; width: 40%" class="tdBorder">
                                        <div style="padding-right: 5px">
                                            <asp:Label ID="Label2" runat="server" Text="�û�����"></asp:Label>
                                        </div>
                                    </td>
                                    <td align="left" valign="middle" style="height: 30px;" class="tdBorder">
                                        <div style="padding-left: 5px">
                                            <asp:TextBox ID="oldName" runat="server" Enabled="false" Width="250px"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="middle" style="height: 30px; width: 40%" class="tdBorder">
                                        <div style="padding-right: 5px">
                                            <asp:Label ID="Label1" runat="server" Text="�����룺"></asp:Label>
                                        </div>
                                    </td>
                                    <td align="left" valign="middle" style="height: 30px;" class="tdBorder">
                                        <div style="padding-left: 5px">
                                            <asp:TextBox ID="oldPsw" runat="server" TextMode="password" Width="250px"></asp:TextBox>&nbsp;<font
                                                color="red">*</font>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="middle" style="height: 30px; width: 40%" class="tdBorder">
                                        <div style="padding-right: 5px">
                                            <asp:Label ID="Label3" runat="server" Text="�����룺"></asp:Label>
                                        </div>
                                    </td>
                                    <td align="left" valign="middle" style="height: 30px;" class="tdBorder">
                                        <div style="padding-left: 5px">
                                            <asp:TextBox ID="newPsw1" runat="server" TextMode="password" Width="250px"></asp:TextBox>&nbsp;<font
                                                color="red">*</font>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="middle" style="height: 30px; width: 40%" class="tdBorder">
                                        <div style="padding-right: 5px">
                                            <asp:Label ID="Label4" runat="server" Text="�ٴ����������룺"></asp:Label>
                                        </div>
                                    </td>
                                    <td align="left" valign="middle" style="height: 30px;" class="tdBorder">
                                        <div style="padding-left: 5px">
                                            <asp:TextBox ID="newPsw2" runat="server" TextMode="password" Width="250px"></asp:TextBox>&nbsp;<font
                                                color="red">*</font>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30" align="right" class="tdBorder">
                                        ����ǿ����ʾ��</td>
                                    <td height="30" class="tdBorder">
                                        <div style="padding-left: 5px">

                                            <script type="text/javascript">
						var ps = new PasswordStrength();
						//������ʾ��С��
						ps.setSize("300","20");
						//�������ټ���ַ����ȣ�
						ps.setMinLength(1);
                                            </script>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" style="height: 40px">
                                         
                                        <asp:Button runat="server" Text="�޸�" ID="modifyBtn" OnClick="modifyBtn_Click" OnClientClick="return checkForm()" />
                                    </td>
                                </tr>
                            </table>
        </div>
  </form>
 
</body>
</html>
