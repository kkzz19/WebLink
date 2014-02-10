using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InterestSelection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SessionManager.RedirectBadLogin();
            Session["MemberID"] = SessionManager.GetUserID();
        }
    }

    protected void Repeater1_OnItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count == 0)
        {
            Label1.Text = "You have no interests to view.";
            Repeater1.Visible = false;
        }
        else
        {
            Label1.Text = "Select one of your interests to view posts";
            Repeater1.Visible = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
}