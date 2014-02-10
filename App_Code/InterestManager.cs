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
/// Summary description for InterestManager
/// </summary>
public class InterestManager
{
	public InterestManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    //Add an interest to the database table. A return value of 0 means success, 1 or more means entry already exists
    public static int AddInterest(string aname, string adesc, int acatID,DateTime adateCreated, int acreatorID)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "AddInterest";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@name", aname);
        myCmd.Parameters.AddWithValue("@description", adesc);
        myCmd.Parameters.AddWithValue("@catID", acatID);
        myCmd.Parameters.AddWithValue("@dateCreated", adateCreated);
        myCmd.Parameters.AddWithValue("@creatorID", acreatorID);
        myCmd.Parameters.Add("@retVal", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

        myCmd.ExecuteNonQuery();

        conn.Close();

        return (int)myCmd.Parameters["@retVal"].Value;

        
    }

    //Remove an interest from the database.
    //Note: This doesn't really erase an interest from the table, it just sets its datedeleted field, so it is no longer recognized as being there.
    public static void RemoveInterest(int ainterestID, DateTime adateDeleted, int adeleterID)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "RemoveInterest";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@interestID", ainterestID);
        myCmd.Parameters.AddWithValue("@dateDeleted", adateDeleted);
        myCmd.Parameters.AddWithValue("@deleterID", adeleterID);

        myCmd.ExecuteNonQuery();

        conn.Close();
    }

    //Add an interest to the database table. A return value of 0 means success, 1 or more means entry already exists
    public static int AddMemberToInterest(int amemberID, int ainterestID, DateTime adateJoined)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "AddMemberToInterest";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@memberID", amemberID);
        myCmd.Parameters.AddWithValue("@interestID", ainterestID);
        myCmd.Parameters.AddWithValue("@dateJoined", adateJoined);
        myCmd.Parameters.Add("@retVal", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

        myCmd.ExecuteNonQuery();

        conn.Close();

        return (int)myCmd.Parameters["@retVal"].Value;
    }

    public static void DeleteMemberInterest(int amemberID, int ainterestID, DateTime adateDeleted)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "DeleteMemberInterest";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@memberID", amemberID);
        myCmd.Parameters.AddWithValue("@interestID", ainterestID);
        myCmd.Parameters.AddWithValue("@dateDeleted", adateDeleted);
        //myCmd.Parameters.Add("@retVal", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

        myCmd.ExecuteNonQuery();

        conn.Close();

    }

    public static void AddInterestPost(int amemberID, int ainterestID, string atitle, string atext, DateTime adatePosted)
    {

        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "AddInterestPost";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@memberID", amemberID);
        myCmd.Parameters.AddWithValue("@interestID", ainterestID);
        myCmd.Parameters.AddWithValue("@title", atitle);
        myCmd.Parameters.AddWithValue("@text", atext);
        myCmd.Parameters.AddWithValue("@datePosted", adatePosted);

        //myCmd.Parameters.Add("@retVal", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

        myCmd.ExecuteNonQuery();

        conn.Close();

    }
}