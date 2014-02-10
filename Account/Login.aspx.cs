using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["BadLoginCount"] != null)
        {
            //Response.Write(Session["BadLoginCount"].ToString());
            if ((int)Session["BadLoginCount"] >= 20)
            {
                if (Session["LoginDenyEnd"] != null && DateTime.Now >= (DateTime)Session["LoginDenyEnd"])
                    Session["BadLoginCount"] = 0;
                Response.Redirect("BadLogin.aspx");
            }
        }

        if (!IsPostBack)
        {
            Incorrectlogin.Visible = false;
        }
    }

    protected void CreateMaryProfile()
    {
        Profile myProfile = new Profile("Mary");
        
        myProfile.Password = "Lamb";
        myProfile.FirstName = "Mary";
        myProfile.MiddleInitial = "M";
        myProfile.LastName = "Lamb";
        myProfile.Country = "USA";
        myProfile.PostalCode = "08999";
        myProfile.City = "Farmland";
        myProfile.Address = "12 Farm Ave";
        myProfile.Region = "Maryland";
        myProfile.HomePhone = "666-222-4444";
        myProfile.WorkPhone = "814-265-3209";
        myProfile.CellPhone = "234-234-1543";
        myProfile.Email = "MaryLamb@gmail.com";
        myProfile.Gender = GenderType.Female;
        myProfile.DateOfBirth = new DateTime(1970,5,23);
        myProfile.ReceiveSpam = true;
        myProfile.MembershipLevel = MembershipType.Gold;
        myProfile.OtherMemberships = null;

        Session["MemberProfile"] = myProfile;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        /*
        bool non_case_match = String.Equals(UsernameBox.Text, "mary",
                     StringComparison.OrdinalIgnoreCase);
        
        if (non_case_match && PasswordBox.Text == "Lamb")
        {
            CreateMaryProfile();
            Session["LoggedIn"] = true;
            FormsAuthentication.SetAuthCookie("username", true);
            Response.Redirect("~/MemberWelcome.aspx");
        }*/

        string username = UsernameBox.Text;
        string password = PasswordBox.Text;

        Profile loaded = MemberManager.LoadFromDataBase(username,password);

        if(loaded != null)
        {
            Session["MemberProfile"] = loaded;
            Session["LoggedIn"] = true;

            FormsAuthentication.SetAuthCookie(username, true);
            if(!SessionManager.IsAdmin())
                Response.Redirect("~/MemberWelcome.aspx");
            else
                Response.Redirect("~/AdminPages/AdminHome.aspx");
        }
        else
        {
            Incorrectlogin.Visible = true;
            if (Session["BadLoginCount"] == null)
            {
                Session["BadLoginCount"] = 1;
            }
            else
            {
                Session["BadLoginCount"] = (int)Session["BadLoginCount"] + 1;
                if ((int)Session["BadLoginCount"] >= 20)
                {
                    Session["LoginDenyEnd"] = DateTime.Now.AddMinutes(3.0); //User will be able to login in 3 minutes after being shut down
                    Response.Redirect("BadLogin.aspx");
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if ((Session["LoggedIn"] != null) && (((bool)Session["LoggedIn"]) == true))
            Response.Redirect("~/MemberWelcome.aspx");
        else
            Response.Redirect("~/Default.aspx");
         
    }
}