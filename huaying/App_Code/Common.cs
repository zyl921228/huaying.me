using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for common
/// </summary>
public static class Common
{
    public static string strMsg = string.Empty;
    public static string strVersionChinese = "chinese";
    public static string strVersionEnglish = "english";

    private static string strLink = ConfigurationManager.AppSettings.Get("newaddress");
    public static string strSiteAddress = ConfigurationManager.AppSettings.Get("newaddress");
    public static string strWebsiteUrlEnglish = strLink + "English/";
    public static string strWebsiteUrlChinese = strLink + "";

    public static string strImgNormalSrc = ConfigurationManager.AppSettings.Get("imgpath");

    public static string strWebsiteUrl = ConfigurationManager.AppSettings.Get("newaddress");

    public static string strWebsiteAddrss = ConfigurationManager.AppSettings.Get("newaddress");

    public static string strAddtime = "CONVERT(varchar(10), DATEPART(yyyy, addtime)) + '-' + CONVERT(varchar(10), DATEPART(mm, addtime)) + '-' + CONVERT(varchar(10),DATEPART(dd, addtime)) as addtime";

    public static String getUrl(String path, FileUpload picUpload)
    {
        String picUrl ="";
        if (picUpload.HasFile)
        {
            String picPath=path;
            String picName = picUpload.FileName;
            picName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + picName.Substring(picName.IndexOf("."));
            picUrl = picPath + picName;

            String realPath = System.Web.HttpContext.Current.Server.MapPath(picUrl);
            picUpload.SaveAs(realPath);
            return picUrl;
        }
        return picUrl;
    }
    public static String getTrueUrl(String path, FileUpload picUpload)
    {
        String picUrl = "";
        if (picUpload.HasFile)
        {
            String picPath = path;
            String picName = picUpload.FileName;
           // picName = picName.Substring(picName.IndexOf("."));
            picUrl = picPath + picName;

            String realPath = System.Web.HttpContext.Current.Server.MapPath(picUrl);
            picUpload.SaveAs(realPath);
            return picUrl;
        }
        return picUrl;
    }
    //textarea显示
    public static string htmlencode1(string fString)
    {
        string strReturn = "";
        if (fString == "")
        {
            return strReturn;
        }
        else
        {
            fString = fString.Replace("&gt;", ">");
            fString = fString.Replace("&lt;", "<");
            fString = fString.Replace("&nbsp;", ((char)32).ToString());
            fString = fString.Replace("</p><p>", ((char)10).ToString() + ((char)39).ToString());
            fString = fString.Replace("<br>", ((char)10).ToString());
            return fString;
        }
    }
    //页面显示
    public static string htmlencode2(string fString)
    {
        string strReturn = "";
        if (fString == "")
        {
            return strReturn;
        }
        else
        {
            fString = fString.Replace(">", "&gt;");
            fString = fString.Replace("<", "&lt;");
            fString = fString.Replace(((char)32).ToString(), "&nbsp;");
            fString = fString.Replace(((char)10).ToString() + ((char)39).ToString(), "</p><p>");
            fString = fString.Replace(((char)10).ToString(), "<br>");
            return fString;
        }
    }
    public static bool getFiletyle(FileUpload picUpload,string strCons)
    {
        
        if(strCons == "anything")
        {
            string[] ArrExtension = { ".jpg", ".jpeg", ".gif", ".pdf", ".rar", ".zip", ".doc" };
            if (picUpload.HasFile)
            {
                String StrExtension = System.IO.Path.GetExtension(picUpload.FileName);
                for (int i = 0; i < ArrExtension.Length; i++)
                {
                    if (StrExtension.Equals(ArrExtension[i]))
                    {
                        return true;
                    }
                }
                return false;
            }
            else
            {
                return true;
            }
        }
        else if(strCons == "docpdf")
        {
            string[] ArrExtension = { ".pdf", ".doc" };
            if (picUpload.HasFile)
            {
                String StrExtension = System.IO.Path.GetExtension(picUpload.FileName);
                for (int i = 0; i < ArrExtension.Length; i++)
                {
                    if (StrExtension.Equals(ArrExtension[i]))
                    {
                        return true;
                    }
                }
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            string[] ArrExtension = { ".jpg", ".jpeg", ".gif"};
            if (picUpload.HasFile)
            {
                String StrExtension = System.IO.Path.GetExtension(picUpload.FileName);
                for (int i = 0; i < ArrExtension.Length; i++)
                {
                    if (StrExtension.Equals(ArrExtension[i]))
                    {
                        return true;
                    }
                }
                return false;
            }
            else
            {
                return true;
            }
        }
       
    }
    public static String getBigPicUrl(String path, FileUpload picUpload)
    {
        String picUrl = "";
        if (picUpload.HasFile)
        {
            String picPath = path;
            String picName = picUpload.FileName;
            picName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + picName.Substring(picName.IndexOf("."));
            picUrl = picPath + picName;

            String realPath = System.Web.HttpContext.Current.Server.MapPath(picUrl);
            picUpload.SaveAs(realPath);
            return picUrl;
        }
        return picUrl;
    }
    public static bool UploadMaterial(String path, FileUpload picUpload, out  String materialName)
    {
        String materilPath = "";
        if (picUpload.HasFile)
        {
            String strMaterialPath = path;
            String strMaterialName = picUpload.FileName;
            materilPath = path + strMaterialName;
            materialName = strMaterialName;
            String realPath = System.Web.HttpContext.Current.Server.MapPath(materilPath);
            picUpload.SaveAs(realPath);
            return true;
        }
        else
        {
            materialName = "";
            return false;
        }

    }
    public static string getChineseWeek()
    {
        string weekstr = DateTime.Now.DayOfWeek.ToString();
        switch (weekstr)
        {
            case "Monday": weekstr = "星期一"; break;
            case "Tuesday": weekstr = "星期二"; break;
            case "Wednesday": weekstr = "星期三"; break;
            case "Thursday": weekstr = "星期四"; break;
            case "Friday": weekstr = "星期五"; break;
            case "Saturday": weekstr = "星期六"; break;
            case "Sunday": weekstr = "星期日"; break;
        }
        return weekstr;
    }
    public static string changeDrop(string str)
    {
        if (str == "chinese")
        {
            return "1";
        }
        if (str == "english")
        {
            return "2";
        }
        else
        {
            return "1";
        }
    }
    public static string changeClass(string str)
    {
        if (str == "是")
        {
            return "1";
        }
        if(str == "否")
        {
            return "2";
        }
        else
        {
            return "1";
        }
    }
    public static void ShowMessage(Page page, string text)
    {
        string script = @"<script type=""text/javascript"">alert(""" + text + @""");</script>";
        page.ClientScript.RegisterStartupScript(page.GetType(), text, script);
    }
    public static void ReturnPage(Page page, string text)
    {
        string script = @"<script>window.location.href='" + text + "'</script>";
        page.ClientScript.RegisterStartupScript(page.GetType(), text, script);
    }
    public static String getMD5Code(String str)
    {
        if (str.Trim() == "")
        {
            return "";
        }
        else
        {
            return FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5");
        }
    }
    public static string trimString(string str, int len)
    {
        if(str.Length>len)
        {
            str=str.Substring(0, len) + "...";
        }
        return str;
    }
    //判断中文字长度
    public static string GetSubString(string str, int length)
    {
        string temp = str;
        int j = 0;
        int k = 0;
        for (int i = 0; i < temp.Length; i++)
        {
            if (Regex.IsMatch(temp.Substring(i, 1), @"[\u4e00-\u9fa5]+"))
            {
                j += 1;
            }
            else
            {
                j += 2;
            }
            if (j <= length)
            {
                k += 1;
            }
            if (j >= length)
            {
                return temp.Substring(0, k);
            }
        }
        return temp;
    }
    public static int Datadiff(DateTime DateTime1, DateTime DateTime2)
    {
        int ndateDiff = 0;
        TimeSpan ts1 = new TimeSpan(DateTime1.Ticks);
        TimeSpan ts2 = new TimeSpan(DateTime2.Ticks);
        ndateDiff = ts1.Subtract(ts2).Days;
        //TimeSpan ts = ts1.Subtract(ts2).Duration();
        //ndateDiff = int.Parse(ts.Days.ToString());
        return ndateDiff;
    }
    public static int Bool2Int(object obj)
    {
        if (Convert.ToBoolean(obj) == true)
            return 1;
        else
            return 0;
    }
}
