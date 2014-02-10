using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Friends_FriendInvitesReceived : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["OwnMemberID"] = SessionManager.GetUserID();
            SessionManager.RedirectBadLogin();

        }
    }

    protected void Repeater1_OnItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count == 0)
        {
            noInvites.Visible = true;
            Repeater1.Visible = false;
        }
        else
        {
            noInvites.Visible = false;
            Repeater1.Visible = true;
        }
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            int senderID = (int)dv[i]["MemberA_ID"];
            if (((Button)e.CommandSource).ID == "accept" && e.Item.ItemIndex == i)
            {
                friendListRedirect.Visible = true;
                status.ForeColor = Color.DarkGreen;
                status.Text = "Successfully added friend " + (string)dv[i]["Visibleusername"];
                FriendManager.AcceptOrRejectRequest(senderID, SessionManager.GetUserID(), DateTime.Now, 1, SessionManager.GetUserID());
                Repeater1.DataBind();
            }
            else if (((Button)e.CommandSource).ID == "refuse" && e.Item.ItemIndex == i)
            {
                status.ForeColor = Color.Red;
                status.Text = "You have refused the request from " + (string)dv[i]["Visibleusername"];
                FriendManager.AcceptOrRejectRequest(senderID, SessionManager.GetUserID(), DateTime.Now, 0, SessionManager.GetUserID());
                Repeater1.DataBind();
            }
                
        }
    }

    protected void backButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
}