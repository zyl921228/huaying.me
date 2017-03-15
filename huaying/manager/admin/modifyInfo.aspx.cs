using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;
public partial class admin_role_modifyInfo : System.Web.UI.Page
{
    private Manager m = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Session["security"].Equals("safe"))
            {
                Response.Write("<script language='javascript'>window.parent.location.href='../Default.aspx'</script>");
            }
            newPsw1.Attributes.Add("onKeyUp", "javascript:ps.update(this.value)");
            m = (Manager)Session["currentManager"];
            oldName.Text = m.managerName.Trim();
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>window.parent.location.href='../Default.aspx'</script>");

        }



    }
    protected void modifyBtn_Click(object sender, EventArgs e)
    {
        try
        {
            String _oldName = oldName.Text.Trim();
            String _oldPsw = oldPsw.Text.Trim();
            //String _newName = newName.Text.Trim();
            String _newPsw = newPsw1.Text.Trim();
            //Common.CRM.UI.UserLogin UL_Manager = 
            //int nUserid = UL_Manager.UserId;

            //lblUserName.Text = "您好：<font color='red'>" + strUsername + "</font>";
            bool bCheck = false;
            Manager Employeeobj = new Manager();

            //Common.CRM.Dao.EmployeeDao Employeeobj = new Common.CRM.Dao.EmployeeDao();
            bCheck = Employeeobj.CheckPassword(_oldPsw, m.id);
            if (bCheck == false)
            {
                Common.ShowMessage(this, "旧密码错误");
                Common.ReturnPage(this, "modifyInfo.aspx");
            }
            else
            {
                bool bModify = Employeeobj.modifyPasswordByeid(_newPsw, m.id);
                if (bModify == false)
                {
                    Common.ShowMessage(this, "修改失败，请重新修改！");
                    Common.ReturnPage(this, "modifyInfo.aspx");
                }
                else
                {
                    Common.ShowMessage(this, "修改成功，请牢记新密码！新密码为：" + _newPsw);
                    Common.ReturnPage(this, "modifyInfo.aspx");
                }
            }
            //string strRolename = RightObj.GetRoleNameById(UL_Manager.roleid);
            //lblRoleName.Text = "角色：<font color='red'>" + strRolename + "</font>"; ;
            // lblRoleName.Text = "角色：" + 
        }
        catch
        {
            Response.Redirect("../Manager.aspx");
        }
    }
    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Manager.aspx");
    }
}
