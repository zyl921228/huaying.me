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
    private int course_item_id;
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

        course_item_id = int.Parse(Request.QueryString["id"]);






        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select * from course_item where id=" + course_item_id);
            while (reader.Read())
            {
                TextBox1.Text = reader["name"].ToString().Trim();
                TextBox2.Text = reader["ctime"].ToString().Trim();
                TextBox3.Text = reader["etime"].ToString().Trim();
                TextBox4.Text = reader["duration"].ToString().Trim();
                DropDownList1.SelectedValue = reader["location"].ToString().Trim();
                TextBox5.Text = reader["circum"].ToString().Trim();
                CheckBox1.Checked = (int.Parse(reader["isfull"].ToString().Trim())) == 1 ? true : false;
                String picUrl = reader["picpath"].ToString().Trim();
                if (picUrl != "")
                {
                    lastcourseitemPic.ImageUrl = picUrl;
                    lastcourseitemPic.Visible = true;
                }
                DropDownList2.SelectedValue = reader["type"].ToString().Trim();

                string filter_str = reader["filter"].ToString().Trim();

                if (filter_str.IndexOf('a') != -1)
                    DDL_a.SelectedValue = filter_str.Substring(filter_str.IndexOf('a'), 2);
                else
                    DDL_a.SelectedValue = "a0";

                if (filter_str.IndexOf('b') != -1)
                    DDL_b.SelectedValue = filter_str.Substring(filter_str.IndexOf('b'),2);
                else
                    DDL_b.SelectedValue = "b0";

                if (filter_str.IndexOf('c') != -1)
                    DDL_c.SelectedValue = filter_str.Substring(filter_str.IndexOf('c'), 2);
                else
                    DDL_c.SelectedValue = "c0";

                if (filter_str.IndexOf('d') != -1)
                    DDL_d.SelectedValue = filter_str.Substring(filter_str.IndexOf('d'), 2);
                else
                    DDL_d.SelectedValue = "d0";

                if (filter_str.IndexOf('e') != -1)
                    DDL_e.SelectedValue = filter_str.Substring(filter_str.IndexOf('e'), 2);
                else
                    DDL_e.SelectedValue = "e0";

                if (filter_str.IndexOf('f') != -1)
                    DDL_f.SelectedValue = filter_str.Substring(filter_str.IndexOf('f'), 2);
                else
                    DDL_f.SelectedValue = "f0";
            }
            reader.Close();
        }
    }

    protected void Submit_Click2(object sender, EventArgs e)
    {

        String picUrl = Common.getUrl("/images/upload_files/news/", courseitemPic);
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("select [picpath] from course_item where [id]=" + course_item_id);
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
        String cTime = TextBox2.Text.ToString().Trim();
        String eTime = TextBox3.Text.ToString().Trim();
        String duration = TextBox4.Text.ToString().Trim();
        int locationID = int.Parse(DropDownList1.SelectedValue);
        String circum = TextBox5.Text.ToString().Trim();
        bool isFull = CheckBox1.Checked;
        int type = Convert.ToInt32(DropDownList2.SelectedValue);
        string filter = DDL_a.SelectedValue + DDL_b.SelectedValue + DDL_c.SelectedValue + DDL_d.SelectedValue + DDL_e.SelectedValue + DDL_f.SelectedValue;

        cmd = dbmanager.getcmd("UPDATE course_item SET  [name]=@name,[ctime]=@ctime,[etime]=@etime,[duration]=@duration,[location]=@location,[circum]=@circum,[isfull]=@isfull,[picpath]=@picpath,[type]=@type,[filter]=@filter WHERE [id]=" + course_item_id);
        cmd.Parameters.AddWithValue("@name", courseName);
        cmd.Parameters.AddWithValue("@ctime", cTime);
        cmd.Parameters.AddWithValue("@etime", eTime);
        cmd.Parameters.AddWithValue("@duration", duration);
        cmd.Parameters.AddWithValue("@location", locationID);
        cmd.Parameters.AddWithValue("@circum", circum);
        cmd.Parameters.AddWithValue("@isfull", isFull);
        cmd.Parameters.AddWithValue("@picpath", picUrl);
        cmd.Parameters.AddWithValue("@type", type);
        cmd.Parameters.AddWithValue("@filter", filter);
        if (picUrl != "")
        {
            lastcourseitemPic.ImageUrl = picUrl;
            lastcourseitemPic.Visible = true;
        }
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        cmd.Connection.Dispose();
        cmd.Dispose();
        dbmanager.closeDB();
        Response.Redirect("course_item_edit.aspx");
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