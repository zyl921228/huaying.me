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
    int type_id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        type_id = int.Parse(Request.QueryString["type"]);
        showDetail();
        showList();
    }
    private void showDetail()
    {
        if (!IsPostBack)
        {
        int class_id = 1;
        string id = "";
        string name = "";
        string fit = "";
        string intro = "";
        string content = "";
        string ctime = "";
        string picpath = "";

            SqlDataReader reader = SqlHelper.ExecuteReader("select * from course_group where id=" + type_id + " order by id");
            StringBuilder list_tmp = new StringBuilder("");
            while (reader.Read())
            {
                id = reader["id"].ToString().Trim();
                name = reader["name"].ToString().Trim();
                fit = reader["fit"].ToString().Trim();
                intro = reader["intro"].ToString().Trim();
                content = reader["content"].ToString().Trim();
                ctime = reader["ctime"].ToString().Trim();
                picpath=reader["picpath"].ToString().Trim();
                class_id =Convert.ToInt32(reader["type"]);
                list_tmp.Append("<div class=\"C-sub-detail-itemcontent-head\">适合学员：</div><div class=\"C-sub-detail-itemcontent-detail\">"+fit+"</div><div class=\"C-sub-detail-itemcontent-head\">课程介绍：</div><div class=\"C-sub-detail-itemcontent-detail\">"+intro+"</div><div class=\"C-sub-detail-itemcontent-head\">授课内容：</div><div class=\"C-sub-detail-itemcontent-detail\"> "+content+"</div><div class=\"C-sub-detail-itemcontent-head\">上课时间：</div><div class=\"C-sub-detail-itemcontent-detail\">"+ctime+"</div>");
                Image3.ImageUrl = picpath;
            }
            ltlcoursedetail.Text = list_tmp.ToString();
            reader.Close();
       
        StringBuilder navi_tmp = new StringBuilder("");
        switch (class_id)
        {
            case 1:
                ctl1.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=1\">雅思</a>>><a>" + name + "</a>");
                break;
            case 2:
                ctl2.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=2\">托福</a>>><a>" + name + "</a>");
                break;
            case 3:
                ctl3.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=3\">美国高考</a>>><a>" + name + "</a>");
                break;
            case 4:
                ctl4.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=4\">综合英语</a>>><a>" + name + "</a>");
                break;
            case 5:
                ctl5.Attributes.Add("class", "col-md-2 C-top-list-item active");
                navi_tmp.Append("<a href=\"course_list.aspx?class=5\">小语种</a>>><a>" + name + "</a>");
                break;

        }
        ltlcoursenavi.Text = navi_tmp.ToString();

        reader = SqlHelper.ExecuteReader("select * from course_image where id=" + class_id);
        while (reader.Read()) {
            Image_top.ImageUrl = reader["picpath_top"].ToString().Trim();
            Image_right.ImageUrl = reader["picpath_right"].ToString().Trim();
        }
        reader.Close();

        }

    }

    private void showList()
    {
        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select * from course_item where type=" + type_id + " order by id");
            StringBuilder list_tmp = new StringBuilder("");
            while (reader.Read())
            {
                int location_id=1;
                int isfull=0;
                string choose_btn="";
                string location = "";
                string id = reader["id"].ToString().Trim();
                string name = reader["name"].ToString().Trim();
                string ctime = reader["ctime"].ToString().Trim();
                string etime = reader["etime"].ToString().Trim();
                location_id=int.Parse(reader["location"].ToString().Trim());
                string circum = reader["circum"].ToString().Trim();
                isfull=int.Parse(reader["isfull"].ToString().Trim());


                switch (location_id)
                {
                    case 1:
                        location="天祥广场";
                        break;
                    case 2:
                        location = "西大街";
                        break;
                    case 3:
                        location = "仁和春天广场";
                        break;
                }


                if(isfull==1){
                    choose_btn="<span>已报满</span>";
                }else{
                choose_btn="<a onclick=\"openlink()\">我要报名！</a>";
                }

                list_tmp.Append("<tr><td>" + name + "</td><td>" + ctime + "至" + etime + "</td><td class=\"lightBox\"><a data-iframe=\"true\" data-src=\"Show/show_map_" + location_id + ".html\" href=\"#\">" + location + "&nbsp;&nbsp;&nbsp;<img src=\"images/location.png\" /></a></td><td>" + circum + "</td><td class=\"Cst-signup\">" + choose_btn + "</td></tr>");
            }
            ltlcourselist.Text = list_tmp.ToString();
            reader.Close();
        }

    }
}