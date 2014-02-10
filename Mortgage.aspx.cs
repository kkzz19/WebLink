using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mortgage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            monthlyPaymentLabel1.Visible = false;
            monthlyPaymentLabel2.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        monthlyPaymentLabel1.Visible = false;
        monthlyPaymentLabel2.Visible = false;

        double principle;
        double rate;
        int numPayments;

        bool principleSuc = Double.TryParse(principleBox.Text, out principle);
        bool rateSuc = Double.TryParse(rateBox.Text, out rate);
        bool paySuc = Int32.TryParse(paymentNumBox.Text, out numPayments);

        MortgageCalculator myCalculator = new MortgageCalculator(principle, rate, numPayments);

        monthlyPaymentLabel2.Text = myCalculator.ToString();

        if (Page.IsValid)
        {
            monthlyPaymentLabel1.Visible = true;
            monthlyPaymentLabel2.Visible = true;
        }
    }

    Decimal ComputeMonthlyPay(Decimal P, Decimal r, int n)
    {
        //c = rP / (1 - (1+r)^-N)

        r = r / 100.0m;
        r = r / 12.0m;

        Decimal ret = (Decimal)(r * P) / (Decimal)(1 - Math.Pow((double)(1+r), (double)(-n)));

        return ret;
    }
    protected void backButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("MemberWelcome.aspx");
    }
}

