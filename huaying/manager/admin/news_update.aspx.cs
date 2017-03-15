using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editor : System.Web.UI.Page
{
    private int news_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Session["security"].Equals("safe"))
            {
                Response.Write("<script language='javascript'>window.parent.location.href='../default.aspx'</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>window.parent.location.href='../default.aspx'</script>");

        }




        news_id = int.Parse(Request.QueryString["id"]);

        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select * from news where id=" + news_id);
            while (reader.Read())
            {
                TextBox1.Text = reader["title"].ToString().Trim();
                TextBox2.Text = reader["intro"].ToString().Trim();
                TextBox3.Text = reader["tags"].ToString().Trim();
                TextBox4.Text = reader["source"].ToString().Trim();
                DropDownList1.SelectedValue = reader["type"].ToString().Trim();
                DropDownList2.SelectedValue = reader["sub_type"].ToString().Trim();
                FCKeditor1.Value = reader["detail"].ToString().Trim();
                String picUrl = reader["picpath"].ToString().Trim();
                String picUrl_w = reader["picpath_w"].ToString().Trim();
                if (picUrl != "")
                {
                    lastnewsPic.ImageUrl = picUrl;
                    lastnewsPic.Visible = true;
                }
                if (picUrl_w != "")
                {
                    lastnewsPic_w.ImageUrl = picUrl_w;
                    lastnewsPic_w.Visible = true;
                }
            }
            reader.Close();
        }
    }
    protected void Submit_Click2(object sender, EventArgs e)
    {


        String picUrl = Common.getUrl("/images/upload_files/news/", newsPic);
        String picUrl_w = Common.getUrl("/images/upload_files/news_w/", newsPic_w);
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("select [picpath],[picpath_w] from news where [id]=" + news_id);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            string _picpath = reader["picpath"].ToString().Trim();
            if (picUrl == "")
            {
                picUrl = _picpath;
            }
            else
            {
                deletePic(reader["picpath"].ToString().Trim());
            }


            string _picpath_w = reader["picpath_w"].ToString().Trim();
            if (picUrl_w == "")
            {
                picUrl_w = _picpath_w;
            }
            else
            {
                deletePic(reader["picpath_w"].ToString().Trim());
            }
        }
        reader.Close();



        String strStarttime = "";
        if (strStarttime == "")
        {
            strStarttime = DateTime.Now.ToString("G");
        }
        DateTime dt = Convert.ToDateTime(strStarttime);


        cmd = dbmanager.getcmd("UPDATE news SET [title]=@title,[intro]=@intro,[picpath]=@picpath,[picpath_w]=@picpath_w,[detail]=@detail,[type]=@type,[sub_type]=@sub_type,[tags]=@tags,[source]=@source WHERE [id]=" + news_id);
        cmd.Parameters.AddWithValue("@title", TextBox1.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@intro", TextBox2.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@picpath", picUrl);
        cmd.Parameters.AddWithValue("@picpath_w", picUrl_w);
        cmd.Parameters.AddWithValue("@detail", FCKeditor1.Value.ToString().Trim());
        cmd.Parameters.AddWithValue("@type", Convert.ToInt32(DropDownList1.SelectedValue));
        cmd.Parameters.AddWithValue("@sub_type", Convert.ToInt32(DropDownList2.SelectedValue));
        cmd.Parameters.AddWithValue("@tags", TextBox3.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@source", TextBox4.Text.ToString().Trim());
        if (picUrl != "")
        {
            lastnewsPic.ImageUrl = picUrl;
            lastnewsPic.Visible = true;
        }
        if (picUrl_w != "")
        {
            lastnewsPic_w.ImageUrl = picUrl_w;
            lastnewsPic_w.Visible = true;
        }
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        cmd.Connection.Dispose();
        cmd.Dispose();
        dbmanager.closeDB();
        Response.Redirect("news_edit.aspx");




    }

    private void deletePic(string str)
    {
        String path = "";
        path = str;
        path = Server.MapPath(path);
        try
        {
            //File.Delete(cover);
            File.Delete(path);
        }
        catch
        {
            return;
        }
        //reader.Close();
    }
}