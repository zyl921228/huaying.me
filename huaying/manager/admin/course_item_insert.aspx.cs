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
        String cTime = TextBox2.Text.ToString().Trim();
        String eTime = TextBox3.Text.ToString().Trim();
        String duration = TextBox4.Text.ToString().Trim();
        int locationID = int.Parse(DropDownList1.SelectedValue);
        String circum = TextBox5.Text.ToString().Trim();
        bool isFull = CheckBox1.Checked;
        String picUrl = Common.getUrl("/images/upload_files/courseitem/", courseitemPic);
        int type = Convert.ToInt32(DropDownList2.SelectedValue);
        string filter = DDL_a.SelectedValue + DDL_b.SelectedValue + DDL_c.SelectedValue + DDL_d.SelectedValue + DDL_e.SelectedValue + DDL_f.SelectedValue;
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("INSERT INTO course_item ([name],[ctime],[etime],[duration],[location],[circum],[isfull],[picpath],[type],[filter])"
        + "VALUES(@name,@ctime,@etime,@duration,@location,@circum,@isfull,@picpath,@type,@filter)");
        cmd.Parameters.AddWithValue("@name", courseName);
        cmd.Parameters.AddWithValue("@ctime", cTime);
        cmd.Parameters.AddWithValue("@etime", eTime);
        cmd.Parameters.AddWithValue("@duration", duration);
        cmd.Parameters.AddWithValue("@location", locationID);
        cmd.Parameters.AddWithValue("@picpath", picUrl);
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
}