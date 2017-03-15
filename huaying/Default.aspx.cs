using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
            showNews1();
            showNews2();
            showNews3();
    }
    private void showNews1()
    {


        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select top 5 * from news where type=1 order by id desc");
            StringBuilder index_new = new StringBuilder("");
            while (reader.Read())
            {
                string id = reader["id"].ToString().Trim();
                string title = reader["title"].ToString().Trim();

                index_new.Append("<li><a class=\"type-link\" href=\"news_list.aspx\">[快讯]</a><a href=\"news_detail_" + id + ".html\" title=\"" + title + "\">" + title + "</a></li>");
                
            }
            ltlindexnew1.Text = index_new.ToString();
            reader.Close();
        }
    }

    private void showNews2()
    {


        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select top 5 * from students order by s_order");
            StringBuilder index_new = new StringBuilder("");
            while (reader.Read())
            {
                string id = reader["id"].ToString().Trim();
                string name = reader["name"].ToString().Trim();
                string info = reader["info"].ToString().Trim();
                string name_info = name + " " + info;

                index_new.Append("<li><a class=\"type-link\" href=\"students.aspx\">[学霸]</a><span class=\"lightBox\"><a data-iframe=\"true\" data-src=\"Show/show_stu.aspx?id=" + id + "\"  href=\"#\"  title=\"" + name_info + "\">" + name_info + "</a></span></li>");

            }
            ltlindexnew2.Text = index_new.ToString();
            reader.Close();
        }
    }

    private void showNews3()
    {


        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select top 5 * from news where type=2 order by id desc");
            StringBuilder index_new = new StringBuilder("");
            while (reader.Read())
            {
                string id = reader["id"].ToString().Trim();
                string title = reader["title"].ToString().Trim();

                index_new.Append("<li><a class=\"type-link\" href=\"news_list.aspx#q2\">[前沿]</a><a href=\"news_detail_" + id + ".html\" title=\"" + title + "\">" + title + "</a></li>");

            }
            ltlindexnew3.Text = index_new.ToString();
            reader.Close();
        }
    }
}