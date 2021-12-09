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
    public partial class TeamAssign : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DeleteButton.Enabled = false;
                LoadMember();
                LoadProject();
                Fillgrid();
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand sqlcmd = new SqlCommand("TaskCreateOrUpdate", con);
            sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ID", (hfID.Value == "" ? 0 : Convert.ToInt32(hfID.Value)));
            sqlcmd.Parameters.AddWithValue("@Name", TaskTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Project", ProjectList.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Member", MemberList.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Date", DeadTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Disc", DiscTextBox.Text.Trim()); 
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
            SqlCommand cmd = new SqlCommand("TaskDeletebyID", con);
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
        public void Clear()
        {
            hfID.Value = "";
            TaskTextBox.Text = "";
            DeadTextBox.Text = "";
            DiscTextBox.Text = "";
            ProjectList.SelectedIndex = 0;
            MemberList.SelectedIndex = 0;
            SuccessLable.Text =
            ErrorLable.Text = String.Empty;
            SaveButton.Text = "Save";
            DeleteButton.Enabled = false;

        }
        protected void lnk_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("TaskViewbyID", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@ID", ID);

            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            hfID.Value = ID.ToString();
            TaskTextBox.Text = dtbl.Rows[0]["Name"].ToString();
            ProjectList.Text = dtbl.Rows[0]["Project"].ToString();
            MemberList.Text = dtbl.Rows[0]["Member"].ToString();
            DeadTextBox.Text = dtbl.Rows[0]["Date"].ToString();
            DiscTextBox.Text = dtbl.Rows[0]["Discription"].ToString();
            SaveButton.Text = "Update";
            DeleteButton.Enabled = true;
            SaveButton.Enabled = true;

        }
        public void Fillgrid()
        {
            SqlConnection con = new SqlConnection(cs);

            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("TaskViewAll", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            GVTask.DataSource = dtbl;
            GVTask.DataBind();

        }
        void LoadMember()
        {
            SqlConnection con = new SqlConnection(cs);
            string q = "select * from Users where Type ='Employee'";
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            System.Data.DataTable dt = new System.Data.DataTable();
            da.Fill(dt);
            MemberList.DataSource = dt;
            MemberList.DataTextField = "Name";
            MemberList.DataValueField = "Name";
            MemberList.DataBind();
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
    }
}