using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class editor : System.Web.UI.Page
{
    private int keywords_id;
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

        keywords_id = int.Parse(Request.QueryString["id"]);

        if (!IsPostBack)
        {
            SqlDataReader reader = SqlHelper.ExecuteReader("select * from keywords where id=" + keywords_id);
            while (reader.Read())
            {
                TextBox1.Text = reader["name"].ToString().Trim();
                TextBox2.Text = reader["url"].ToString().Trim();
            }
            reader.Close();
        }

    }

    protected void Submit_Click2(object sender, EventArgs e)
    {
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("UPDATE keywords SET [name]=@name,[url]=@url WHERE [id]=" + keywords_id);
        cmd.Parameters.AddWithValue("@name", TextBox1.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@url", TextBox2.Text.ToString().Trim());
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        cmd.Connection.Dispose();
        cmd.Dispose();
        dbmanager.closeDB();
        Response.Redirect("keywords_edit.aspx");
    }
}