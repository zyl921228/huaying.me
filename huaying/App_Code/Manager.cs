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
/// <summary>
/// Summary description for Manager
/// </summary>
public class Manager
{

    private int _id;
    private String _username;
    private String _password;
    private int _roleId;
    private String _roleName;
    private String _addTime;
    private String _adder;
    private bool _IsValid;

    public int id
    {
        get { return this._id; ; }
        set { this._id = value; }
    }
    public String managerName
    {
        get { return this._username; }
        set { this._username = value; }
    }
    public String password
    {
        get { return this._password; }
        set { this._password = value; }
    }
    public int roleId
    {
        get { return this._roleId; }
        set { this._roleId = value; }
    }
    public String roleName
    {
        get { return this._roleName; }
        set { this._roleName = value; }
    }
    public String addTime
    {
        get { return this._addTime; }
        set { this._addTime = value; }
    }
    public String adder
    {
        get { return this._adder; }
        set { this._adder = value; }
    }
    public bool IsValid
    {
        get
        {
            return _IsValid;
        }
    }
    public Manager()
    {

    }
    public bool Check(string managerName, string managerPsw)
    {
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("SELECT * FROM admin WHERE UserName='" + managerName + "'and Password='" + managerPsw + "'");
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();
            _id = int.Parse(reader["id"].ToString().Trim());
            _IsValid = true;
            _roleId = int.Parse(reader["roleId"].ToString().Trim());
            _adder = reader["adder"].ToString();
            _roleName = reader["rolename"].ToString().Trim();
            _username = reader["username"].ToString().Trim();
            //UserId = int.Parse(reader["id"].ToString().Trim());
            //nroleid = int.Parse(reader["roleId"].ToString().Trim());
            reader.Close();
            cmd.Connection.Close();
            cmd.Connection.Dispose();
            cmd.Dispose();
            return true;
        }
        else
        {
            return false;
        }
    }
    public bool IsExistUser(string strUsername)
    {
        sqlManager dbmanager = sqlManager.createInstance();
        dbmanager.connectDB();
        SqlCommand cmd = dbmanager.getcmd("SELECT userid FROM webuser WHERE username='" + strUsername + "'");
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            cmd.Connection.Close();
            cmd.Connection.Dispose();
            cmd.Dispose();
            dbmanager.closeDB();
            return true;
        }
        else
        {
            dbmanager.closeDB();
            return false;
        }
    }
    public bool CheckPassword(string newPassword, int eid)
    {
        string strOldPassword = "";
        newPassword = Common.getMD5Code(newPassword);
        sqlManager dbmanager = sqlManager.createInstance();
        try
        {
            dbmanager.connectDB();
            //SqlCommand cmd = dbmanager.getcmd("UPDATE projects SET [newsTitle]=@newstitle,[newsContent]=@NewsContent,[typeid]=@typeid,[version]=@version,[author]=@author,[addtime]= #" + dtNow + "# WHERE [newsid]=" + newsid);
            string sql = "select * from admin where id= " + eid;
            SqlCommand cmd = dbmanager.getcmd(sql);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                strOldPassword = reader["password"].ToString();
            }
            reader.Close();
            if (newPassword.ToLower() == strOldPassword.ToLower())
            {
                cmd.Connection.Close();
                cmd.Connection.Dispose();
                cmd.Dispose();
                return true;
            }
            else
            {
                cmd.Connection.Close();
                cmd.Connection.Dispose();
                cmd.Dispose();
                return false;
            }
        }
        catch
        {
            dbmanager.closeDB();
            return false;
        }
    }
    //ÐÞ¸ÄÃÜÂë  
    public bool modifyPasswordByeid(string newPassword, int eid)
    {
        newPassword = Common.getMD5Code(newPassword);
        sqlManager dbmanager = sqlManager.createInstance();
        try
        {
            dbmanager.connectDB();
            //SqlCommand cmd = dbmanager.getcmd("UPDATE projects SET [newsTitle]=@newstitle,[newsContent]=@NewsContent,[typeid]=@typeid,[version]=@version,[author]=@author,[addtime]= #" + dtNow + "# WHERE [newsid]=" + newsid);
            string sql = "UPDATE admin SET [password]=@password where id= " + eid;
            SqlCommand cmd = dbmanager.getcmd(sql);
            cmd.Parameters.AddWithValue("@password", newPassword);
            //cmd.ExecuteNonQuery();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            cmd.Connection.Dispose();
            cmd.Dispose();
            return true;
        }
        catch
        {
            dbmanager.closeDB();
            return false;
        }
    }
}
