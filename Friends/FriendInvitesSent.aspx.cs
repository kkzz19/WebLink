using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Friends_FriendInvitesSent : System.Web.UI.Page
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
            noSent.Visible = true;
            Repeater1.Visible = false;
        }
        else
        {
            noSent.Visible = false;
            Repeater1.Visible = true;
        }
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            if (((Button)e.CommandSource).ID == "drop" && e.Item.ItemIndex == i)
            {
                int memberB_ID = (int)dv[i]["MemberB_ID"];

                status.ForeColor = Color.DarkGreen;
                status.Text = "You have dropped the invite from " + MemberManager.GetUserName(memberB_ID) + ".";
                FriendManager.AcceptOrRejectRequest(SessionManager.GetUserID(), memberB_ID, DateTime.Now, 0, SessionManager.GetUserID());
                Repeater1.DataBind();
            }
                
        }
    }

    protected void backButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }

    public string RequestStatus(DateTime reject, DateTime accept)
    {
        if (reject != null)
            return "Rejected";
        else if (accept != null)
            return "Accepted";
        else
            return "Pending";
    }

}