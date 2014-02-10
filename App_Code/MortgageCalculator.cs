using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MortgageCalculator
/// </summary>
public class MortgageCalculator
{
    double principle;
    double rate;
    int numPayments;

	public MortgageCalculator(double aprinciple, double arate, int anumPayments)
	{
        principle = aprinciple;
        rate = arate;
        numPayments = anumPayments;
	}

    public override string ToString()
    {
        double result = ComputeMonthlyPay(principle,rate,numPayments);

        return "P= " + principle.ToString() + "; I= " + rate.ToString() + "; N= " + numPayments.ToString() + " --> " + result.ToString("C");

    }

    double ComputeMonthlyPay(double P, double r, int n)
    {
        //Formula: c = rP / (1 - (1+r)^-N)

        if (principle < 0 || rate < 0 || numPayments <= 0)
        {
            return Double.NaN;
        }
        
        r = r / 100.0;
        r = r / 12.0;

        double ret;

        if (r != 0)
            ret = (double)(r * P) / (double)(1 - Math.Pow((double)(1 + r), (double)(-n)));
        else
            ret = P / n;

        return ret;
    }

}