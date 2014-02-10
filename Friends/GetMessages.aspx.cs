using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class GetMessages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            SessionManager.RedirectBadLogin();
        Session["OwnMemberID"] = SessionManager.GetUserID();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
    protected void Repeater1_OnItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count == 0)
        {
            noPosts.Visible = true;
            Repeater1.Visible = false;
        }
        else
        {
            noPosts.Visible = false;
            Repeater1.Visible = true;
        }
    }
    public string TitleText(string title)
    {
        if (title == "" || title == null)
            return "(No Subject)";
        else
            return String.Format("{0}<br /><br />", title);
    }
    public string ReadOrNot(object sendDate)
    {
        if (sendDate.ToString() == "")
        {
            return "No";
        }
        else
        {
            return "Yes";
        }
    }
    public Color SetColor(object dateRead)
    {
        if (dateRead.ToString() == "")
        {
            return Color.Red;
        }
        else
        {
            return Color.Black;
        }
    }
    public bool IsBold(object dateRead)
    {
        if (dateRead.ToString() == "")
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}