using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manager_admin_qanda_update : System.Web.UI.Page
{
    private int qanda_id;
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

        qanda_id = int.Parse(Request.QueryString["id"]);


        //SqlDataSource1.SelectCommand = "SELECT * FROM q_and_a";
        if (!IsPostBack)
        {
            sqlManager dbmanager = sqlManager.createInstance();
            dbmanager.connectDB();
            SqlCommand cmd = dbmanager.getcmd("select * from q_and_a where id=" + qanda_id);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                TextBox1.Text = reader["question"].ToString().Trim();
                TextBox2.Text = reader["q_order"].ToString().Trim();
                FCKeditor1.Value = reader["answer"].ToString().Trim();
            }
            reader.Close();
            cmd.Connection.Close();
            cmd.Connection.Dispose();
            dbmanager.closeDB();
        }
        //hpkreturn.NavigateUrl = "EditNews.aspx?vid=" + strVersion + "&cid=" + ncid;
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("UPDATE q_and_a SET [q_order]=@q_order,[question]=@question,[answer]=@answer WHERE [id]=" + qanda_id);
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