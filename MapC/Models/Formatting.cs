using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MapC.Models
{
    public class Formatting
    {
        public static DateTime ConvertNullToDateTime(object oValue)
        {
            try
            {
                if (oValue != System.DBNull.Value)
                {
                    return Convert.ToDateTime(oValue);
                }
                else
                {
                    return DateTime.Now;
                }
            }
            catch { return DateTime.Now; }
        }
        public static string ConvertNullToString(object oValue)
        {
            try
            {
                if (oValue != System.DBNull.Value)
                {
                    return oValue.ToString().Trim();
                }
                else
                    return string.Empty;
            }
            catch
            {
                return string.Empty;
            }
        }
      
        public static int ConvertNullToInt32(object oValue)
        {
            try
            {
                if (oValue != System.DBNull.Value)
                {
                    int i = 0;
                    Boolean isInt = Int32.TryParse(oValue.ToString(), out i);
                    if (isInt == true)
                    {
                        return Convert.ToInt32(oValue);
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                return 0;
            }
        }
        public static string ConvertDateTimeToShortString(object oValue)
        {
            try
            {
                if (oValue != System.DBNull.Value)
                {
                    DateTime dt;
                    bool IsDate = DateTime.TryParse(oValue.ToString(), out dt);
                    if (IsDate == true)
                    {
                        return string.Format("{0:MM/dd/yyyy}", dt);
                    }
                    else
                    {
                        return "";
                    }
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                return "";
            }
        }
        public static decimal ConvertNullToDecimal(object oValue)
        {
            try
            {
                if (oValue != System.DBNull.Value)
                {
                    decimal i = 0;
                    Boolean isDecimal = Decimal.TryParse(oValue.ToString(), out i);
                    if (isDecimal == true)
                    {
                        return Convert.ToDecimal(oValue);
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    return 0;
                }
            }
            catch
            {
                return 0;
            }
        }

        public static double ConvertNullToDouble(object oValue)
        {
            try
            {
                if (oValue != System.DBNull.Value)
                {
                    decimal i = 0;
                    Boolean isDecimal = Decimal.TryParse(oValue.ToString(), out i);
                    if (isDecimal == true)
                    {
                        return Convert.ToDouble(oValue);
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    return 0;
                }
            }
            catch
            {
                return 0;
            }
        }
    }
}