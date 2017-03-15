using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void login_Click(object sender, EventArgs e)
    {
        String _managerName = UserName.Text.Trim();
        String _managerPsw = PassWord.Text.Trim();
        Manager manager = new Manager();
        if (manager.Check(_managerName,Common.getMD5Code(_managerPsw)))
        {
            Session["currentManager"] = manager;
            Session["security"] = "safe";
            Response.Redirect("Manager.aspx");
        }
        else
        {
            return;

        }
    }
    protected void reset_Click(object sender, EventArgs e)
    {
        UserName.Text = "";
        PassWord.Text = "";
    }
}
