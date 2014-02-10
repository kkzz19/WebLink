using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["MemberID"] = SessionManager.GetUserID();
            Session["OwnMemberID"] = SessionManager.GetUserID();

            Profile myProfile = (Profile)Session["MemberProfile"];

            welcomeLabel.Text = "You are logged in as administrator " + myProfile.VisibleUserName;

            joinDateLabel.Text = "Joined " + myProfile.JoinDate.ToString();

            SessionManager.RedirectNonAdmin();

            DataView sentRequest = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            DataView receivedRequest = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            DataView unreadMessages = (DataView)messageData.Select(DataSourceSelectArguments.Empty);

            if (sentRequest.Count > 0)
            {
                Label4.Text = "You have " + sentRequest.Count + " pending friend invite(s) received.";
                HyperLink2.Visible = true;
            }
            if (receivedRequest.Count > 0)
            {
                Label3.Text = "You have " + receivedRequest.Count + " pending friend invite(s) sent.";
                HyperLink1.Visible = true;
            }
            if (unreadMessages.Count > 0)
            {
                unreadMessagesLabel.Text = "You have " + unreadMessages.Count + " unread message(s).";
                HyperLink3.Visible = true;
            }

        }
    }

    protected void Repeater1_OnItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count == 0)
        {
            Label2.Text = "You do not have any interests yet.";
            Repeater1.Visible = false;

            addInterestHyperlink.Visible = true;
        }
        else
        {
            Label2.Text = "Select one of your interests to view posts.";
            Repeater1.Visible = true;

            addInterestHyperlink.Visible = false;
        }
    }

    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            if (((Button)e.CommandSource).ID == "okButton" && e.Item.ItemIndex == i)
            {
                FriendManager.MarkAsRead((int)dv[i]["MemberA_ID"], (int)dv[i]["MemberB_ID"], (DateTime)dv[i]["RequestSendDate"]);
                Repeater2.DataBind();
            }
        }
    }

    protected string SetMessage(object arefusaldate, object astartdate, object aenddate)
    {
        bool enddate = (aenddate.ToString() != "");
        bool startdate = (astartdate.ToString() != "");
        bool refusaldate = (arefusaldate.ToString() != "");

        if (enddate == true)
        {
            return " has removed you from their friends list";
        }
        else if (startdate == true && refusaldate == false)
        {
            return " has accepted your friend request.";
        }
        else if (startdate == false && refusaldate == true)
        {
            return " has rejected your friend request.";
        }
        return "";

    }

}