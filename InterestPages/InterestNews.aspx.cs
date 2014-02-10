using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InterestNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Request.QueryString["InterestName"]);
        //Response.Write(Request.QueryString["InterestID"]);
        if (!IsPostBack)
        {
            SessionManager.RedirectBadLogin();
            interestNewsTitle.Text = "Posts for interest " + Request.QueryString["InterestName"];
        }
    }
    protected void Repeater1_OnItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count == 0)
        {
            noPosts.Visible = true;
            Repeater1.Visible = false;
        }
        else
        {
            noPosts.Visible = false;
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

    public bool ShowTitle(string msg)
    {
        if (msg == null || msg == "")
            return false;
        else
            return true;
    }

    protected void postItem_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InterestPages/PostItem.aspx?InterestName=" + Request.QueryString["InterestName"] +
            "&InterestID=" + Request.QueryString["InterestID"]);
    }
    protected void viewMembersButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InterestPages/MembersInInterest.aspx?InterestName=" + Request.QueryString["InterestName"] +
            "&InterestID=" + Request.QueryString["InterestID"]);
    }
}