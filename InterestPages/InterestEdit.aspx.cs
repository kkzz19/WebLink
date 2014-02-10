using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class InterestEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            SessionManager.RedirectBadLogin();

        //Response.Write(SessionManager.GetUserID());
        Session["MemberID"] = SessionManager.GetUserID();
    }

    protected void chooseCategoryButton_OnItemsChanged(object sender, EventArgs e)
    {
        if (categoryList.SelectedItem != null)
        {
            Session["SelectedCategoryID"] = categoryList.SelectedValue;
            addInterestButton.DataBind();
        }
    }
    protected void addInterestButton_Click(object sender, EventArgs e)
    {
        if (interestList.SelectedItem != null)
        {
            int val = InterestManager.AddMemberToInterest(SessionManager.GetUserID(), Int32.Parse(interestList.SelectedValue), DateTime.Now);

            //Response.Write("Val = " + val.ToString());

            if (val == 0)
            {
                interestAddSuccFail.ForeColor = Color.Green;
                interestAddSuccFail.Text = "Interest '" + interestList.SelectedItem.ToString() + "' successfully added";
                memberInterestList.DataBind();
            }
            else
            {
                interestAddSuccFail.ForeColor = Color.Red;
                interestAddSuccFail.Text = "You already have '" + interestList.SelectedItem.ToString() + "' as an interest";
            }
        }
        else
        {

            interestAddSuccFail.ForeColor = Color.Red;
            interestAddSuccFail.Text = "No interest selected";
        }
    }
    protected void deleteInterestButton_Click(object sender, EventArgs e)
    {
        if (memberInterestList.SelectedItem != null)
        {
            interestDeleteSuccFail.ForeColor = Color.Green;
            InterestManager.DeleteMemberInterest(SessionManager.GetUserID(), Int32.Parse(memberInterestList.SelectedValue), DateTime.Now);
            interestDeleteSuccFail.Text = "Interest '" + memberInterestList.SelectedItem.ToString() + "' successfully deleted";
            memberInterestList.DataBind();
        }
        else
        {
            interestDeleteSuccFail.ForeColor = Color.Red;
            interestDeleteSuccFail.Text = "No interest selected";
        }
    }

    protected void backButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
}