<%@ WebHandler Language="C#" Class="Ajax_post" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class Ajax_post : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
                   try 
            {
                string _name = context.Request["name"] ?? "";
                string _phone = context.Request["phone"] ?? "";
                string _email = context.Request["email"] ?? "";
                string _course = context.Request["course"] ?? "";
                string _recommend = context.Request["recommend"] ?? "";
                string _question = context.Request["question"] ?? "";
                string _askwhom = context.Request["askwhom"] ?? "";
                int _type = Convert.ToInt32(context.Request["type"]);
                String _strStarttime = "";
                if (_strStarttime == "")
                {
                    _strStarttime = DateTime.Now.ToString("G");
                }
                       
                sqlManager dbmanager = sqlManager.createInstance();
                dbmanager.connectDB();
                SqlCommand cmd = dbmanager.getcmd("INSERT INTO guest_info ([name],[phone],[email],[course],[recommend],[question],[askwhom],[type],[date])" + "VALUES(@name,@phone,@email,@course,@recommend,@question,@askwhom,@type,@date)");
                cmd.Parameters.AddWithValue("@name", _name);
                cmd.Parameters.AddWithValue("@phone", _phone);
                cmd.Parameters.AddWithValue("@email", _email);
                cmd.Parameters.AddWithValue("@course", _course);
                cmd.Parameters.AddWithValue("@recommend", _recommend);
                cmd.Parameters.AddWithValue("@question", _question);
                cmd.Parameters.AddWithValue("@askwhom", _askwhom);
                cmd.Parameters.AddWithValue("@type", _type);
                cmd.Parameters.AddWithValue("@date", _strStarttime);
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                cmd.Connection.Dispose();
                cmd.Dispose();
                dbmanager.closeDB();
                context.Response.Write(_name+"您好！");
            } 
            catch (Exception ex) 
            { 
                context.Response.Write(ex.Message); 
            }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}