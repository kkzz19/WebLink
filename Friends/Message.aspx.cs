using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Friends_Message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SessionManager.RedirectBadLogin();
            
            int messageID = Int32.Parse(Request.QueryString["MessageID"]);
            Session["MessageID"] = messageID;

            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            if(dv[0]["Subject"] == null)
                subjectLabel.Text = "(No subject)";
            else
                subjectLabel.Text = (string)dv[0]["Subject"];

            string senderName = MemberManager.GetUserName((int)dv[0]["SenderID"]);

            fromLink.Text = senderName;
            fromLink.NavigateUrl = "~/Account/PublicProfile.aspx?Username=" + senderName;

            string receiverName = MemberManager.GetUserName((int)dv[0]["ReceiverID"]);

            toLink.Text = receiverName;
            toLink.NavigateUrl = "~/Account/PublicProfile.aspx?Username=" + receiverName;

            sendDateLabel.Text = ((DateTime)dv[0]["DateSent"]).ToString();
            messageText.Text = (string)dv[0]["Text"];

            string sentMessage = Request.QueryString["SentMessage"];

            if (sentMessage != null && sentMessage != "" && sentMessage == "1")
            {
                deleteButton.Visible = false;
            }
            else
            {
                FriendManager.SetMessageAsRead(messageID, DateTime.Now);
            }
        }

    }

    protected void deleteButton_Click(object sender, EventArgs e)
    {
        int messageID = Int32.Parse(Request.QueryString["MessageID"]);

        FriendManager.DeleteMessage(messageID, DateTime.Now);

        Response.Redirect("~/Friends/MessageDeleted.aspx");
    }
    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
}