using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data.OleDb;
using System.Configuration;

/// <summary>
/// Summary description for CategoryManager
/// </summary>
public class CategoryManager
{
	public CategoryManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Given a name of a category, return its ID value
    public static bool GetCategory(string aname, ref int retID)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "CatNameToID";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@name", aname);
        myCmd.Parameters.AddWithValue("@retID", retID).Direction = ParameterDirection.Output;

        myCmd.Parameters.Add("@retVal", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
        
        myCmd.ExecuteNonQuery();

        if ((int)myCmd.Parameters["@retVal"].Value > 0)
        {
            retID = (int)myCmd.Parameters["@retID"].Value;
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }

    }

    //Add a category to the database.
    //Return 0 means category has been added (it didn't exist before). Return != 0 means that the category name already exists.
    public static int AddCategory(string aname,string adesc,DateTime adateCreated,int acreatorID)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "AddCategory";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@name",aname);
        myCmd.Parameters.AddWithValue("@description",adesc);
        myCmd.Parameters.AddWithValue("@dateCreated", adateCreated);
        myCmd.Parameters.AddWithValue("@creatorID", acreatorID);
        myCmd.Parameters.Add("@retVal", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

        myCmd.ExecuteNonQuery();

        conn.Close();

        return (int)myCmd.Parameters["@retVal"].Value;
        
    }

    //Remove a category from the database.
    //Note: This doesn't really erase a category from the table, it just sets its datedeleted field, so it is no longer recognized as being there.
    public static void RemoveCategory(int acatID, DateTime adateDeleted, int adeleterID)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "RemoveCategory";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@catID", acatID);
        myCmd.Parameters.AddWithValue("@dateDeleted", adateDeleted);
        myCmd.Parameters.AddWithValue("@deleterID", adeleterID);

        myCmd.ExecuteNonQuery();

        conn.Close();
    }
}