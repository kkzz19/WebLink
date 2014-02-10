using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class SendMessages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SessionManager.RedirectBadLogin();

            List<int> ids = FriendManager.GetFriendIDs(SessionManager.GetUserID());

            for (int i = 0; i < ids.Count; i++)
            {
                string fname = MemberManager.GetUserName(ids[i]);
                string fval = ids[i].ToString();
                friendDropDown.Items.Add(new ListItem(fname,fval));
            }

            if (friendDropDown.Items.Count == 0)
            {
                title.Text = "You have no friends to send messages to";
                friendDropDown.Visible = false;
                selectFriendLabel.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                titleBox.Visible = false;
                messageBox.Visible = false;
                RequiredFieldValidator1.Visible = false;
                addInterestButton.Visible = false;
            }
            else
            {
                selectFriendLabel.Text = "Select a friend to send a message to";
            }

        }
    }

    
    //Back button
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(SessionManager.GetLastPage());
    }
    protected void addInterestButton_Click(object sender, EventArgs e)
    {
        string messageWithNewlines = messageBox.Text.Replace(Environment.NewLine, "<br />");    //Make it so that newlines are seen on the message board
           
        FriendManager.SendMessage(SessionManager.GetUserID(), Int32.Parse(friendDropDown.SelectedValue), titleBox.Text, messageWithNewlines, DateTime.Now);

        Response.Redirect("~/Friends/MessagePostSuccess.aspx");
    }
    protected void DataBounded(object sender, EventArgs e)
    {

    }
}