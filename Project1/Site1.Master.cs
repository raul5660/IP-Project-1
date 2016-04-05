using System;
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
            String Username = UsernameSignIn.Text;
            String Password = PasswordSignIn.Text;

            if (Database.SignIn(Username, Password))
            {
                Database.CreateUserSession(Username);
                Response.Redirect("");
            }
        }
    }
}