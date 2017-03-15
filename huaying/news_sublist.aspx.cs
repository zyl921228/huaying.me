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
    string keyword = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        class_id = int.Parse(Request.QueryString["type"] ?? "0");
        page_id = int.Parse(Request.QueryString["page"] ?? "1");
        keyword = Request.QueryString["keyword"] ?? "";
        DataPager da = new DataPager();
        showList();
        showPager(8,25);
    }

    private void showList() {
        

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


    protected string showPager(int buttonCount,int pageSize)
    {
        double maxPage=0;
        SqlDataReader reader = SqlHelper.ExecuteReader("select count(*) from news ");
        if (class_id != 0) {
            reader = SqlHelper.ExecuteReader("select count(*) from news where sub_type=" + class_id);
        }
        while(reader.Read()){
            maxPage = Math.Ceiling((double)reader.GetInt32(0) / pageSize);
        }


        if (page_id > maxPage)
        {
            page_id = 1;
        }
        StringBuilder pager_tmp = new StringBuilder("");
        int nowOn=(page_id-1)/(buttonCount)+1;
        int firstNum = (nowOn - 1) * buttonCount + 1;
        if (page_id == 1)
        {
            pager_tmp.Append("<div class=\"Nl-pager-num-container\"><span>1</span>");
        }
        else {
            pager_tmp.Append("<span><a href=\"news_sublist_"+class_id+"_"+(page_id-1)+".html\" class=\"Nl-pager-prev\"><</a></span>");
            if (nowOn == 1)
            {
                pager_tmp.Append("<div class=\"Nl-pager-num-container\">");
            }
            else {
                pager_tmp.Append("<div class=\"Nl-pager-num-container\"><a href=\"news_sublist_" + class_id + "_"+buttonCount*(nowOn-1)+".html\">...</a>");
            }
            if ((page_id - 1) % buttonCount != 0)
            {
                for (int i = 1; i <= page_id - ((nowOn - 1) * buttonCount + 1); i++)
                {
                    pager_tmp.Append("<a href=\"news_sublist_" + class_id + "_" + (buttonCount * (nowOn - 1) + i) + ".html\">" + (buttonCount * (nowOn - 1) + i) + "</a>");
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
                        pager_tmp.Append("<a href=\"news_sublist_" + class_id + "_" + (page_id + i) + ".html\">" + (page_id + i) + "</a>");
                    }
                }
                else
                {

                }
                pager_tmp.Append("<a href=\"news_sublist_" + class_id + "_" + (buttonCount * nowOn + 1) + ".html\">...</a>");
            }
            else {
                for (int i = 1; i <= maxPage - page_id; i++)
                {
                    pager_tmp.Append("<a href=\"news_sublist_" + class_id + "_" + (page_id + i) + ".html\">" + (page_id + i) + "</a>");
                }
            }
            pager_tmp.Append("</div><span><a href=\"news_sublist_" + class_id + "_" + (page_id + 1) + ".html\" class=\"Nl-pager-prev\">></a></span>");
        }

        if (class_id == 0)
        {
            SqlDataSource1.SelectCommand = "select top " + pageSize + " * from news where id not in (select   top " + (page_id - 1) * pageSize + " id   from   news order by id desc) order by id desc";
        }
        else
        {
            SqlDataSource1.SelectCommand = "select top " + pageSize + " * from news where (id not in (select   top " + (page_id - 1) * pageSize + " id   from   news where sub_type=" + class_id + " order by id desc)) AND (sub_type=" + class_id + " ) order by id desc";//"select * from news where sub_type=" + class_id + " order by date";


        }
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