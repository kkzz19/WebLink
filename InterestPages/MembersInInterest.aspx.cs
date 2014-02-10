using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InterestPages_MembersInInterest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SessionManager.RedirectBadLogin();
            titleLabel.Text = "Members for interest " + Request.QueryString["InterestName"];
        }
    }
    protected void GridView1_OnRowDataBound(GridViewRowEventArgs e)
    {
        if (GridView1.Rows.Count == 0)
        {
            noMembersLabel.Visible = true;
            GridView1.Visible = false;
        }
        else
        {
            noMembersLabel.Visible = false;
            GridView1.Visible = true;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
}