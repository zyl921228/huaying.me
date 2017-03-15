using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class manage_right : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!Session["security"].Equals("safe"))
            {
                Response.Write("<script language='javascript'>window.parent.location.href='default.aspx'</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script language='javascript'>window.parent.location.href='default.aspx'</script>");

        }

        if(!IsPostBack)
        {
            showMachineInfo();
        }
    }
    private void showMachineInfo()
    {
        HttpBrowserCapabilities b = Request.Browser;
        lblweb.Text = b.Type + "," + b.Version;
        lblleixing.Text = Page.Server.MachineName;
        //lblwldz.Text = Page.Server;
        lblip.Text = Request.ServerVariables["LOCAL_ADDR"];
        lblos.Text = Environment.OSVersion.ToString();
        lblcpu.Text = Environment.GetEnvironmentVariable("NUMBER_OF_PROCESSORS");
        lblpath.Text = Request.PhysicalApplicationPath;
        lblport.Text = Request.ServerVariables["SERVER_PORT"];
        lblnet.Text = ".NETΩ‚ Õ“˝«Ê∞Ê±æ£∫" + ".NET CLR" + Environment.Version.Major + "." + Environment.Version.Minor + "." + Environment.Version.Build + "." + Environment.Version.Revision;
        lbliis.Text = Request.ServerVariables["Server_SoftWare"].ToString();
        lblcpuclass.Text = Environment.GetEnvironmentVariable("PROCESSOR_IDENTIFIER");
        lbluser.Text = Request.ServerVariables["Remote_Addr"];
        lblxieyi.Text = Request.ServerVariables["Server_Protocol"];
        lblcputime.Text = ((TimeSpan)System.Diagnostics.Process.GetCurrentProcess().TotalProcessorTime).TotalSeconds.ToString("N0");

        lbldomain.Text = Request.Url.Host;
        lblclientName.Text = System.Net.Dns.GetHostName();
        lblchaoshi.Text = (Server.ScriptTimeout / 1000).ToString() + "√Î";
        lblshijian.Text = DateTime.Now.ToString();
        lblsession.Text = Session.Contents.Count.ToString();

        lblclientos.Text = Request.Browser.Platform;

        lblxunineicun.Text = (Environment.WorkingSet / 1024).ToString() + "M";


        //lblneicun.Text = GetAspNetN();
    }
}
