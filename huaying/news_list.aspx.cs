using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ctl2.Attributes.Add("class", "col-md-2 C-top-list-item active");
    }
    public static string StringSub(string str, int length)
    {
        if (string.IsNullOrEmpty(str) || System.Text.Encoding.Default.GetByteCount(str) <= length)
            return str;
        string l_tmp = str;//.Substring(0, length - 1);
        while (System.Text.Encoding.Default.GetByteCount(l_tmp) > length - 2)
            l_tmp = l_tmp.Substring(0, l_tmp.Length - 1);
        return "<span title='" + str + "'>" + l_tmp + "...</span>";
    }
}