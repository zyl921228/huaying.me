using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teachers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showTea();
    }
    private void showTea()
    {
        StringBuilder sb = new StringBuilder("");
        string strSql1 = " select * from teachers order by t_order";
        SqlDataReader reader = SqlHelper.ExecuteReader(strSql1);
        while (reader.Read())
        {
            string str_id = reader["id"].ToString().Trim();
            string str_name = reader["name"].ToString().Trim();
            string str_info1 = reader["info1"].ToString().Trim();
            string str_info2 = reader["info2"].ToString().Trim();
            string str_picpath = reader["picpath"].ToString().Trim();
            string str_t_order = reader["t_order"].ToString().Trim();
            sb.Append("<li class=\"col-md-3\"><div  class=\"item-hover lightBox\"><a  data-iframe=\"true\" data-src=\"Show/show_tea.aspx?id=" + str_id + "\" href=\"#\"><div  class=\"img\"><img  src=\"" + str_picpath + "\"  alt=\"img\"></div><div  class=\"info\"><h3>" + str_name + "</h3><p>" + str_info1 + "<br/>" + str_info2 + "</p></div></a></div></li>");
        }
        reader.Close();
        ltltea.Text = sb.ToString();
    }

}