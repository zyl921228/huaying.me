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
    private int tea_id;
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

        tea_id = int.Parse(Request.QueryString["id"]);


        //SqlDataSource1.SelectCommand = "SELECT * FROM q_and_a";
        if (!IsPostBack)
        {
            sqlManager dbmanager = sqlManager.createInstance();
            dbmanager.connectDB();
            SqlCommand cmd = dbmanager.getcmd("select * from teachers where id=" + tea_id);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                TextBox1.Text = reader["name"].ToString().Trim();
                TextBox2.Text = reader["info1"].ToString().Trim();
                TextBox4.Text = reader["info2"].ToString().Trim();
                TextBox3.Text = reader["t_order"].ToString().Trim();
                FCKeditor_bottom.Value = reader["detail_bottom"].ToString().Trim();
                FCKeditor_right.Value = reader["detail_right"].ToString().Trim();
                String picUrl = reader["picpath"].ToString().Trim();
                if (picUrl != "")
                {
                    lastteacherPic.ImageUrl = picUrl;
                    lastteacherPic.Visible = true;
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
        String teaName = TextBox1.Text.ToString().Trim();
        String teaInfo1 = TextBox2.Text.ToString().Trim();
        String teaInfo2 = TextBox4.Text.ToString().Trim();
        String picUrl = Common.getUrl("/images/upload_files/teachers/", teacherPic);
        int teaOrder = Convert.ToInt32(TextBox3.Text.ToString().Trim());
        String detail_bottom = FCKeditor_bottom.Value.ToString().Trim();
        String detail_right = FCKeditor_right.Value.ToString().Trim();
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();



        SqlCommand cmd = dbmanager.getcmd("select [picpath] from teachers where [id]=" + tea_id);
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



        cmd = dbmanager.getcmd("UPDATE teachers SET [name]=@name,[info1]=@info1,[info2]=@info2,[picpath]=@picpath,[t_order]=@t_order,[detail_bottom]=@detail_bottom,[detail_right]=@detail_right WHERE [id]=" + tea_id);
        cmd.Parameters.AddWithValue("@name", teaName);
        cmd.Parameters.AddWithValue("@info1", teaInfo1);
        cmd.Parameters.AddWithValue("@info2", teaInfo2);
        cmd.Parameters.AddWithValue("@picpath", picUrl);
        cmd.Parameters.AddWithValue("@t_order", teaOrder);
        cmd.Parameters.AddWithValue("@detail_bottom", detail_bottom);
        cmd.Parameters.AddWithValue("@detail_right", detail_right);
        if (picUrl != "")
        {
            lastteacherPic.ImageUrl = picUrl;
            lastteacherPic.Visible = true;
        }
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        cmd.Connection.Dispose();
        cmd.Dispose();
        dbmanager.closeDB();
        Response.Redirect("teachers_edit.aspx");
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