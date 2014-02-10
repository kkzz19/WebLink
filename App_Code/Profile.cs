using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MemberProfile
/// </summary>
/// 
public enum GenderType
{
    Male,
    Female,
    NotSpecified
};

public enum MembershipType
{
    Guest,
    Bronze,
    Silver,
    Gold,
    Platinum
};

public class Profile
{
    private int memberID;
    private string userName;
    private string visibleUserName;
    private string password;
    private string lastName;
    private string firstName;
    private string middleInitial;
    private string address;
    private string city;
    private string region;
    private string postalCode;
    private string country;
    private string homePhone;
    private string workPhone;
    private string cellPhone;
    private string email;
    private GenderType gender;
    private DateTime dateOfBirth;
    private DateTime joinDate;
    private bool receiveSpam;
    private MembershipType membershipLevel;
    private List<String> otherMemberships;
    private bool isAdmin;

    public int MemberID { get { return memberID; } set { memberID = value; } }
    public string UserName { get { return userName; } }    //(Read Only) This is the username, all lowercase.
    public string VisibleUserName { get { return visibleUserName; } } //(Read only) This is the username as was entered in in the data field
    public string Password { get { return password; } set { password = value; } }
    public string LastName{ get { return lastName; } set { lastName = value; } }
    public string FirstName{ get { return firstName; } set { firstName = value; } }
    public string MiddleInitial{ get { return middleInitial; } set { middleInitial = value; } }
    public string Address{ get { return address; } set { address = value; } }
    public string City{ get { return city; } set { city = value; } }
    public string Region{ get { return region; } set { region = value; } }
    public string PostalCode{ get { return postalCode; } set { postalCode = value; } }
    public string Country{ get { return country; } set { country = value; } }
    public string HomePhone{ get { return homePhone; } set { homePhone = value; } }
    public string WorkPhone{ get { return workPhone; } set { workPhone = value; } }
    public string CellPhone{ get { return cellPhone; } set { cellPhone = value; } }
    public string Email{ get { return email; } set { email = value; } }
    public GenderType Gender{ get { return gender; } set { gender = value; } }
    public DateTime DateOfBirth{ get { return dateOfBirth; } set { dateOfBirth = value; } }
    public DateTime JoinDate { get { return joinDate; } }           //(Read only)
    public bool ReceiveSpam{ get { return receiveSpam; } set { receiveSpam = value; } }
    public MembershipType MembershipLevel{ get { return membershipLevel; } set { membershipLevel = value; } }
    public List<String> OtherMemberships{ get { return otherMemberships; } set { otherMemberships = value; } }
    public bool IsAdmin { get { return isAdmin; } set { isAdmin = value; } }

    public void SetUserName(string aname){userName = aname;}
    public void SetVisibleUserName(string aname) { visibleUserName = aname; }
    public void SetJoinDate(DateTime atime) { joinDate = atime; }

	public Profile()
	{
	}

    //This constructor accepts the username that the user typed in (i.e. in the case he typed it in)
    public Profile(string aUserName)
    {
        userName = aUserName.ToLower();     //The username itself is the one to be stored in database. Needs to be converted to lowercase
        visibleUserName = aUserName;        //The visible username is the one as originally submitted in the text box        
    }

    public void SetJoinDate()
    {
        joinDate = DateTime.Now; 
    }

    public override string ToString()
    {
        string retString;

        retString = 
            MemberID.ToString() + "<br/>" +
            UserName + "<br/>" +
            VisibleUserName + "<br/>" +
            Password + "<br/>" +
            FirstName + "<br/>" +
            MiddleInitial + "<br/>" +
            LastName + "<br/>" +
            Address + "<br/>" +
            City + "<br/>" +
            Region + "<br/>" +
            PostalCode + "<br/>" +
            Country + "<br/>" +
            HomePhone + "<br/>" +
            WorkPhone + "<br/>" +
            CellPhone + "<br/>" +
            Email + "<br/>" +
            Gender.ToString() + "<br/>" +
            DateOfBirth.ToString() + "<br/>" +
            JoinDate.ToString() + "<br/>" +
            ReceiveSpam + "<br/>" +
            MembershipLevel.ToString() + "<br/>";

        for (int i = 0; otherMemberships != null && i < otherMemberships.Count; i++)
        {
            retString += otherMemberships[i] + "<br/>";
        }

        return retString;
            
    }

}