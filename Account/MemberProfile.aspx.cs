using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Web.Security;

public partial class MemberProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Only load up things when page first loads up
        if (this.IsPostBack == false)
        {
            yearDropDown.Items.Add(new ListItem());
            dayDropDown.Items.Add(new ListItem());

            for(int i = 2013;i>=1900;i--)
            {
                yearDropDown.Items.Add(new ListItem(i.ToString(),i.ToString()));
            }
            for (int i = 1; i <= 31; i++ )
            {
                dayDropDown.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            //If we're working with a existing member profile
            if (Session["MemberProfile"] != null)
            {
                tableTitle.Text = "Change desired fields.";

                //Hide required field asterisks
                a2.Visible = false;
                a3.Visible = false;
                a4.Visible = false;
                a5.Visible = false;
                a6.Visible = false;
                a7.Visible = false;
                a8.Visible = false;
                a9.Visible = false;
                a10.Visible = false;

                Profile myProfile = (Profile)Session["MemberProfile"];

                userNameBox.Visible = false;
                userNameLabel.Visible = false;
                userNameValidator.Visible = false;

                firstNameBox.Text = myProfile.FirstName;
                middleInitialBox.Text = myProfile.MiddleInitial;
                lastNameBox.Text = myProfile.LastName;
                countryBox.Text = myProfile.Country;
                postalBox.Text = myProfile.PostalCode;
                cityBox.Text = myProfile.City;
                addressBox.Text = myProfile.Address;
                regionBox.Text = myProfile.Region;
                homePhone1.Text = myProfile.HomePhone;
                workPhone1.Text = myProfile.WorkPhone;
                cellPhone1.Text = myProfile.CellPhone;
                emailBox.Text = myProfile.Email;
                genderSelect.SelectedIndex = (int)myProfile.Gender;

                if (myProfile.DateOfBirth != DateTime.MinValue)
                {
                    dayDropDown.SelectedValue = myProfile.DateOfBirth.Day.ToString();
                    monthDropDown.SelectedValue = myProfile.DateOfBirth.Month.ToString();
                    yearDropDown.SelectedValue = myProfile.DateOfBirth.Year.ToString();
                }

                spamCheckBox.Checked = myProfile.ReceiveSpam;
                membershipBox.SelectedIndex = (int)myProfile.MembershipLevel;
            }

        }
    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        errorDate.Text = "";
        usernameTakenLabel.Text = "";

        bool usernameTaken = false;
        string[] availableNames = new string[4];
        
        //Check if what was entered in for the username is taken.
        if(userNameBox.Text != String.Empty)
            usernameTaken = MemberManager.IsUserNameTaken(userNameBox.Text, availableNames);

        //If username is already taken:
        if (usernameTaken)
        {
            errorLabel.Visible = true;
            usernameTakenLabel.Text = "The username you have entered is already taken. Please enter in a different one.";
            usernameTakenLabel.Text += "<br/>Suggestions:<br/>";
            usernameTakenLabel.Text += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + availableNames[0];
            usernameTakenLabel.Text += "&nbsp;&nbsp;&nbsp;" + availableNames[1];
            usernameTakenLabel.Text += "&nbsp;&nbsp;&nbsp;" + availableNames[2];
            usernameTakenLabel.Text += "&nbsp;&nbsp;&nbsp;" + availableNames[3];
        }

        Page.Validate();

        int year; int month; int day;

        DateTime birthday = DateTime.MinValue;

        //If the user entered in a birthday (birthdays are optional):
        if (yearDropDown.SelectedIndex != 0 || monthDropDown.SelectedIndex != 0 || dayDropDown.SelectedIndex != 0)
        {
            //If the user entered in a "partial" birthday (one or two fields left blank):
            if (yearDropDown.SelectedIndex == 0 || monthDropDown.SelectedIndex == 0 || dayDropDown.SelectedIndex == 0)
            {
                errorDate.Text = "Enter in a complete date or leave all three fields blank";
                errorLabel.Visible = true;
                return;
            }

            //Check for a valid date.
            Int32.TryParse(yearDropDown.SelectedItem.Value, out year);
            Int32.TryParse(monthDropDown.SelectedItem.Value, out month);
            Int32.TryParse(dayDropDown.SelectedItem.Value, out day);

            string date = month.ToString() + "/" + day.ToString() + "/" + year.ToString();

            if (!DateTime.TryParse(date, out birthday))
            {
                errorDate.Text = "Enter in a valid date";
                errorLabel.Visible = true;
                return;
            }
        }

        if (!Page.IsValid || usernameTaken == true)
        {
            errorLabel.Visible = true;
        }
        else
        {
            Profile newMember;

            //For anyone that isn't logged in: Their user name and join date (set up in constructor) gets remade everytime submit is hit. 
            if (Session["MemberProfile"] == null)
            {
                newMember = new Profile(userNameBox.Text);
            }
            else
            {
                newMember = (Profile)Session["MemberProfile"];
            }

            newMember.FirstName = firstNameBox.Text;
            newMember.MiddleInitial = middleInitialBox.Text;
            newMember.LastName = lastNameBox.Text;
            newMember.Address = addressBox.Text;
            newMember.City = cityBox.Text;
            newMember.Region = regionBox.Text;
            newMember.PostalCode = postalBox.Text;
            newMember.Country = countryBox.Text;
            newMember.HomePhone = homePhone1.Text;
            newMember.WorkPhone = workPhone1.Text;
            newMember.CellPhone = cellPhone1.Text;
            newMember.Email = emailBox.Text;

            GenderType gender;

            if (genderSelect.SelectedIndex == 0)
                gender = GenderType.Male;
            else if (genderSelect.SelectedIndex == 1)
                gender = GenderType.Female;
            else
                gender = GenderType.NotSpecified;

            newMember.Gender = gender;

            newMember.DateOfBirth = birthday;

            newMember.ReceiveSpam = spamCheckBox.Checked;
            newMember.MembershipLevel = (MembershipType)membershipBox.SelectedIndex;

            newMember.IsAdmin = false;

            Session["MemberProfile"] = newMember;
            
            //If we're working with a existing member profile
            if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"] == true)
            {
                MemberManager.UpdateProfile(newMember);

                Response.Redirect("ProfileChangeSuccess.aspx");
            }
            else
            {
                Response.Redirect("ChangePassword.aspx");
            }
        }
    }

    protected void cancelButton_Click(object sender, EventArgs e)
    {
        if (Session["LoggedIn"] != null && (bool)Session["LoggedIn"] == true)
            Response.Redirect("~/MemberWelcome.aspx");
        else
        {
            Session.Remove("MemberProfile");
            Response.Redirect("Login.aspx");
        }
    }
}