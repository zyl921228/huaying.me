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
    private int stu_id;
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

        stu_id = int.Parse(Request.QueryString["id"]);


        //SqlDataSource1.SelectCommand = "SELECT * FROM q_and_a";
        if (!IsPostBack)
        {
            sqlManager dbmanager = sqlManager.createInstance();
            dbmanager.connectDB();
            SqlCommand cmd = dbmanager.getcmd("select * from students where id=" + stu_id);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                TextBox1.Text = reader["name"].ToString().Trim();
                TextBox2.Text = reader["info"].ToString().Trim();
                TextBox3.Text = reader["s_order"].ToString().Trim();
                FCKeditor_bottom.Value = reader["detail_bottom"].ToString().Trim();
                FCKeditor_right.Value = reader["detail_right"].ToString().Trim();
                String picUrl = reader["picpath"].ToString().Trim();
                if (picUrl != "")
                {
                    laststudentPic.ImageUrl = picUrl;
                    laststudentPic.Visible = true;
                }
            }
            reader.Close();
            cmd.Connection.Close();
            cmd.Connection.Dispose();
            dbmanager.closeDB();
        }
    }

    protected void Submit_Click2(object sender, EventArgs e)
    {
        String stuName = TextBox1.Text.ToString().Trim();
        String stuInfo = TextBox2.Text.ToString().Trim();
        String picUrl = Common.getUrl("/images/upload_files/students/", studentPic);
        int stuOrder = Convert.ToInt32(TextBox3.Text.ToString().Trim());
        String detail_bottom = FCKeditor_bottom.Value.ToString().Trim();
        String detail_right = FCKeditor_right.Value.ToString().Trim();
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();



        SqlCommand cmd = dbmanager.getcmd("select [picpath] from students where [id]=" + stu_id);
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



        cmd = dbmanager.getcmd("UPDATE students SET [name]=@name,[info]=@info,[picpath]=@picpath,[s_order]=@s_order,[detail_bottom]=@detail_bottom,[detail_right]=@detail_right WHERE [id]=" + stu_id);
        cmd.Parameters.AddWithValue("@name", stuName);
        cmd.Parameters.AddWithValue("@info", stuInfo);
        cmd.Parameters.AddWithValue("@picpath", picUrl);
        cmd.Parameters.AddWithValue("@s_order", stuOrder);
        cmd.Parameters.AddWithValue("@detail_bottom", detail_bottom);
        cmd.Parameters.AddWithValue("@detail_right", detail_right);
        if (picUrl != "")
        {
            laststudentPic.ImageUrl = picUrl;
            laststudentPic.Visible = true;
        }
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        cmd.Connection.Dispose();
        cmd.Dispose();
        dbmanager.closeDB();
        Response.Redirect("students_edit.aspx");
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