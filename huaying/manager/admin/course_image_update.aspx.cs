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
    private int course_image_id;
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

        course_image_id = int.Parse(Request.QueryString["id"]);


        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select * from course_image where id=" + course_image_id);
            while (reader.Read())
            {
                TextBox1.Text = reader["name"].ToString().Trim();
                String picUrl_top = reader["picpath_top"].ToString().Trim();
                if (picUrl_top != "")
                {
                    lastcoursePic_top.ImageUrl = picUrl_top;
                    lastcoursePic_top.Visible = true;
                }

                String picUrl_right = reader["picpath_right"].ToString().Trim();
                if (picUrl_right != "")
                {
                    lastcoursePic_right.ImageUrl = picUrl_right;
                    lastcoursePic_right.Visible = true;
                }

            }
            reader.Close();
        }
    }

    protected void Submit_Click2(object sender, EventArgs e)
    {
        String picUrl_top = Common.getUrl("/images/upload_files/courseimage_top/", coursePic_top);
        String picUrl_right = Common.getUrl("/images/upload_files/courseimage_right/", coursePic_right);
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("select * from course_image where [id]=" + course_image_id);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            string _picpath_top = reader["picpath_top"].ToString().Trim();
            if (picUrl_top == "")
            {
                picUrl_top = _picpath_top;
            }
            else
            {
                deletePic(reader["picpath_top"].ToString().Trim());
            }

            string _picpath_right = reader["picpath_right"].ToString().Trim();
            if (picUrl_right == "")
            {
                picUrl_right = _picpath_right;
            }
            else
            {
                deletePic(reader["picpath_right"].ToString().Trim());
            }

        }
        reader.Close();


        cmd = dbmanager.getcmd("UPDATE course_image SET [name]=@name,[picpath_top]=@picpath_top,[picpath_right]=@picpath_right WHERE [id]=" + course_image_id);
        cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
        cmd.Parameters.AddWithValue("@picpath_top", picUrl_top);
        cmd.Parameters.AddWithValue("@picpath_right", picUrl_right);

        
        if (picUrl_top != "")
        {
            lastcoursePic_top.ImageUrl = picUrl_top;
            lastcoursePic_top.Visible = true;
        }

        
        if (picUrl_right != "")
        {
            lastcoursePic_right.ImageUrl = picUrl_right;
            lastcoursePic_right.Visible = true;
        }

        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        cmd.Connection.Dispose();
        cmd.Dispose();
        dbmanager.closeDB();
        Response.Redirect("course_image_edit.aspx");
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

