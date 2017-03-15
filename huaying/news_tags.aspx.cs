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
    int page_id = 1;
    int class_id = 0;
    string tag = "";
    string tag_decode = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        class_id = int.Parse(Request.QueryString["type"] ?? "0");
        page_id = int.Parse(Request.QueryString["page"] ?? "1");
        tag = Request.QueryString["tag"] ?? "";
        DataPager da = new DataPager();
        showList();
        showPager(8,25);
        //SqlDataSource1.SelectCommand = "SELECT * FROM [news] WHERE [tags] LIKE '%"+tag_decode+"%' ORDER BY [date]";
    }

    private void showList() {
        

        StringBuilder navi_tmp = new StringBuilder("");
        if (tag != "")
        {
            tag_decode = UnicodeConverter.ToGB2312(tag);
            ltlnewsnavi.Text = tag_decode;
        }
        else
        {
            Response.Redirect("news_sublist_0_1.html");
        }
    }


    protected string showPager(int buttonCount, int pageSize)
    {
        double maxPage = 0;
        SqlDataReader reader = SqlHelper.ExecuteReader("select count(*) from news WHERE [tags] LIKE '%" + tag_decode + "%' ");
        while (reader.Read())
        {
            maxPage = Math.Ceiling((double)reader.GetInt32(0) / pageSize);
        }


        if (page_id > maxPage)
        {
            page_id = 1;
        }
        StringBuilder pager_tmp = new StringBuilder("");
        int nowOn = (page_id - 1) / (buttonCount) + 1;
        int firstNum = (nowOn - 1) * buttonCount + 1;
        if (page_id == 1)
        {
            pager_tmp.Append("<div class=\"Nl-pager-num-container\"><span>1</span>");
        }
        else {
            pager_tmp.Append("<span><a href=\"news_tags_" + tag + "_page" + (page_id - 1) + ".html\" class=\"Nl-pager-prev\"><</a></span>");
            if (nowOn == 1)
            {
                pager_tmp.Append("<div class=\"Nl-pager-num-container\">");
            }
            else {
                pager_tmp.Append("<div class=\"Nl-pager-num-container\"><a href=\"news_tags_" + tag + "_page" + buttonCount * (nowOn - 1) + ".html\">...</a>");
            }
            if ((page_id - 1) % buttonCount != 0)
            {
                for (int i = 1; i <= page_id - ((nowOn - 1) * buttonCount + 1); i++)
                {
                    pager_tmp.Append("<a href=\"news_tags_" + tag + "_page" + (buttonCount * (nowOn - 1) + i) + ".html\">" + (buttonCount * (nowOn - 1) + i) + "</a>");
                }
            }
            else
            {

            }
            pager_tmp.Append("<span>"+page_id+"</span>");
        }
        if (page_id == maxPage)
        {
            pager_tmp.Append("</div>");
        }
        else {
            if (maxPage - nowOn * buttonCount > 0)
            {
                if (page_id % buttonCount != 0)
                {
                    for (int i = 1; i <= nowOn * buttonCount - page_id; i++)
                    {
                        pager_tmp.Append("<a href=\"news_tags_" + tag + "_page" + (page_id + i) + ".html\">" + (page_id + i) + "</a>");
                    }
                }
                else
                {

                }
                pager_tmp.Append("<a href=\"news_tags_" + tag + "_page" + (buttonCount * nowOn + 1) + ".html\">...</a>");
            }
            else {
                for (int i = 1; i <= maxPage - page_id; i++)
                {
                    pager_tmp.Append("<a href=\"news_tags_" + tag + "_page" + (page_id + i) + ".html\">" + (page_id + i) + "</a>");
                }
            }
            pager_tmp.Append("</div><span><a href=\"news_tags_" + tag + "_page" + (page_id + 1) + ".html\" class=\"Nl-pager-prev\">></a></span>");
        }

        SqlDataSource1.SelectCommand = "select top " + pageSize + " * from news where (id not in (select   top " + (page_id - 1) * pageSize + " id   from news where [tags] LIKE '%" + tag_decode + "%' order by id desc)) AND ([tags] LIKE '%" + tag_decode + "%') order by id desc";

        //SqlDataSource1.SelectCommand = "select top m * from tablename where id not in( select top n id from tablename)";
        ltlpager.Text = pager_tmp.ToString();

        return pager_tmp.ToString();
    }




    protected string whichType(string str) {
        string sub_type = "";
        switch (str)
        {
            case "1":
                sub_type = "[雅思快讯]";
                break;
            case "2":
                sub_type = "[托福快讯]";
                break;
            case "3":
                sub_type = "[SAT考试]";
                break;
            case "4":
                sub_type = "[留学咨询]";
                break;

        }
        return sub_type;
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