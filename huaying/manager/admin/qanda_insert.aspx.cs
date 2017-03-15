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
    protected void Submit_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder("");
        string strSql1 = "select * from q_and_a";
        SqlDataReader reader = SqlHelper.ExecuteReader(strSql1);
        while (reader.Read())
        {
            Response.Write(reader["answer"].ToString().Trim());
        }
        //Response.Write(FCKeditor1.Value.ToString().Trim());
    }
    protected void Submit_Click2(object sender, EventArgs e)
    {
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("INSERT INTO q_and_a ([q_order],[question],[answer])"
        + "VALUES(@q_order,@question,@answer)");
        cmd.Parameters.AddWithValue("@q_order", TextBox2.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@question", TextBox1.Text.ToString().Trim());
        cmd.Parameters.AddWithValue("@answer", FCKeditor1.Value.ToString().Trim());
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        cmd.Connection.Dispose();
        cmd.Dispose();
        dbmanager.closeDB();
        Response.Redirect("qanda_edit.aspx");
    }
}