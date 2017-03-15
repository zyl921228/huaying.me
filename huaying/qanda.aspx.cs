using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class qanda : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showLeft();
        showRight();
    }
    private void showLeft()
    {
        int num = 1;
        StringBuilder sb = new StringBuilder("");
        string strSql1 = " select question from q_and_a order by q_order";
        SqlDataReader reader = SqlHelper.ExecuteReader(strSql1);
        while (reader.Read())
        {
            string str_question = reader["question"].ToString().Trim();
            sb.Append("<li><a href=\"#q" + num + "\">" + num + "、" + str_question + "</a></li>");
            num++;
        }
        reader.Close();
        ltlleft.Text = sb.ToString();
    }
    private void showRight()
    {
        int num = 1;
        StringBuilder sb = new StringBuilder("");
        string strSql1 = " select question,answer from q_and_a order by q_order";
        SqlDataReader reader = SqlHelper.ExecuteReader(strSql1);
        while (reader.Read())
        {
            string str_question = reader["question"].ToString().Trim();
            string str_answer = reader["answer"].ToString().Trim();

            sb.Append("<li id=\"q" + num + "\"><h2><b>Q" + num + "</b>" + str_question + "</h2><p>" + str_answer + "</p></li>");
            num++;
        }
        reader.Close();
        ltlright.Text = sb.ToString();
    }
}