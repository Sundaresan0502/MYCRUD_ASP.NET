using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection SqlCon = new SqlConnection(@"Data Source=HP\SQLEXPRESS01;Initial Catalog = PersonDetails;Integrated Security = True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btndelete.Enabled = false;
                FillGridView();
            }
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            clear();
        }
        public void clear()
        {
            PersonId.Value = "";
            First_Name.Text = Last_Name.Text = Email.Text = Mobile_Number.Text = Phone_Number.Text = Address1.Text = Address2.Text = "";
            Gender.ClearSelection();
            Address_Type_1.ClearSelection();
            Address_Type_2.ClearSelection();
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnsave.Text = "Save";
            btndelete.Enabled = false;
        }

        void FillGridView()
        {
            if (SqlCon.State == ConnectionState.Closed)
            {
                SqlCon.Open();
            }
            SqlDataAdapter sqlda = new SqlDataAdapter("PersonViewData", SqlCon);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            SqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if(SqlCon.State == ConnectionState.Closed)
            {
                SqlCon.Open();
            }
            SqlCommand SqlCmd = new SqlCommand("InsertandUpdate", SqlCon);
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.Parameters.AddWithValue("@PersonId",(PersonId.Value==""?0:Convert.ToInt32(PersonId.Value)));
            SqlCmd.Parameters.AddWithValue("@First_Name", First_Name.Text.Trim());
            SqlCmd.Parameters.AddWithValue("@Last_Name", Last_Name.Text.Trim());
            SqlCmd.Parameters.AddWithValue("@Gender",Gender.Text.Trim());
            SqlCmd.Parameters.AddWithValue("@Email", Email.Text.Trim());
            SqlCmd.Parameters.AddWithValue("@Phone_Number",Phone_Number.Text.Trim());
            SqlCmd.Parameters.AddWithValue("@Mobile_Number",Mobile_Number.Text.Trim());
            SqlCmd.Parameters.AddWithValue("@Address1", Address1.Text.Trim());
            SqlCmd.Parameters.AddWithValue("@Address2", Address2.Text.Trim());
            SqlCmd.Parameters.AddWithValue("@Address_Type_1",Convert.ToInt32(Address_Type_1.SelectedValue));
            SqlCmd.Parameters.AddWithValue("@Address_Type_2",Convert.ToInt32(Address_Type_2.SelectedValue));
            SqlCmd.ExecuteNonQuery();
            SqlCon.Close();
            String PersonID = PersonId.Value;
            clear();
            if (PersonID == "")
                lblSuccessMessage.Text = "Saved Successfully";
            else
                lblSuccessMessage.Text = "Updated Successfully";
            FillGridView();
        }
        protected void Edit_OnClick(object sender,EventArgs e)
        {
            int onthisPersonId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (SqlCon.State == ConnectionState.Closed)
            {
                SqlCon.Open();
            }
            SqlDataAdapter sqlda = new SqlDataAdapter("PersonIdView", SqlCon);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@PersonId",onthisPersonId);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            SqlCon.Close();
            PersonId.Value = onthisPersonId.ToString();
            First_Name.Text = dtbl.Rows[0]["First_Name"].ToString();
            Last_Name.Text = dtbl.Rows[0]["Last_Name"].ToString();
            Email.Text = dtbl.Rows[0]["Email"].ToString();
            Mobile_Number.Text = dtbl.Rows[0]["Mobile_Number"].ToString();
            Phone_Number.Text = dtbl.Rows[0]["Phone_Number"].ToString();
            Address1.Text = dtbl.Rows[0]["Permanent_Address"].ToString();
            Address2.Text = dtbl.Rows[0]["Residential_Address"].ToString();
            String SGender = dtbl.Rows[0]["Gender"].ToString();
            Address_Type_1.SelectedValue = "1";
            Address_Type_2.SelectedValue = "2";
            Gender.SelectedValue = SGender;
            btnsave.Text = "Update";
            btndelete.Enabled = true;
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (SqlCon.State == ConnectionState.Closed)
            {
                SqlCon.Open();
            }
            SqlCommand SqlCmd = new SqlCommand("PersonDelete",SqlCon);
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.Parameters.AddWithValue("@PersonId",Convert.ToInt32(PersonId.Value));
            SqlCmd.ExecuteNonQuery();
            SqlCon.Close();
            clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Succesfully";
        }
    }
}