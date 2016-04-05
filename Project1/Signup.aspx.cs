﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSignUp_Click(object sender, EventArgs e)
        {
            if (Database.IsValidEmail(EmailSignUp.Text) &&
                ConfirmPasswordSignUp.Text == PasswordSignUp.Text)
            {
                Database.CreateUser(
                    UserNameSignUp.Text,
                    PasswordSignUp.Text,
                    FirstNameSignup.Text,
                    LastNameSignUp.Text,
                    EmailSignUp.Text,
                    "user");
            }
        }
    }
}