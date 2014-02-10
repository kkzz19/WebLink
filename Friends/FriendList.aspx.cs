using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Friends_FriendList : System.Web.UI.Page
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
            noFriends.Visible = true;
            Repeater1.Visible = false;
        }
        else
        {
            noFriends.Visible = false;
            Repeater1.Visible = true;
        }
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            HyperLink hl = Repeater1.Items[i].FindControl("friendUserName") as HyperLink;
            string droppedFriend = hl.Text;

            if (((Button)e.CommandSource).ID == "drop" && e.Item.ItemIndex == i)
            {
                int memberA_ID = (int)dv[i]["MemberA_ID"];
                int memberB_ID = (int)dv[i]["MemberB_ID"];

                status.Text = "You have dropped friend " + droppedFriend;
                FriendManager.DropFriend(memberA_ID,memberB_ID,DateTime.Now,SessionManager.GetUserID());

                Repeater1.DataBind();

            }

        }
    }

    protected void backButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }

}