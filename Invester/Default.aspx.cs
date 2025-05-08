using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Invester_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadInvestorDetails();
        }
    }

    private void LoadInvestorDetails()
    {
        // Connection string from web.config or app settings
        string connectionString = ConfigurationManager.AppSettings["LIS"];

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            try
            {
                con.Open();
                string query = "SELECT logo, FirmName, InvestorName, RegistrationNumber, GSTNumber, " +
                               "MobileNumber, Category, Email, IWebsite, Contact " +
                               "FROM InvestorRegistration where in_id="+Session["in_id"];

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                // Bind data to Repeater
                InvestorRepeater.DataSource = dt;
                InvestorRepeater.DataBind();

                // If no data found
                if (dt.Rows.Count == 0)
                {
                    Response.Write("<script>alert('Error loading investor details: ');</script>");
                }
            }
            catch (Exception ex)
            {
                // Log the error or display a user-friendly error message
                Response.Write("<script>alert('Error loading investor details: " + ex.Message + "');</script>");
            }
        }
    }


}