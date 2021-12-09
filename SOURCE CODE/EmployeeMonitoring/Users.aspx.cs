using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace EmployeeMonitoring
{
    public partial class Users : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DeleteButton.Enabled = false;

                Fillgrid();
            }
        }
            protected void SaveButton_Click(object sender, EventArgs e)
            {
                SqlConnection con = new SqlConnection(cs);
                if (con.State == System.Data.ConnectionState.Closed)
                    con.Open();
                SqlCommand sqlcmd = new SqlCommand("ProfileCreateOrUpdate", con);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@ID", (hfID.Value == "" ? 0 : Convert.ToInt32(hfID.Value)));
                sqlcmd.Parameters.AddWithValue("@Name", NameBox.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Uname", UNameBox.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Mail", Mailbox.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Pass", PassBox.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Cpass", CPassBox.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Add", AddBox.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Con", ContactBox.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Bank", Bankbox.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@CNIC", CNICBox.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Type", TypeList.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Status", StatusList.Text.Trim());

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
            }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {

                SqlConnection con = new SqlConnection(cs);
                if (con.State == System.Data.ConnectionState.Closed)
                    con.Open();
                SqlCommand cmd = new SqlCommand("ProfileDeletebyID", con);
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
                SqlDataAdapter sqlda = new SqlDataAdapter("ProfileViewbyID", con);
                sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlda.SelectCommand.Parameters.AddWithValue("@ID", ID);
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlda.Fill(dtbl);
                con.Close();
                hfID.Value = ID.ToString();
            NameBox.Text = dtbl.Rows[0]["Name"].ToString();
            UNameBox.Text = dtbl.Rows[0]["UserName"].ToString();
            Mailbox.Text = dtbl.Rows[0]["Email"].ToString();
            PassBox.Text = dtbl.Rows[0]["Password"].ToString();
            CPassBox.Text = dtbl.Rows[0]["CPassword"].ToString();
            ContactBox.Text = dtbl.Rows[0]["Contact"].ToString();
            AddBox.Text = dtbl.Rows[0]["Address"].ToString();
            CNICBox.Text = dtbl.Rows[0]["CNIC"].ToString();
            Bankbox.Text = dtbl.Rows[0]["Bank"].ToString();
            TypeList.Text = dtbl.Rows[0]["Type"].ToString();
            StatusList.Text = dtbl.Rows[0]["Status"].ToString();
            SaveButton.Text = "Update";
                DeleteButton.Enabled = true;
                SaveButton.Enabled = true;

            }
            public void Fillgrid()
            {
                SqlConnection con = new SqlConnection(cs);

                if (con.State == System.Data.ConnectionState.Closed)
                    con.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("ProfileViewAll", con);
                sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlda.Fill(dtbl);
                con.Close();
            GVUsers.DataSource = dtbl;
            GVUsers.DataBind();

            }

            public void Clear()
            {
                hfID.Value = "";
                NameBox.Text = "";
                Mailbox.Text = "";
                UNameBox.Text = "";
                PassBox.Text = ""; 
                CPassBox.Text = "";
                ContactBox.Text = "";
                AddBox.Text = "";
                Bankbox.Text = "";
                CNICBox.Text = "";
                TypeList.Text = "";
                StatusList.Text = "";
            ErrorLable.Text = String.Empty;
                SaveButton.Text = "Save";
                DeleteButton.Enabled = false;

            }
            //void LoadProject()
            //{
            //    SqlConnection con = new SqlConnection(cs);
            //    string q = "select * from Project";
            //    SqlDataAdapter da = new SqlDataAdapter(q, con);
            //    System.Data.DataTable dt = new System.Data.DataTable();
            //    da.Fill(dt);
            //    ProjectList.DataSource = dt;
            //    ProjectList.DataTextField = "Name";
            //    ProjectList.DataValueField = "Name";
            //    ProjectList.DataBind();
            //}
            //void LoadLeader()
            //{
            //    SqlConnection con = new SqlConnection(cs);
            //    string q = "select * from Users where Type ='Team Leader'";
            //    SqlDataAdapter da = new SqlDataAdapter(q, con);
            //    System.Data.DataTable dt = new System.Data.DataTable();
            //    da.Fill(dt);
            //    LeaderList.DataSource = dt;
            //    LeaderList.DataTextField = "Name";
            //    LeaderList.DataValueField = "Name";
            //    LeaderList.DataBind();
            //}
            //void LoadEmp()
            //{
            //    SqlConnection con = new SqlConnection(cs);
            //    string q = "select * from Users where Type ='Employee '";
            //    SqlDataAdapter da = new SqlDataAdapter(q, con);
            //    System.Data.DataTable dt = new System.Data.DataTable();
            //    da.Fill(dt);
            //    MemberList1.DataSource = dt;
            //    MemberList1.DataTextField = "Name";
            //    MemberList1.DataValueField = "Name";
            //    MemberList1.DataBind();
            //    MemberList2.DataSource = dt;
            //    MemberList2.DataTextField = "Name";
            //    MemberList2.DataValueField = "Name";
            //    MemberList2.DataBind();
            //    MemberList3.DataSource = dt;
            //    MemberList3.DataTextField = "Name";
            //    MemberList3.DataValueField = "Name";
            //    MemberList3.DataBind();


            //}
        }
    }