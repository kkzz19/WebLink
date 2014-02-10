using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Account_PublicProfile : System.Web.UI.Page
{
    string ReturnNotSpecified(string str)
    {
        if (str == null || str == "")
        {
            return "(Not specified)";
        }
        else
            return str;
    }

    Profile user_profile;
    bool OwnProfile = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string user_name = Request.QueryString["Username"];

            OwnProfile = false;

            Session["OwnMemberID"] = SessionManager.GetUserID();
            Session["ProfileID"] = MemberManager.GetUserID(user_name);

            //Null means just use current member profile
            if (user_name == null || user_name == "" || user_name == SessionManager.GetUserProfile().VisibleUserName
                 || user_name == SessionManager.GetUserProfile().UserName)
            {
                OwnProfile = true;
                user_profile = SessionManager.GetUserProfile();
            }

            else
                user_profile = MemberManager.LoadFromDataBase(user_name);


            ChangeText();


            profileTitle.Text = user_profile.VisibleUserName + "'s profile";

            firstNameBox.Text = ReturnNotSpecified(user_profile.FirstName);
            middleInitialBox.Text = ReturnNotSpecified(user_profile.MiddleInitial);
            lastNameBox.Text = ReturnNotSpecified(user_profile.LastName);
            countryBox.Text = ReturnNotSpecified(user_profile.Country);
            postalBox.Text = ReturnNotSpecified(user_profile.PostalCode);
            cityBox.Text = ReturnNotSpecified(user_profile.City);
            addressBox.Text = ReturnNotSpecified(user_profile.Address);
            regionBox.Text = ReturnNotSpecified(user_profile.Region);
            homePhone1.Text = ReturnNotSpecified(user_profile.HomePhone);
            workPhone1.Text = ReturnNotSpecified(user_profile.WorkPhone);
            cellPhone1.Text = ReturnNotSpecified(user_profile.CellPhone);
            emailBox.Text = ReturnNotSpecified(user_profile.Email);

            if (user_profile.DateOfBirth != DateTime.MinValue)
                dateOfBirthBox.Text = user_profile.DateOfBirth.ToString("d");
            else
                dateOfBirthBox.Text = "(Not specified)";

            int gen = (int)user_profile.Gender;
            switch (gen)
            {
                case 0: genderBox.Text = "Male"; break;
                case 1: genderBox.Text = "Female"; break;
                case 2: genderBox.Text = "Not specified"; break;
            }

            int rank = (int)user_profile.MembershipLevel;

            switch (rank)
            {
                case 0: membershipLevelBox.Text = "Guest"; break;
                case 1: membershipLevelBox.Text = "Bronze"; break;
                case 2: membershipLevelBox.Text = "Silver"; break;
                case 3: membershipLevelBox.Text = "Gold"; break;
                case 4: membershipLevelBox.Text = "Platinum"; break;
            }
        }

    }



    //Change the label text and button text depending on context.
    protected void ChangeText()
    {
        DataView isFriendData = (DataView)IsFriendData.Select(DataSourceSelectArguments.Empty);
        DataView sentRequestData = (DataView)SentRequestData.Select(DataSourceSelectArguments.Empty);
        DataView receivedRequestData = (DataView)ReceivedRequestData.Select(DataSourceSelectArguments.Empty);

        //If this is your own profile:
        if (OwnProfile == true)
        {
            status.Text = "";
            button.Visible = false;
        }
            
        //If the person is your friend:
        else if (isFriendData.Count > 0)
        {
            status.Text = "You are friends with this member";
            button.Visible = true;
            button.Text = "Drop this friend";
        }

        //If the person has sent you a request:
        else if (sentRequestData.Count > 0)
        {
            button.Visible = false;
            status.Text = "You have sent this member a pending friend request";
            
        }

        //If the you have sent the person a request:
        else if (receivedRequestData.Count > 0)
        {
            status.Text = "This member has sent you a friend request";
            button.Visible = true;
            button.Text = "Accept friend request";
        }

        //If you have no relationship with this person:
        else
        {
            status.Text = "";
            button.Visible = true;
            button.Text = "Send friend request";
        }

    }

    //Back button
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }

    //Submit button
    protected void button_Click(object sender, EventArgs e)
    {
        if (button.Text == "Drop this friend")
        {
            FriendManager.DropFriend(SessionManager.GetUserID(), (int)Session["ProfileID"], DateTime.Now, SessionManager.GetUserID());
            ChangeText();
        }
        else if (button.Text == "Accept friend request")
        {
            FriendManager.AcceptOrRejectRequest((int)Session["ProfileID"], SessionManager.GetUserID(), DateTime.Now, 1, 0); 
            ChangeText();
        }
        else if (button.Text == "Send friend request")
        {
            FriendManager.SendFriendRequest(SessionManager.GetUserID(), (int)Session["ProfileID"], DateTime.Now);
            ChangeText();
        }
    }
}