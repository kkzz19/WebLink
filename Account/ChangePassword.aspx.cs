using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class ChangePassword : System.Web.UI.Page
{
    bool logged_in;

    protected void Page_Load(object sender, EventArgs e)
    {
        //If the page has been loaded from a different page,
        if (!IsPostBack)
        {
            oldPassMismatch.Visible = false;
            
            logged_in = (Session["LoggedIn"] != null && (bool)Session["LoggedIn"] == true);

            oldPassBox.Visible = false;
            oldPassLabel.Visible = false;
            oldPassReqValidator.Enabled = false;

            if (logged_in)
            {
                oldPassBox.Visible = true;
                oldPassLabel.Visible = true;
                oldPassReqValidator.Enabled = true;
                setOrChange.Text = "Change Password";
            }
        }
    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        oldPassMismatch.Visible = false;

        Profile myProfile = (Profile)Session["MemberProfile"];
        string oldPass = myProfile.Password;
        
        logged_in = (Session["LoggedIn"] != null && (bool)Session["LoggedIn"] == true);

        //Complain abouut a mismatch if they don't match, AND the user must be logged in for this to happen AND the user must not be in "forget password" mode
        if(oldPassBox.Text != oldPass && logged_in == true)
        {
            oldPassMismatch.Visible = true;
            return;
        }

        if (Page.IsValid)
        {
            string salt = Security.CreateSalt(16);
            string password = Security.CreatePasswordHash(newPassBox.Text, salt);

            myProfile.Password = password;
            myProfile.Salt = salt;

            if(logged_in)
            {
                MemberManager.UpdatePassword(myProfile);

                Response.Redirect("~/Account/PassChangeSuccess.aspx");
            }
            else
            {
                //If a new user is submitting the account for the first time: set his profile's join date to current date.
                myProfile.SetJoinDate();

                if (MemberManager.AddToDatabase(myProfile) == 1)
                {
                    Session["MemberProfile"] = MemberManager.LoadFromDataBase(myProfile.UserName);
                    Session["LoggedIn"] = true;
                    FormsAuthentication.SetAuthCookie("username", true);
                    Response.Redirect("~/Account/AccountCreateSuccess.aspx");
                }
                else
                {
                    errorConnectDatabase.Visible = true;
                }
            }
        }
    }
    protected void cancelButton_Click(object sender, EventArgs e)
    {
        logged_in = (Session["LoggedIn"] != null && (bool)Session["LoggedIn"] == true);
        if (logged_in)
        {
            Response.Redirect("~/MemberWelcome.aspx");
        }
        else
        {
            Response.Redirect("~/Account/MemberProfile.aspx");
        }
    }

}