using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeMonitoring
{
    public partial class newjobapply : System.Web.UI.Page
    {
        Connection objCS = new Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               this.GridView1_SelectedIndexChanged(GridView1, EventArgs.Empty);
            }
            string email = "";
            if (Session["Email"] != null)
                email = Session["Email"].ToString();
            TextBoxuser.Text = email;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(objCS.Conn()); con = objCS.conOpen();
            string q = "insert into Newjobs(UserEmail,Available_Job,Cover_Title,Expected_Salary)values(@UserEmail,@Available_Job,@Cover_Title,@Expected_Salary)";

            SqlCommand cmd = new SqlCommand(q, con);
            string email = "";
            if (Session["Email"] != null)
                email = Session["Email"].ToString();
            cmd.Parameters.AddWithValue("@UserEmail", email);
            cmd.Parameters.AddWithValue("@Available_Job", DropDownListavailable.Text);
            cmd.Parameters.AddWithValue("@Cover_Title", TextBoxcover.Text);
            cmd.Parameters.AddWithValue("@Expected_Salary", TextBoxexpected.Text);
            cmd.ExecuteNonQuery();
            this.GridView1_SelectedIndexChanged(GridView1, EventArgs.Empty);
            Session["Available_Job"] = DropDownListavailable.Text;
            //0  GridView1_SelectedIndexChanged(GridView1, EventArgs.Empty);
            objCS.conClose();

        }

        protected void 
            GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(objCS.Conn()); con = objCS.conOpen();
            string q1 = "select * from Newjobs";
            SqlCommand cmd = new SqlCommand(q1, con);
            SqlDataAdapter dt = new SqlDataAdapter(cmd);
            DataTable d = new DataTable();
            dt.Fill(d);
            GridView1.DataSource = d;
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            hfid.Value = "";
            DropDownListavailable.Text = TextBoxcover.Text = TextBoxexpected.Text = "";
        }
    }
}