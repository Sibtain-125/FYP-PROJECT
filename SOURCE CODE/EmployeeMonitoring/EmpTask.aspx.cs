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
    public partial class EmpTask : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBEM"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                Fillgrid();
            }
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
            //NameTextBox.Text = dtbl.Rows[0]["Name"].ToString();
            //LeaderList.Text = dtbl.Rows[0]["Leader"].ToString();
            //ProjectList.Text = dtbl.Rows[0]["Project"].ToString();
            //MemberList1.Text = dtbl.Rows[0]["M1"].ToString();
            //MemberList2.Text = dtbl.Rows[0]["M2"].ToString();
            //MemberList3.Text = dtbl.Rows[0]["M3"].ToString();
            //SaveButton.Text = "Update";
            //DeleteButton.Enabled = true;
            //SaveButton.Enabled = true;
        }
        public void Fillgrid()
        {
            SqlConnection con = new SqlConnection(cs);

            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
            string q = "Select * from task";
            SqlDataAdapter sqlda = new SqlDataAdapter(q,con);
           // sqlda.SelectCommand.CommandType = System.Data.CommandType.StoredProcedure;
            System.Data.DataTable dtbl = new System.Data.DataTable();
            sqlda.Fill(dtbl);
            con.Close();
            GVTask.DataSource = dtbl;
            GVTask.DataBind();

        }
    }
}