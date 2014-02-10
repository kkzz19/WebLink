using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class AddFriend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["OwnMemberID"] = SessionManager.GetUserID();
            SessionManager.RedirectBadLogin();
        }
    }
    protected void DropDownList1_OnDataBound(object sender, EventArgs e)
    {
        if (DropDownList1.Items.Count == 0)
        {
            title.Text = "There is nobody in your interests that you can add as a friend";
            DropDownList1.Visible = false;
            Button1.Visible = false;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int val = FriendManager.SendFriendRequest(SessionManager.GetUserID(), Int32.Parse(DropDownList1.SelectedValue), DateTime.Now);
        if (val == 0)
        {
            friendInviteStatus.ForeColor = Color.DarkGreen;
            friendInviteStatus.Text = "Friend invite sent to " + MemberManager.GetUserName(Int32.Parse(DropDownList1.SelectedValue));
            DropDownList1.DataBind();
        }
        else
        {
            friendInviteStatus.ForeColor = Color.Red;
            friendInviteStatus.Text = "Friend invite was not sent; a previous request was likely sent and unprocessed.";
        }
    }
    protected void backButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
}