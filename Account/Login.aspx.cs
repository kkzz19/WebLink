using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Cryptography;

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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = UsernameBox.Text;

        Profile loaded = MemberManager.LoadFromDataBase(username);

        if(loaded != null)
        {
            string salt = loaded.Salt;
            string password = Security.CreatePasswordHash(PasswordBox.Text, salt);

            if (loaded.Password == password)
            {
                Session["MemberProfile"] = loaded;
                Session["LoggedIn"] = true;

                FormsAuthentication.SetAuthCookie(username, true);
                if (!SessionManager.IsAdmin())
                {
                    Response.Redirect("~/MemberWelcome.aspx");
                    return;
                }
                else
                {
                    Response.Redirect("~/AdminPages/AdminHome.aspx");
                    return;
                }
            }
        }
        
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        if ((Session["LoggedIn"] != null) && (((bool)Session["LoggedIn"]) == true))
            Response.Redirect("~/MemberWelcome.aspx");
        else
            Response.Redirect("~/Default.aspx");
         
    }
}