using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class PostItem : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SessionManager.RedirectBadLogin();

            Session["PostTime"] = null;

            postItemTitle.Text = "Post an item for interest " + Request.QueryString["InterestName"];

            postLink.NavigateUrl = "~/InterestPages/InterestNews.aspx?InterestName=" + Request.QueryString["InterestName"] +
                "&InterestID=" + Request.QueryString["InterestID"];
        }
        
    }
    protected void submitPostButton_Click(object sender, EventArgs e)
    {
        if (Session["PostTime"] == null)
        {
            postStatus.ForeColor = Color.Green;
            postStatus.Text = "Message successfully posted<br/ >";
            postLink.Visible = true;
            Session["PostTime"] = DateTime.Now;
            string messageWithNewlines = messageBox.Text.Replace(Environment.NewLine, "<br />");    //Make it so that newlines are seen on the message board
            if (titleBox.Text == null)
                InterestManager.AddInterestPost(SessionManager.GetUserID(), Int32.Parse(Request.QueryString["InterestID"]), "", messageWithNewlines, DateTime.Now);
            else
                InterestManager.AddInterestPost(SessionManager.GetUserID(), Int32.Parse(Request.QueryString["InterestID"]), titleBox.Text, messageWithNewlines, DateTime.Now);
        }
        else
        {
            postStatus.ForeColor = Color.Red;
            postStatus.Text = "You must wait at least 10 seconds before your next post";
            if (DateTime.Now >= ((DateTime)Session["PostTime"]).AddSeconds(10))
                Session["PostTime"] = null;
        }
        
    }
    protected void backButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
}