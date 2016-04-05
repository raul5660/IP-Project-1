using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Project1
{
    public static class Database
    {
        private static String SQLString = @"Data Source=WIN-BF1396ULF6F\SQLEXPRESS;Initial Catalog=CTF;Integrated Security=True";
        private static Boolean invalid;
        public static void CreateUser(String Username,String Password, String FirstName, String LastName, String Email, String AccountType)
        {
            SqlConnection db = new SqlConnection(SQLString);
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.Text;

            command.CommandText = $"INSERT [dbo].[User] (User_UserName, User_Password, User_FirstName, User_LastName, User_Email, User_AccountType) VALUES ('{Username}','{Password}','{FirstName}','{LastName}','{Email}','{AccountType}')";
            command.Connection = db;

            db.Open();

            try
            {
                command.ExecuteNonQuery();
            }
            catch
            {
            }
            finally
            {
                db.Close();
            }
        }
        public static bool IsValidEmail(string strIn)
        {
            invalid = false;
            if (String.IsNullOrEmpty(strIn))
                return false;

            // Use IdnMapping class to convert Unicode domain names.
            strIn = Regex.Replace(strIn, @"(@)(.+)$", DomainMapper);
            if (invalid)
                return false;

            // Return true if strIn is in valid e-mail format.
            return Regex.IsMatch(strIn,
                   @"^(?("")(""[^""]+?""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
                   @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9]{2,17}))$",
                   RegexOptions.IgnoreCase);
        }
        private static string DomainMapper(Match match)
        {
            // IdnMapping class with default property values.
            IdnMapping idn = new IdnMapping();

            string domainName = match.Groups[2].Value;
            try
            {
                domainName = idn.GetAscii(domainName);
            }
            catch (ArgumentException)
            {
                invalid = true;
            }
            return match.Groups[1].Value + domainName;
        }
    }
}