using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editor : System.Web.UI.Page
{
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
    }

    protected void Submit_Click2(object sender, EventArgs e)
    {
        String courseName = TextBox1.Text.ToString().Trim();
        String courseFit = TextBox2.Text.ToString().Trim();
        String courseIntro = TextBox3.Text.ToString().Trim();
        String courseContent = TextBox4.Text.ToString().Trim();
        String courseCtime = TextBox5.Text.ToString().Trim();
        String picUrl = Common.getUrl("/images/upload_files/coursegroup/", coursegroupPic);
        int type = Convert.ToInt32(DropDownList1.SelectedValue);
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("INSERT INTO course_group ([name],[fit],[intro],[content],[ctime],[picpath],[type])"
        + "VALUES(@name,@fit,@intro,@content,@ctime,@picpath,@type)");
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
        Response.Redirect("students_edit.aspx");
    }
}