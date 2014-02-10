using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class InterestPages_SearchInterest : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            SessionManager.RedirectBadLogin();
    }

    protected void addSearchInterest_Click(object sender, EventArgs e)
    {
        if (searchInterestList.SelectedItem != null)
        {
            int val = InterestManager.AddMemberToInterest(SessionManager.GetUserID(), Int32.Parse(searchInterestList.SelectedValue), DateTime.Now);

            if (val == 0)
            {
                searchInterestAddSuccFail.ForeColor = Color.Green;
                searchInterestAddSuccFail.Text = "Interest '" + searchInterestList.SelectedItem.ToString() + "' successfully added";
            }
            else
            {
                searchInterestAddSuccFail.ForeColor = Color.Red;
                searchInterestAddSuccFail.Text = "You already have '" + searchInterestList.SelectedItem.ToString() + "' as an interest";
            }
        }
        else
        {
            searchInterestAddSuccFail.ForeColor = Color.Red;
            searchInterestAddSuccFail.Text = "No interest selected";
        }
    }
 
    protected void searchInterestList_OnDataBound(object sender, EventArgs e)
    {
        noMatchesFound.Text = "";
        if (searchInterestList.Items.Count < 1 && searchInterestBox.Text != "" && searchInterestBox.Text != null)
        {
            noMatchesFound.Text = "No matches found for term &ldquo;" + searchInterestBox.Text + "&rdquo;";
        }
        else if (searchInterestBox.Text == "" || searchInterestBox.Text == null)
        {
            if(IsPostBack)
                noMatchesFound.Text = "Enter in a search term";
        }
    }
    protected void backButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
}