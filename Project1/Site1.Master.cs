﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void SignIn_Click(object sender, EventArgs e)
        {
            // Get username and password from navbar sign-in
            String Username = UsernameSignIn.Text;
            String Password = PasswordSignIn.Text;

            // Logs user in if creds are correct
            if (Database.SignIn(Username, Password))
            {
                //creates session in database
                HttpCookie cookie = Database.CreateUserSession(Username);
                // add cookie
                Response.Cookies.Add(cookie);
                // will redirect to appropriate page.
                Response.Redirect(@"GameBoard\User.aspx");
            }
            // invalid account message
            else
            {
                //LblValUser.Text = "Invalid account";
                //LblValUser.Visible = true;
            }
        }
    }
}