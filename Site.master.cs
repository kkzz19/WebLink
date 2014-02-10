using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(Request.RawUrl != SessionManager.GetTopPage())
                SessionManager.PushPage(Request.RawUrl);
            //Response.Write(SessionManager.PrintPageStack());
        }
        if(ConfigurationManager.AppSettings["Debug"] == "1")
            Response.Write(SessionManager.GetUserID());
        if (SessionManager.IsAdmin())
        {
            LoginView1.FindControl("adminLink").Visible = true;
            LoginView1.FindControl("adminLabel").Visible = true;
        }
    }
    protected void clearSession_Click(object sender, EventArgs e)
    {
        //Used for debugging only. Remove this button in final product
        Session.Clear();
    }

    public string SetLogoutText()
    {
        string username = SessionManager.GetUserProfile().VisibleUserName;
        
        return "<span Font-Size = 'Small'>(Logged in as " + username + ")</span>" + "<br/>Log Out";

    }

}
