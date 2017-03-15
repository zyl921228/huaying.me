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
    private int course_group_id;
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

        course_group_id = int.Parse(Request.QueryString["id"]);






        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select * from course_group where id=" + course_group_id);
            while (reader.Read())
            {
                TextBox1.Text = reader["name"].ToString().Trim();
                TextBox2.Text = reader["fit"].ToString().Trim();
                TextBox3.Text = reader["intro"].ToString().Trim();
                TextBox4.Text = reader["content"].ToString().Trim();
                TextBox5.Text = reader["ctime"].ToString().Trim();
                String picUrl = reader["picpath"].ToString().Trim();
                if (picUrl != "")
                {
                    lastcoursegroupPic.ImageUrl = picUrl;
                    lastcoursegroupPic.Visible = true;
                }
                DropDownList1.SelectedValue = reader["type"].ToString().Trim();
            }
            reader.Close();
        }
    }

    protected void Submit_Click2(object sender, EventArgs e)
    {
        String picUrl = Common.getUrl("/images/upload_files/coursegroup/", coursegroupPic);
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("select [picpath] from course_group where [id]=" + course_group_id);
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
        }
        reader.Close();



        String courseName = TextBox1.Text.ToString().Trim();
        String courseFit = TextBox2.Text.ToString().Trim();
        String courseIntro = TextBox3.Text.ToString().Trim();
        String courseContent = TextBox4.Text.ToString().Trim();
        String courseCtime = TextBox5.Text.ToString().Trim();
        int type = Convert.ToInt32(DropDownList1.SelectedValue);

        cmd = dbmanager.getcmd("UPDATE course_group SET [name]=@name,[fit]=@fit,[intro]=@intro,[content]=@content,[ctime]=@ctime,[picpath]=@picpath,[type]=@type WHERE [id]=" + course_group_id);
        cmd.Parameters.AddWithValue("@name", courseName);
        cmd.Parameters.AddWithValue("@fit", courseFit);
        cmd.Parameters.AddWithValue("@intro", courseIntro);
        cmd.Parameters.AddWithValue("@content", courseContent);
        cmd.Parameters.AddWithValue("@ctime", courseCtime);
        cmd.Parameters.AddWithValue("@picpath", picUrl);
        cmd.Parameters.AddWithValue("@type", type);
        if (picUrl != "")
        {
            lastcoursegroupPic.ImageUrl = picUrl;
            lastcoursegroupPic.Visible = true;
        }
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        cmd.Connection.Dispose();
        cmd.Dispose();
        dbmanager.closeDB();
        Response.Redirect("course_group_edit.aspx");
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

