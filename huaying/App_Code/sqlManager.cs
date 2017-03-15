using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;



/// <summary>
/// Summary description for sqlManager
/// </summary>
/// 
public class sqlManager : Page
    {

        private static sqlManager p = null;
        private SqlConnection conn;
        private SqlCommand cmd;

        private sqlManager()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static sqlManager createInstance()
        {
            if (p == null)
            {
                p = new sqlManager();
            }
            return p;

        }
        //Access数据库连接方法
        public String getConnectionStr()
        {
            String constr = WebConfigurationManager.ConnectionStrings["MeconnectionString"].ToString();
            return constr;
        }
        public void connectDB()
        {
            string connstr = getConnectionStr();
            conn = new SqlConnection(connstr);
            conn.Open();
        }
        public SqlCommand getcmd(String sql)
        {
            connectDB();
            cmd = new SqlCommand(sql, conn);
            return cmd;
        }
        public DataSet getDs(String sql)
        {
            DataSet ds = new DataSet();
            try
            {
                connectDB();
                SqlDataAdapter adaper = new SqlDataAdapter(sql, getConnectionStr());
                adaper.Fill(ds);
                adaper.Dispose();
                adaper = null;
            }
            catch
            {
                ds = null;
            }
            finally
            {
                closeDB();
            }
            return ds;

        }
        public void closeDB()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
                conn.Dispose();
            }
        }
    }

