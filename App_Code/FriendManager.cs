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
/// Summary description for FriendManager
/// </summary>
public class FriendManager
{
	public FriendManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //As usual, a value of 0 means that the entering was a success, and 1 means it did not enter
    public static int SendFriendRequest(int amemberA, int amemberB, DateTime asendDate)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "AddFriendRequest";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@memberA_ID", amemberA);
        myCmd.Parameters.AddWithValue("@memberB_ID", amemberB);
        myCmd.Parameters.AddWithValue("@requestSendDate", asendDate);
        myCmd.Parameters.Add("@retVal", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

        myCmd.ExecuteNonQuery();

        conn.Close();

        return (int)myCmd.Parameters["@retVal"].Value;
    }

    public static void AcceptOrRejectRequest(int amemberA, int amemberB, DateTime adate,int aisAccepted,int adropperID)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "AcceptOrIgnoreRequest";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@memberA_ID", amemberA);
        myCmd.Parameters.AddWithValue("@memberB_ID", amemberB);
        myCmd.Parameters.AddWithValue("@date", adate);
        myCmd.Parameters.AddWithValue("@isAccepted", aisAccepted);
        myCmd.Parameters.AddWithValue("@dropperID", adropperID);

        myCmd.ExecuteNonQuery();

        conn.Close();
    }

    //Given two CURRENT FRIENDS, find out their start date.
    public static DateTime FindFriendStartDate(int amemberA, int amemberB)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "FindFriendStartDate";

        DateTime retStartDate = DateTime.MinValue;

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@memberA_ID", amemberA);
        myCmd.Parameters.AddWithValue("@memberB_ID", amemberB);
        myCmd.Parameters.AddWithValue("@startDate", retStartDate).Direction = ParameterDirection.Output;

        myCmd.ExecuteNonQuery();

        retStartDate = (DateTime)myCmd.Parameters["@startDate"].Value;
        conn.Close();

        return retStartDate;
    }

    public static void DropFriend(int amemberA, int amemberB, DateTime adropDate, int adropper)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "DropFriend";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@memberA_ID", amemberA);
        myCmd.Parameters.AddWithValue("@memberB_ID", amemberB);
        myCmd.Parameters.AddWithValue("@dropDate", adropDate);
        myCmd.Parameters.AddWithValue("@startDate", FindFriendStartDate(amemberA,amemberB));
        myCmd.Parameters.AddWithValue("@dropper", adropper);

        myCmd.ExecuteNonQuery();

        conn.Close();

    }

    //Gets a list of all friends' IDs for a particular member.
    public static List<int> GetFriendIDs(int ownMemberID)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        string SQLstr = "GetFriends";

        conn.Open();

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@ownMemberID", ownMemberID);

        SqlDataReader myReader = myCmd.ExecuteReader();

        List<int> retList = new List<int>();

        while (myReader.Read())
        {
            int ma = myReader.GetInt32(0);
            int mb = myReader.GetInt32(1);

            if (ma == ownMemberID)
                retList.Add(mb);
            else
                retList.Add(ma);

        }

        conn.Close();

        return retList;

    }

    public static void MarkAsRead(int amemberA, int amemberB, DateTime adateSent)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "MarkFriendEntryAsRead";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@memberA_ID", amemberA);
        myCmd.Parameters.AddWithValue("@memberB_ID", amemberB);
        myCmd.Parameters.AddWithValue("@dateSent", adateSent);

        myCmd.ExecuteNonQuery();

        conn.Close();
    }


    public static void SendMessage(int senderID, int receiverID, string subject, string text, DateTime adateSent)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "SendMessage";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@senderID", senderID);
        myCmd.Parameters.AddWithValue("@receiverID", receiverID);
        myCmd.Parameters.AddWithValue("@dateSent", adateSent);
        myCmd.Parameters.AddWithValue("@subject", subject);
        myCmd.Parameters.AddWithValue("@text", text);

        myCmd.ExecuteNonQuery();

        conn.Close();
    }

    public static void SetMessageAsRead(int messageID, DateTime adateRead)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "SetMessageAsRead";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@messageID", messageID);
        myCmd.Parameters.AddWithValue("@dateRead", adateRead);

        myCmd.ExecuteNonQuery();

        conn.Close();
    }


    public static void DeleteMessage(int messageID, DateTime adateDeleted)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        conn.Open();

        string SQLstr = "DeleteMessage";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.StoredProcedure;

        myCmd.Parameters.AddWithValue("@messageID", messageID);
        myCmd.Parameters.AddWithValue("@dateDeleted", adateDeleted);

        myCmd.ExecuteNonQuery();

        conn.Close();
    }
}