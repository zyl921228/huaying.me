using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showList();
        
    }

    private void showList() {
        int class_id = int.Parse(Request.QueryString["class"]);

        StringBuilder navi_tmp = new StringBuilder("");
        switch (class_id)
        {
            case 1:
                ctl1.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=1\">雅思</a>");
                break;
            case 2:
                ctl2.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=2\">托福</a>");
                break;
            case 3:
                ctl3.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=3\">美国高考</a>");
                break;
            case 4:
                ctl4.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=4\">综合英语</a>");
                break;
            case 5:
                ctl5.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=5\">小语种</a>");
                break;

        }
        ltlcoursenavi.Text = navi_tmp.ToString();

        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select * from course_group where type=" + class_id + " order by id");
            StringBuilder list_tmp = new StringBuilder("");
            while (reader.Read())
            {
                string id = reader["id"].ToString().Trim();
                string name = reader["name"].ToString().Trim();
                string fit = reader["fit"].ToString().Trim();
                string intro = reader["intro"].ToString().Trim();

                list_tmp.Append("<div class=\"C-sub-item\"><a href=\"course_detail.aspx?type="+id+"\"><div class=\"C-sub-itemhead\">"+name+"</div></a><div class=\"C-sub-itemcontent\"><div class=\"C-sub-itemcontent-head\">适合学员：</div><div class=\"C-sub-itemcontent-detail\">"+fit+"</div><div class=\"C-sub-itemcontent-head\">课程介绍：</div><div class=\"C-sub-itemcontent-detail\">"+intro+"</div></div></div>");

            }
            ltlcourselist.Text = list_tmp.ToString();
            reader.Close();



            reader = SqlHelper.ExecuteReader("select * from course_image where id=" + class_id);
            while (reader.Read())
            {
                Image_top.ImageUrl = reader["picpath_top"].ToString().Trim();
                Image_right.ImageUrl = reader["picpath_right"].ToString().Trim();
            }
            reader.Close();
        }



    }

}