using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string Record(string str_name, string str_email, string str_phone)
    {
        string str = str_name + str_email + str_phone;
        return (str);
    }
    protected void Submit_Click(object sender, EventArgs e)
    {

    }
}