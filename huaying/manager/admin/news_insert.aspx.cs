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
        String strStarttime = "";
        if (strStarttime == "")
        {
            strStarttime = DateTime.Now.ToString("G");
        }
        DateTime dt = Convert.ToDateTime(strStarttime);

        String picUrl = Common.getUrl("/images/upload_files/news/", newsPic);
        String picUrl_w = Common.getUrl("/images/upload_files/news_w/", newsPic_w);
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("INSERT INTO news ([title],[intro],[picpath],[picpath_w],[date],[detail],[type],[sub_type],[tags],[source],[hittime])"
        + "VALUES(@title,@intro,@picpath,@picpath_w,@date,@detail,@type,@sub_type,@tags,@source,@hittime)");
        cmd.Parameters.AddWithValue("@title", TextBox1.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@intro", TextBox2.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@picpath", picUrl);
        cmd.Parameters.AddWithValue("@picpath_w", picUrl_w);
        cmd.Parameters.AddWithValue("@date", strStarttime);
        cmd.Parameters.AddWithValue("@detail", FCKeditor1.Value.ToString().Trim());
        cmd.Parameters.AddWithValue("@type", Convert.ToInt32(DropDownList1.SelectedValue));
        cmd.Parameters.AddWithValue("@sub_type", Convert.ToInt32(DropDownList2.SelectedValue));
        cmd.Parameters.AddWithValue("@tags", TextBox3.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@source", TextBox4.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@hittime", 0);
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
}