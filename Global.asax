<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        /*
        Session["Username"] = "";
        Session["Password"] = "";
        Session["FirstName"] = "";
        Session["MiddleInitial"] = "";
        Session["LastName"] = "";
        Session["Address"] = "";
        Session["City"] = "";
        Session["Region"] = "";
        Session["PostalCode"] = 0;
        Session["Country"] = "";
        Session["HomePhone"] = 0;
        Session["WorkPhone"] = 0;
        Session["CellPhone"] = 0;
        Session["Email"] = "";
        //Session["Gender"] = 0;*/

        //Session["DateOfBirth"] = birthday;
        //Session["ReceiveSpam"] = spamCheckBox.Checked;
        //Session["JoinDate"] = DateTime.Now;
        //Session["MembershipLevel"] = membershipBox.SelectedItem.Value;

        //Session["LoggedIn"] = false;
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
