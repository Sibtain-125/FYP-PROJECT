using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeMonitoring
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string useremail = Session["Email"].ToString();
                string usertype = Session["Type"].ToString();
                //string status = Session["usertype"].ToString();
                if (usertype == "Applicant")
                {
                    B1.Visible = false;
                    B2.Visible = false;
                    B3.Visible = false;
                    B4.Visible = false;
                    B5.Visible = false;
                    B6.Visible = false;
                    B7.Visible = false;
                    B8.Visible = false;
                }
                if (usertype == "HR")
                {
                    B1.Visible = true;
                    B2.Visible = true;
                    B3.Visible = true;
                    B4.Visible = true;
                    B5.Visible = true;
                    B6.Visible = true;
                    B7.Visible = true;
                    B8.Visible = true;
                }
                if (usertype == "Admin")
                {
                    B1.Visible = true;
                    B2.Visible = true;
                    B3.Visible = true;
                    B4.Visible = true;
                    B5.Visible = true;
                    B6.Visible = true;
                    B7.Visible = true;
                    B8.Visible = true;
                }
                if (usertype == "Employee")
                {
                    B1.Visible = true;
                    B2.Visible = true;
                    B3.Visible = true;
                    B4.Visible = true;
                    B5.Visible = true;
                    B6.Visible = true;
                    B7.Visible = true;
                    B8.Visible = true;
                }
            }

        }
    }
}