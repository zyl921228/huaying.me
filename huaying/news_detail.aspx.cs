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
    private int news_id;
    private int class_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        news_id = int.Parse(Request.QueryString["id"]);
        updateHit();
        showDetail();
        //ListView1
    }

    private void updateHit() {
        if (!IsPostBack)
        {
            sqlManager dbmanager = sqlManager.createInstance();
            dbmanager.connectDB();
            SqlCommand cmd = dbmanager.getcmd("UPDATE news SET [hittime]=[hittime]+1 WHERE [id]=" + news_id);
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            cmd.Connection.Dispose();
            cmd.Dispose();
            dbmanager.closeDB();
        }
    }

    private void showDetail()
    {

        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select * from news where id=" + news_id);
            while (reader.Read())
            {
                StringBuilder sb_head = new StringBuilder("");
                StringBuilder sb_subhead = new StringBuilder("");
                StringBuilder sb_content = new StringBuilder("");
                StringBuilder sb_tags = new StringBuilder("");
                sb_head.Append(reader["title"].ToString().Trim());
                sb_subhead.Append("文章来源：" + reader["source"].ToString().Trim() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间：" + Convert.ToDateTime(reader["date"].ToString().Trim()).ToString("yyyy年MM月dd日") + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击数：" + reader["hittime"].ToString().Trim() + "次");
                sb_content.Append(reader["detail"].ToString().Trim());
                
                string content = sb_content.ToString();
                SqlDataReader reader_keywords = SqlHelper.ExecuteReader("select * from keywords");
                while (reader_keywords.Read())
                {
                    Regex r = new Regex(reader_keywords["name"].ToString().Trim());
                    content = r.Replace(content, "<a href=\"" + reader_keywords["url"].ToString().Trim() + "\">" + reader_keywords["name"].ToString().Trim() + "</a>", 1);
                }
                reader_keywords.Close();

                StringBuilder sb_taglink = new StringBuilder("");
                sb_tags.Append(reader["tags"].ToString().Trim());
                string[] tag = sb_tags.ToString().Split(new char[] { ';' });
                for (int i = 0; i < tag.Length;i++ ) {
                    sb_taglink.Append("&nbsp;&nbsp;<a href=\"news_tags_" + UnicodeConverter.ToUnicode(tag[i]) + "_page1.html\">" + tag[i] + "</a>");// UnicodeConverter.ToUnicode(tag[i]) 
                }
                ltlhead.Text = sb_head.ToString();
                ltlsubhead.Text = sb_subhead.ToString();
                ltlcontent.Text = content;
                ltltags.Text = sb_taglink.ToString();
                Page.Title = reader["title"] + "——华樱出国_新闻资讯";

                //面包屑导航栏
                class_id = int.Parse(reader["type"].ToString().Trim());
                StringBuilder navi_tmp = new StringBuilder("");
                switch (class_id)
                {
                    case 0:
                        break;
                    case 1:
                        navi_tmp.Append("<a href=\"news_sublist.aspx?type=1\">雅思快讯</a>");
                        break;
                    case 2:
                        navi_tmp.Append("<a href=\"news_sublist.aspx?type=2\">托福快讯</a>");
                        break;
                    case 3:
                        navi_tmp.Append("<a href=\"news_sublist.aspx?type=3\">SAT考试</a>");
                        break;
                    case 4:
                        navi_tmp.Append("<a href=\"news_sublist.aspx?type=4\">留学咨询</a>");
                        break;

                }
                ltlnewsnavi.Text = navi_tmp.ToString();
            }
            reader.Close();
        }
    }
    int Num = 1;
    protected int GetNum()
    {

        return Num++;

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

    protected String HavePic(String picpath) {
        if (picpath == "")
        {
            return "/images/upload_files/news/default.jpg";
        }
        else
        {
            return picpath;
        }
    }
}
