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
/// Summary description for MemberManager
/// </summary>
public class MemberManager
{
	public MemberManager()
	{
        
	}

    public static string BoolToIntString(bool val)
    {
        if (val == false)
            return "0";
        else
            return "1";
    }

    public static int AddToDatabase(Profile newProfile)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);

        conn.Open();

        string SQLstr = "INSERT INTO MemberProfiles" +
            "(Username,VisibleUsername,Password,FirstName,MiddleInitial,LastName,Address,City,Region,PostalCode,"+
            "Country,HomePhone,WorkPhone,CellPhone,Email,Gender,DateOfBirth,JoinDate,ReceiveSpam,IsAdmin,MembershipLevel)"+
            "VALUES (";

        SQLstr += "'" + newProfile.UserName + "',";
        SQLstr += "'" + newProfile.VisibleUserName + "',";
        SQLstr += "'" + newProfile.Password + "',";
        SQLstr += "'" + newProfile.FirstName + "',";
        SQLstr += "'" + newProfile.MiddleInitial + "',";
        SQLstr += "'" + newProfile.LastName + "',";
        SQLstr += "'" + newProfile.Address + "',";
        SQLstr += "'" + newProfile.City + "',";
        SQLstr += "'" + newProfile.Region + "',";
        SQLstr += "'" + newProfile.PostalCode + "',";
        SQLstr += "'" + newProfile.Country + "',";
        SQLstr += "'" + newProfile.HomePhone + "',";
        SQLstr += "'" + newProfile.WorkPhone + "',";
        SQLstr += "'" + newProfile.CellPhone + "',";
        SQLstr += "'" + newProfile.Email + "',";
        SQLstr += ((int)newProfile.Gender).ToString() + ",";
        SQLstr += "'" + newProfile.DateOfBirth + "',";
        SQLstr += "'" + newProfile.JoinDate + "',";
        SQLstr += BoolToIntString(newProfile.ReceiveSpam) + ",";
        SQLstr += BoolToIntString(newProfile.IsAdmin) + ",";
        SQLstr += ((int)newProfile.MembershipLevel).ToString() + ")";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.Text;

        int ret = myCmd.ExecuteNonQuery();

        conn.Close();

        return ret;
    }

    //This method gets the next suggested username
    public static string GetNextName(string name)
    {
        int index = name.Length - 1;
        //Starting from the end of the string, go until you don't find a number anymore.
        for (int i = name.Length - 1; i >= 0; i--)
        {
            if (!Char.IsDigit(name[i]))
            {
                index = i;
                break;
            }
            if (i == 0)
            {
                index = -1;
            }
        }

        //Extract the string without that number & save the number.
        string nameOnly = name.Substring(0, index + 1);
        string numOnly = name.Substring(index + 1);

        int num;

        //Increment the number and reappend it to the string.
        if (numOnly != "" && numOnly != null)
        {
            num = Int32.Parse(numOnly);
            num++;
        }
        else
        {
            num = 0;
        }

        nameOnly += num.ToString();

        //Return that string.
        return nameOnly;
    }

    public static bool IsUserNameTaken(string username, string[] availableNames)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        string SQLstr = "SELECT Username FROM MemberProfiles WHERE Username='" + username.ToLower() + "';";
        conn.Open();

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.Text;
        Object myReader = myCmd.ExecuteScalar();

        //The name is taken:
        if (myReader != null)
        {
            //Get the original entered, but taken name.
            string usedname = username;

            //Repeat 4 times:
            for (int i = 0; i < 4; i++)
            {
                //Get the next suggestion.
                usedname = GetNextName(usedname);

                //See if this name is taken.
                SQLstr = "SELECT Username FROM MemberProfiles WHERE Username='" + usedname.ToLower() + "';";
                myCmd = new SqlCommand(SQLstr, conn);
                myCmd.CommandType = CommandType.Text;
                Object myReader2 = myCmd.ExecuteScalar();

                //Is this suggestion taken? Then reiterate the iteration without incrementing i.
                if (myReader2 != null)
                {
                    i--;
                    continue;
                }
                else
                {
                    availableNames[i] = usedname;
                }
            }
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }

    }


    public static string GetUserName(int memberID)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        string SQLstr;
        SQLstr = "SELECT VisibleUsername FROM MemberProfiles WHERE MemberID=" + memberID.ToString() + ";";
        conn.Open();

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.Text;
        SqlDataReader myReader = myCmd.ExecuteReader();

        string retName = "";

        while (myReader.Read())
        {
            retName = myReader.GetString(0);
        }

        conn.Close();

        return retName;
    }

    public static int GetUserID(string username)
    {

        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        string SQLstr;
        SQLstr = "SELECT MemberID FROM MemberProfiles WHERE Username='" + username + "'";
        conn.Open();

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.Text;
        SqlDataReader myReader = myCmd.ExecuteReader();

        Profile retProfile = new Profile();
        
        int retID = 0;

        while (myReader.Read())
        {
            retID = myReader.GetInt32(0);
        }

        conn.Close();

        return retID;


    }

    public static Profile LoadFromDataBase(string username,string password)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        string SQLstr;
        SQLstr = "SELECT * FROM MemberProfiles WHERE Username='" + username + "'";
        SQLstr += "AND Password COLLATE Latin1_General_CS_AS ='" + password + "';";
        conn.Open();

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.Text;
        SqlDataReader myReader = myCmd.ExecuteReader();

        Profile retProfile = new Profile();
        bool read = false;

        while (myReader.Read())
        {
            read = true;
            retProfile.MemberID = myReader.GetInt32(0);
            retProfile.SetUserName(myReader.GetString(1));
            retProfile.SetVisibleUserName(myReader.GetString(2));
            retProfile.Password = myReader.GetString(3);
            retProfile.FirstName = myReader.GetString(4);
            retProfile.MiddleInitial = myReader.GetString(5);
            retProfile.LastName = myReader.GetString(6);
            retProfile.Address = myReader.GetString(7);
            retProfile.City = myReader.GetString(8);
            retProfile.Region = myReader.GetString(9);
            retProfile.PostalCode = myReader.GetString(10);
            retProfile.Country = myReader.GetString(11);
            
            retProfile.HomePhone = myReader.GetString(12);
            retProfile.WorkPhone = myReader.GetString(13);
            retProfile.CellPhone = myReader.GetString(14);
            retProfile.Email = myReader.GetString(15);
            retProfile.Gender = (GenderType)myReader.GetInt32(16);
            retProfile.DateOfBirth = (DateTime)myReader[17];
            retProfile.SetJoinDate((DateTime)myReader[18]);
            retProfile.ReceiveSpam = myReader.GetBoolean(19);
            retProfile.IsAdmin = myReader.GetBoolean(20); 
            retProfile.MembershipLevel = (MembershipType)myReader.GetInt32(21);
            retProfile.OtherMemberships = null; // GetOtherNetworks(retProfile.MemberID);
        }

        conn.Close();

        if (read)
            return retProfile;
        else
            return null;

    }

    public static Profile LoadFromDataBase(string username)
    {
        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        string SQLstr;
        SQLstr = "SELECT * FROM MemberProfiles WHERE Username='" + username + "'";
        conn.Open();

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.Text;
        SqlDataReader myReader = myCmd.ExecuteReader();

        Profile retProfile = new Profile();
        bool read = false;

        while (myReader.Read())
        {
            read = true;
            retProfile.MemberID = myReader.GetInt32(0);
            retProfile.SetUserName(myReader.GetString(1));
            retProfile.SetVisibleUserName(myReader.GetString(2));
            retProfile.Password = myReader.GetString(3);
            retProfile.FirstName = myReader.GetString(4);
            retProfile.MiddleInitial = myReader.GetString(5);
            retProfile.LastName = myReader.GetString(6);
            retProfile.Address = myReader.GetString(7);
            retProfile.City = myReader.GetString(8);
            retProfile.Region = myReader.GetString(9);
            retProfile.PostalCode = myReader.GetString(10);
            retProfile.Country = myReader.GetString(11);

            retProfile.HomePhone = myReader.GetString(12);
            retProfile.WorkPhone = myReader.GetString(13);
            retProfile.CellPhone = myReader.GetString(14);
            retProfile.Email = myReader.GetString(15);
            retProfile.Gender = (GenderType)myReader.GetInt32(16);
            retProfile.DateOfBirth = (DateTime)myReader[17];
            retProfile.SetJoinDate((DateTime)myReader[18]);
            retProfile.ReceiveSpam = myReader.GetBoolean(19);
            retProfile.IsAdmin = myReader.GetBoolean(20);
            retProfile.MembershipLevel = (MembershipType)myReader.GetInt32(21);
            retProfile.OtherMemberships = null; // GetOtherNetworks(retProfile.MemberID);
        }

        conn.Close();

        if (read)
            return retProfile;
        else
            return null;

    }

    public static int UpdateProfile(Profile updated)
    {
        string userName = updated.UserName;

        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);

        conn.Open();

        string SQLstr = "UPDATE MemberProfiles SET";

        SQLstr += " FirstName=" + "'" + updated.FirstName + "',";
        SQLstr += "MiddleInitial=" + "'" + updated.MiddleInitial + "',";
        SQLstr += "LastName=" + "'" + updated.LastName + "',";
        SQLstr += "Address=" + "'" + updated.Address + "',";
        SQLstr += "City=" + "'" + updated.City + "',";
        SQLstr += "Region=" + "'" + updated.Region + "',";
        SQLstr += "PostalCode=" + "'" + updated.PostalCode + "',";
        SQLstr += "Country=" + "'" + updated.Country + "',";
        SQLstr += "HomePhone=" + "'" + updated.HomePhone + "',";
        SQLstr += "WorkPhone=" + "'" + updated.WorkPhone + "',";
        SQLstr += "CellPhone=" + "'" + updated.CellPhone + "',";
        SQLstr += "Email=" + "'" + updated.Email + "',";
        SQLstr += "Gender=" + "'" + ((int)updated.Gender).ToString() + "',";
        SQLstr += "DateOfBirth=" + "'" + updated.DateOfBirth + "',";
        SQLstr += "ReceiveSpam=" + "'" + updated.ReceiveSpam + "',";
        SQLstr += "MembershipLevel=" + "'" + ((int)updated.MembershipLevel).ToString() + "'";

        SQLstr += " WHERE Username = '" + userName + "';";  

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.Text;

        int ret = myCmd.ExecuteNonQuery();

        conn.Close();

        return ret;
    }

    public static int UpdatePassword(Profile updated)
    {
        string userName = updated.UserName;

        string connstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);

        conn.Open();

        string SQLstr = "UPDATE MemberProfiles SET";
        SQLstr += " Password=" + "'" + updated.Password + "'";
        SQLstr += " WHERE Username = '" + userName + "'";

        SqlCommand myCmd = new SqlCommand(SQLstr, conn);
        myCmd.CommandType = CommandType.Text;

        int ret = myCmd.ExecuteNonQuery();

        conn.Close();

        return ret;
    }



}