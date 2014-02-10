using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InterestPages_SelectInterestPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            SessionManager.RedirectBadLogin();
    }

    protected void Repeater1_OnItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count == 0)
        {
            selectInterestPostTitle.Text = "You have no interests to post in.";
            Repeater1.Visible = false;
        }
        else
        {
            selectInterestPostTitle.Text = "Select one of your interests to post in";
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