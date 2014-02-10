using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

/// <summary>
/// Summary description for SessionManager
/// </summary>
public class SessionManager
{
	public SessionManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string GetTopPage()
    {
        Object session = System.Web.HttpContext.Current.Session["PageStack"];
        if (session == null)
        {
            return "error";
        }
        else
        {
            List<string> pageStack = ((List<string>)session);
            if (pageStack.Count > 0)
                return pageStack[pageStack.Count - 1];
            else
                return "empty";
        }
    }
    public static void PushPage(string url)
    {
        if(System.Web.HttpContext.Current.Session["PageStack"] == null)
            System.Web.HttpContext.Current.Session["PageStack"] = new List<string>();

        ((List<string>)System.Web.HttpContext.Current.Session["PageStack"]).Add(url);

    }
    //Get the last page. Pop top off stack
    public static string GetLastPage()
    {
        Object session = System.Web.HttpContext.Current.Session["PageStack"];
        if (session == null)
        {
            return "~/MemberWelcome.aspx";
        }
        else
        {
            string retVal;

            List<string> pageStack = ((List<string>)session);
            if (pageStack.Count <= 1)
            {
                retVal = pageStack[0];
            }
            else
                retVal = pageStack[pageStack.Count - 2];

            if (pageStack.Count > 0)
            {
                pageStack.RemoveAt(pageStack.Count - 1);
            }
            
            return retVal;
        }

    }

    public static string PrintPageStack()
    {
        string retStr = "";
        Object session = System.Web.HttpContext.Current.Session["PageStack"];
        if (session == null)
        {
            return "(null)";
        }
        else
        {
            List<string> pageStack = ((List<string>)session);
            for (int i = 0; i < pageStack.Count; i++)
            {
                retStr += pageStack[i] + "<br/>";
            }
        }
        return retStr;
    }

    //Get the current logged in user's profile
    public static Profile GetUserProfile()
    {
        if (ConfigurationManager.AppSettings["Debug"] == "0" && System.Web.HttpContext.Current.Session["MemberProfile"] == null)
            HttpContext.Current.Response.Redirect("~/BadLoginSequence.aspx");

        return (Profile)System.Web.HttpContext.Current.Session["MemberProfile"];
    }

    public static void RedirectBadLogin()
    {
        //If we're debugging, don't redirect for bad login sequences
        if (ConfigurationManager.AppSettings["Debug"] == "1")
            return;
        if (System.Web.HttpContext.Current.Session["MemberProfile"] == null)
        {
            HttpContext.Current.Response.Redirect("~/BadLoginSequence.aspx");
        }
    }

    public static void RedirectNonAdmin()
    {
        //If we're debugging, don't redirect for bad login sequences
        if (ConfigurationManager.AppSettings["Debug"] == "1")
            return;
        if (System.Web.HttpContext.Current.Session["MemberProfile"] != null)
        {
            if (((Profile)System.Web.HttpContext.Current.Session["MemberProfile"]).IsAdmin == false)
            {
                HttpContext.Current.Response.Redirect("~/MemberWelcome.aspx");
            }
        }
        else
        {
            HttpContext.Current.Response.Redirect("~/BadLoginSequence.aspx");
        }
    }

    public static int GetUserID()
    {
        if (System.Web.HttpContext.Current.Session["MemberProfile"] != null)
        {
            //System.Web.HttpContext.Current.Response.Write("Memberprofile wasn't null");
            return ((Profile)System.Web.HttpContext.Current.Session["MemberProfile"]).MemberID;
        }
        else
        {
            //If we're not debugging, complain and return to bad login sequence
            if (ConfigurationManager.AppSettings["Debug"] == "0")
                HttpContext.Current.Response.Redirect("~/BadLoginSequence.aspx");
            return -1;
        }
    }
    public static bool IsAdmin()
    {
        if (System.Web.HttpContext.Current.Session["MemberProfile"] != null)
        {
            return ((Profile)System.Web.HttpContext.Current.Session["MemberProfile"]).IsAdmin;
        }
        else
            return false;
    }

    public static int GetOtherMemberID(int memberA, int memberB)
    {
        if (memberA == SessionManager.GetUserID())
            return memberB;
        else
            return memberA;
    }

    public static string GetOtherUsername(int memberA, int memberB)
    {
        if (memberA == SessionManager.GetUserID())
            return MemberManager.GetUserName(memberB);
        else
            return MemberManager.GetUserName(memberA);
    }

}