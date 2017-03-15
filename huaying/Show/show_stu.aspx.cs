using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Show_show_stu : System.Web.UI.Page
{
    private int stu_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        showDetail();
    }
    private void showDetail()
    {
        stu_id = int.Parse(Request.QueryString["id"]);

        if (!IsPostBack)
        {
            sqlManager dbmanager = sqlManager.createInstance();
            dbmanager.connectDB();
            SqlCommand cmd = dbmanager.getcmd("select * from students where id=" + stu_id);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                StringBuilder sb_bottom = new StringBuilder("");
                StringBuilder sb_right = new StringBuilder("");
                sb_bottom.Append(reader["detail_bottom"].ToString().Trim());
                sb_right.Append(reader["detail_right"].ToString().Trim());
                ltlbottom.Text = sb_bottom.ToString();
                ltlright.Text = sb_right.ToString();
                String picUrl = reader["picpath"].ToString().Trim();
                if (picUrl != "")
                {
                    laststudentPic.ImageUrl = picUrl;
                    laststudentPic.Visible = true;
                }
            }
            reader.Close();
            cmd.Connection.Close();
            cmd.Connection.Dispose();
            dbmanager.closeDB();
        }

    }
}