using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class AdminPages_SelectCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            SessionManager.RedirectNonAdmin();
    }

    protected void Repeater1_OnPrerender(object source, EventArgs e)
    {
    }

    protected void Repeater1_OnItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (Repeater1.Items.Count == 0)
        {
            noCategories.Visible = true;
            Repeater1.Visible = false;
        }
        else
        {
            noCategories.Visible = false;
            Repeater1.Visible = true;
        }
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        for(int i=0;i<Repeater1.Items.Count;i++)
        {
            RepeaterItem ri = Repeater1.Items[i];

            Label cb = ri.FindControl("CatTableName") as Label;

            if(e.Item.ItemIndex == i)
            {
                int catID = 0;

                if (CategoryManager.GetCategory(cb.Text, ref catID) == true)
                {
                    if (((Button)e.CommandSource).ID == "selectCategory")
                    {
                        Response.Redirect("~/AdminPages/AdminInterest.aspx?CategoryID="+catID+"&CategoryName="+cb.Text);
                    }
                    else if (((Button)e.CommandSource).ID == "deleteCategory")
                    {
                        CategoryManager.RemoveCategory(catID, DateTime.Now, SessionManager.GetUserID());
                        deleteMessage.ForeColor = Color.Green;
                        deleteMessage.Text = "Successfully deleted category " + cb.Text;
                        Repeater1.DataBind();
                        catAddSuccessFail.Text = "";
                    }
                }
            }
        }

        /*
        if (result.Length > 0)
            Label2.Text = result;
        else
            Label2.Text = "No selection";
         */

    }
    protected void backButton_Click(object sender, EventArgs e)
    {

    }
    protected void addCatButton_Click(object sender, EventArgs e)
    {
        int res = CategoryManager.AddCategory(addCategory.Text, addDesc.Text, DateTime.Now, SessionManager.GetUserID());
        if (res == 0)
        {
            Repeater1.DataBind();
            catAddSuccessFail.ForeColor = Color.DarkGreen;
            catAddSuccessFail.Text = "Successfully added category " + addCategory.Text;
            deleteMessage.Text = "";
        }
        else
        {
            catAddSuccessFail.ForeColor = Color.Red;
            catAddSuccessFail.Text = "The category " + addCategory.Text + " already exists. Was not added";
            deleteMessage.Text = "";
        }
    }
}