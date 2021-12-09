using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeMonitoring
{
    public partial class Team : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DeleteButton.Enabled = false;
                LoadProject();
                LoadLeader();
                LoadEmp();
                Fillgrid();
            }
            
        }
        void LoadProject()
        {
            SqlConnection con = new SqlConnection(cs);
            string q = "select * from Project";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            System.Data.DataTable dt = new System.Data.DataTable();
            da.Fill(dt);
            ProjectList.DataSource = dt;
            ProjectList.DataTextField = "Name";
            ProjectList.DataValueField = "Name";
            ProjectList.DataBind();
        }
        void LoadLeader()
        {
            SqlConnection con = new SqlConnection(cs);
            string q = "select * from Users where Type ='Team Leader'";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            System.Data.DataTable dt = new System.Data.DataTable();
            da.Fill(dt);
            LeaderList.DataSource = dt;
            LeaderList.DataTextField = "Name";
            LeaderList.DataValueField = "Name";
            LeaderList.DataBind();
        }
        void LoadEmp()
        {
            SqlConnection con = new SqlConnection(cs);
            string q = "select * from Users where Type ='Employee '";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            System.Data.DataTable dt = new System.Data.DataTable();
            da.Fill(dt);
            MemberList1.DataSource = dt;
            MemberList1.DataTextField = "Name";
            MemberList1.DataValueField = "Name";
            MemberList1.DataBind();
            MemberList2.DataSource = dt;
            MemberList2.DataTextField = "Name";
            MemberList2.DataValueField = "Name";
            MemberList2.DataBind();
            MemberList3.DataSource = dt;
            MemberList3.DataTextField = "Name";
            MemberList3.DataValueField = "Name";
            MemberList3.DataBind();


        }
        public void Clear()
        {
            hfID.Value = "";
            LeaderList.SelectedIndex = 0;
            ProjectList.SelectedIndex = 0;
            MemberList1.SelectedIndex = 0;
            MemberList2.SelectedIndex = 0;
            MemberList3.SelectedIndex = 0;
            SuccessLable.Text =
            NameTextBox.Text = 
            ErrorLable.Text = String.Empty;
            SaveButton.Text = "Save";
            DeleteButton.Enabled = false;
            
        }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand sqlcmd = new SqlCommand("TeamCreateOrUpdate", con);
            sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ID", (hfID.Value == "" ? 0 : Convert.ToInt32(hfID.Value)));
            sqlcmd.Parameters.AddWithValue("@Name", NameTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Leader", LeaderList.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Project", ProjectList.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@M1", MemberList1.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@M2", MemberList2.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@M3", MemberList3.Text.Trim());
            sqlcmd.ExecuteNonQuery();
            con.Close();
            Clear();
            string AccountID = hfID.Value;
            if (AccountID == "")
            {
                SuccessLable.Text = "Saved Successfully";
                //Session["status"] = StatusDownList.Text;
            }
            else
            {
                SuccessLable.Text = "Updated Successfully";
                //Session["status"] = StatusDownList.Text;
            }
            Fillgrid();
            //Session["status"] = StatusDownList.Text;
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(cs);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand("TeamDeletebyID", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(hfID.Value));
            cmd.ExecuteNonQuery();
            con.Close();
            Clear();
            Fillgrid();
            ErrorLable.Text = "Account Successfully Deleted";
        }
        protected void ClearButton_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void lnk_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("TeamViewbyID", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@ID", ID);
            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            hfID.Value = ID.ToString();
            NameTextBox.Text = dtbl.Rows[0]["Name"].ToString();
            LeaderList.Text = dtbl.Rows[0]["Leader"].ToString();
            ProjectList.Text = dtbl.Rows[0]["Project"].ToString();
            MemberList1.Text = dtbl.Rows[0]["M1"].ToString();
            MemberList2.Text = dtbl.Rows[0]["M2"].ToString();
            MemberList3.Text = dtbl.Rows[0]["M3"].ToString();
            SaveButton.Text = "Update";
            DeleteButton.Enabled = true;
            SaveButton.Enabled = true;
        }
        public void Fillgrid()
        {
            SqlConnection con = new SqlConnection(cs);

            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("TeamViewAll", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            GVTeam.DataSource = dtbl;
            GVTeam.DataBind();

        }
    }
}