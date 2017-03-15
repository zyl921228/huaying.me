using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class students : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showStu();
    }
    private void showStu()
    {
        Boolean flag = false;
        int num = 1;
        StringBuilder sb = new StringBuilder("");
        string strSql1 = " select * from students order by s_order";
        SqlDataReader reader = SqlHelper.ExecuteReader(strSql1);
        sb.Append("<li><div class=\"slide\"><div class=\"T-et-container\"><div class=\"T-et-left-stu\">");
        while (reader.Read())
        {
            if (flag == true) {
                sb.Append("<li><div class=\"slide\"><div class=\"T-et-container\"><div class=\"T-et-left-stu\">");
            }
            flag = false;
            string str_id=reader["id"].ToString().Trim();
            string str_name = reader["name"].ToString().Trim();
            string str_info = reader["info"].ToString().Trim();
            string str_picpath = reader["picpath"].ToString().Trim();
            string str_s_order = reader["s_order"].ToString().Trim();

            sb.Append("<div class=\"col-md-4\"><div  class=\"item-hover lightBox stu\"><a  data-iframe=\"true\" data-src=\"Show/show_stu.aspx?id=" + str_id + "\"  href=\"#\"><div  class=\"img\"><img  src=\"" + str_picpath + "\"  alt=\"img\"></div><div  class=\"info\"><h3>" + str_name + "</h3><p>" + str_info + "</p></div></a></div></div>");
                if (num % 9 == 0)
                {
                    sb.Append("</div></div></div></li>");
                    flag = true;
                }
            num++;
        }
        if (flag == false) {
            sb.Append("</div></div></div></li>");
        }
        reader.Close();
        ltlstu.Text = sb.ToString();
    }
}