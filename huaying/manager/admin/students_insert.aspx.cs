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
        String stuName = TextBox1.Text.ToString().Trim();
        String stuInfo = TextBox2.Text.ToString().Trim();
        String picUrl = Common.getUrl("/images/upload_files/students/", studentPic);
        int stuOrder = Convert.ToInt32(TextBox3.Text.ToString().Trim());
        String detail_bottom = FCKeditor_bottom.Value.ToString().Trim();
        String detail_right = FCKeditor_right.Value.ToString().Trim();
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("INSERT INTO students ([name],[info],[picpath],[s_order],[detail_bottom],[detail_right])"
        + "VALUES(@name,@info,@picpath,@s_order,@detail_bottom,@detail_right)");
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
}