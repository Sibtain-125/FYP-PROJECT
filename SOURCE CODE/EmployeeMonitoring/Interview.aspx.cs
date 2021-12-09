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
    public partial class Interview : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                if (!IsPostBack)
                {
                    BindDropDownList();
                    DeleteButton.Enabled = false;
                }
                Fillgrid();
            }
            string email = "";
            if (Session["Email"] != null)
                email = Session["Email"].ToString();
            TextBoxuser.Text = email;
        }
        void BindDropDownList()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Recruitment";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "Job_Type";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();
            ListItem SelectItem = new ListItem("select Job", "-1");
            SelectItem.Selected = true;
            DropDownList1.Items.Insert(0, SelectItem);
        }
       protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "-1")
            {
                Response.Write("Please Select a Job...");
            }
            else
            {
                Response.Write("Select Job Text is:  "+DropDownList1.SelectedItem.Text);
            }
            SqlConnection con = new SqlConnection(cs);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand sqlcmd = new SqlCommand("InterviewCreateOrUpdate", con);
            sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@id", (hfid.Value == "" ? 0 : Convert.ToInt32(hfid.Value)));
            string email = "";
            if (Session["Email"] != null)
                email = Session["Email"].ToString();
            sqlcmd.Parameters.AddWithValue("@UserEmail", email);
            sqlcmd.Parameters.AddWithValue("@Apply_Job", DropDownList1.SelectedItem.Text);
            sqlcmd.Parameters.AddWithValue("@Obtain_Score", TextBoxobtain.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Total_Score", TextBoxtotal.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Select_For_Job", CheckBoxListselect.Text.Trim());
            sqlcmd.ExecuteNonQuery();
            con.Close();
            Clear();
            string Interviewid = hfid.Value;
            if (Interviewid == "")
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
        protected void ClearButton_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            hfid.Value = "";
            TextBoxobtain.Text = "";
            TextBoxtotal.Text = "";
            CheckBoxListselect.Text = "";
            SaveButton.Text = "Save";
            DeleteButton.Enabled = false;
            SuccessLable.Text = "";
            // ErrorLable.Text = "";
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlCommand cmd = new SqlCommand("InterviewDeletebyID", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(hfid.Value));
            cmd.ExecuteNonQuery();
            con.Close();
            Clear();
            Fillgrid();
            //ErrorLabel.Text = "Account Successfully Deleted";
        }
        public void Fillgrid()
        {
            SqlConnection con = new SqlConnection(cs);

            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("InterviewViewAll", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            GVProject.DataSource = dtbl;
            GVProject.DataBind();

        }
        protected void lnk_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlda = new SqlDataAdapter("InterviewViewbyID", con);
            sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@id", ID);

            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            hfid.Value = ID.ToString();
            TextBoxobtain.Text = dtbl.Rows[0]["Obtain_Score"].ToString();
            TextBoxtotal.Text = dtbl.Rows[0]["Total_Score"].ToString();
            CheckBoxListselect.Text = dtbl.Rows[0]["Select_For_Job"].ToString();
            SaveButton.Text = "Update";
            DeleteButton.Enabled = true;
            SaveButton.Enabled = true;
        }
    }
}