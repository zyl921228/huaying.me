using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showCourse();
        showTable();
    }

    private void showCourse() {
        int a_tmp = 0;
        int b_tmp = 0;
        int c_tmp = 0;
        int d_tmp = 0;
        int e_tmp = 0;
        int f_tmp = 0;
        string filter_req = Request.QueryString["course"];
        try
        {
            a_tmp = int.Parse(filter_req.Substring(filter_req.IndexOf('a') + 1, 1));
        }
        catch (Exception err)
        {
            a_tmp = 0;
        }

        try
        {
            b_tmp = int.Parse(filter_req.Substring(filter_req.IndexOf('b') + 1, 1));
        }
        catch (Exception err)
        {
            b_tmp = 0;
        }

        try
        {
            c_tmp = int.Parse(filter_req.Substring(filter_req.IndexOf('c') + 1, 1));
        }
        catch (Exception err)
        {
            c_tmp = 0;
        }
        try
        {
            d_tmp = int.Parse(filter_req.Substring(filter_req.IndexOf('d') + 1, 1));
        }
        catch (Exception err)
        {
            d_tmp = 0;
        }
        try
        {
            e_tmp = int.Parse(filter_req.Substring(filter_req.IndexOf('e') + 1, 1));
        }
        catch (Exception err)
        {
            e_tmp = 0;
        }
        try
        {
            f_tmp = int.Parse(filter_req.Substring(filter_req.IndexOf('f') + 1, 1));
        }
        catch (Exception err)
        {
            f_tmp = 0;
        }

        string jss = "<script language='javascript' type='text/javascript'> $(\"#fil1_" + a_tmp + ",#fil2_" + b_tmp + ",#fil3_" + c_tmp + ",#fil4_" + d_tmp + ",#fil5_" + e_tmp + ",#fil6_" + f_tmp + "\").attr(\"class\", \"seled\"); </script>";
        Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "mya", jss);



        if (!IsPostBack)
        {
            Boolean flag = false;
            int num = 1;
            SqlDataReader reader = SqlHelper.ExecuteReader("select * from course_item where (filter LIKE '%a" + IfZero(a_tmp) + "%' OR filter LIKE '%a0%') AND (filter LIKE '%b" + IfZero(b_tmp) + "%' OR filter LIKE '%b0%') AND (filter LIKE '%c" + IfZero(c_tmp) + "%' OR filter LIKE '%c0%') AND (filter LIKE '%d" + IfZero(d_tmp) + "%' OR filter LIKE '%d0%') AND (filter LIKE '%e" + IfZero(e_tmp) + "%' OR filter LIKE '%e0%') AND (filter LIKE '%f" + IfZero(f_tmp) + "%' OR filter LIKE '%f0%') order by id");
            StringBuilder course_tmp = new StringBuilder("");
            course_tmp.Append("<li><div class=\"course_li\">");
            while (reader.Read())
            {
                if (flag == true)
                {
                    course_tmp.Append("<li><div class=\"course_li\">");
                }
                flag = false;
                string id = reader["id"].ToString().Trim();
                string name = reader["name"].ToString().Trim();
                string ctime = reader["ctime"].ToString().Trim();
                string etime = reader["etime"].ToString().Trim();
                int location = int.Parse(reader["location"].ToString().Trim());
                int type = int.Parse(reader["type"].ToString().Trim());
                string picpath = reader["picpath"].ToString().Trim();

                course_tmp.Append("<div class=\"col-md-3\"><div  class=\"course_slider_item\"><div  class=\"course_img\"><a  href=\"course_detail.aspx?type=" + type + "\"><img  src=\"" + picpath + "\"  alt=\"img\"></a></div><div  class=\"course_info\"><p><a href=\"course_detail.aspx?type=" + type + "\">" + StringSub(name, 30) + "<br/>开班日期：" + StringSub(ctime + "至" + etime, 16) + "</a><span class=\"lightBox\"><a href=\"#\" data-iframe=\"true\" data-src=\"Show/show_map_" + location + ".html\"><img src=\"images/location.png\" /></a></span></p></div></div></div>");
                if (num % 8 == 0)
                {
                    course_tmp.Append("</div></li>");
                    flag = true;
                }
                num++;
            }
            if (flag == false)
            {
                course_tmp.Append("</div></li>");
            }

            ltlcourse.Text = course_tmp.ToString();
            reader.Close();
        }
    }

    private void showTable() {
        if (!IsPostBack) {
            StringBuilder[] course_tmp = new StringBuilder[5];
            course_tmp[0] = new StringBuilder("");
            course_tmp[1] = new StringBuilder("");
            course_tmp[2] = new StringBuilder("");
            course_tmp[3] = new StringBuilder("");
            course_tmp[4] = new StringBuilder("");
            for (int i = 1; i <= 5;i++ )
            {

                SqlDataReader reader = SqlHelper.ExecuteReader("select top 3 * from course_item where (filter LIKE '%c" + i + "%' OR filter LIKE '%c0%')order by id");
                
                while (reader.Read())
                {
                    string name = reader["name"].ToString().Trim();
                    int location_id = int.Parse(reader["location"].ToString().Trim());
                    string duration = reader["duration"].ToString().Trim();
                    string ctime = reader["ctime"].ToString().Trim();
                    string etime = reader["etime"].ToString().Trim();
                    int type = int.Parse(reader["type"].ToString().Trim());

                    string location = "";
                    switch (location_id)
                    {
                        case 1:
                            location = "天祥广场";
                            break;
                        case 2:
                            location = "西大街";
                            break;
                        case 3:
                            location = "仁和春天广场";
                            break;
                    }

                    course_tmp[i - 1].Append("<tr><td><a href=\"course_detail.aspx?type=" + type + "\">"+name+"</a></td><td>"+location+"</td><td>"+duration+"</td><td>"+ctime+"</td><td>"+etime+"</td></tr>");

                }


                reader.Close();
            }
            tbl_1.Text = course_tmp[0].ToString();
            tbl_2.Text = course_tmp[1].ToString();
            tbl_3.Text = course_tmp[2].ToString();
            tbl_4.Text = course_tmp[3].ToString();
            tbl_5.Text = course_tmp[4].ToString();
        }
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
    public static string IfZero(int num)
    {
        if (num == 0)
        {
            return "";
        }
        else {
            return num.ToString().Trim();
        }
    }
}