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
        String teaName = TextBox1.Text.ToString().Trim();
        String teaInfo1 = TextBox2.Text.ToString().Trim();
        String teaInfo2 = TextBox4.Text.ToString().Trim();
        String picUrl = Common.getUrl("/images/upload_files/teachers/", teacherPic);
        int teaOrder = Convert.ToInt32(TextBox3.Text.ToString().Trim());
        String detail_bottom = FCKeditor_bottom.Value.ToString().Trim();
        String detail_right = FCKeditor_right.Value.ToString().Trim();
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("INSERT INTO teachers ([name],[info1],[info2],[picpath],[t_order],[detail_bottom],[detail_right])"
        + "VALUES(@name,@info1,@info2,@picpath,@t_order,@detail_bottom,@detail_right)");
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
}