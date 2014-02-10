using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class AdminPages_AdminInterest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SessionManager.RedirectNonAdmin();
            interestEditTitle.Text = "Edit interests for the category '" + Request.QueryString["CategoryName"] + "'";
            addInterestLabel.Text = "Add an interest for the category '" + Request.QueryString["CategoryName"] + "'";
        }
        else
        {
            intAddSuccessFail.Text = "";
            deleteMessage.Text = "";
        }
    }

    protected void Repeater1_OnItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count == 0)
        {
            noInterests.Visible = true;
            Repeater1.Visible = false;
        }
        else
        {
            noInterests.Visible = false;
            Repeater1.Visible = true;
        }
    }

    protected void addInterestButton_Click(object sender, EventArgs e)
    {
        int res = InterestManager.AddInterest(addCategory.Text, addDesc.Text, Int32.Parse(Request.QueryString["CategoryID"]), DateTime.Now, SessionManager.GetUserID());
        if (res > 0)
        {
            intAddSuccessFail.ForeColor = Color.Red;
            intAddSuccessFail.Text = "Interest already exists, not added";
        }
        else
        {
            intAddSuccessFail.ForeColor = Color.DarkGreen;
            intAddSuccessFail.Text = "Interest " + addCategory.Text + " successfully added";
            Repeater1.DataBind();
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            RepeaterItem ri = Repeater1.Items[i];

            Label cb = ri.FindControl("InterestTableName") as Label;
            Label iID = ri.FindControl("InterestIDName") as Label;

            if (e.Item.ItemIndex == i)
            {
                int interestID = Int32.Parse(iID.Text);

                if (((Button)e.CommandSource).ID == "deleteInterest")
                {
                    InterestManager.RemoveInterest(interestID, DateTime.Now, SessionManager.GetUserID());
                    deleteMessage.ForeColor = Color.Red;
                    deleteMessage.Text = "Successfully deleted interest " + cb.Text;
                    Repeater1.DataBind();
                }
                
            }
        }
    }


    protected void backButton_Click(object sender, EventArgs e)
    {

    }
    protected void DetailsView1_PageIndexChanging1(object sender, DetailsViewPageEventArgs e)
    {

    }
    protected void interestList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}