using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;

public partial class Startup_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["st_id"] != null)
        {
            int startupId = (int)Session["st_id"];
            DisplayStartupDetails(startupId);
        }
        else
        {
            Response.Redirect("../home.aspx");
        }
    }

    private void DisplayStartupDetails(int startupId)
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["LIS"];
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string query = "SELECT [st_id], [logo], [FirmName], [InvestorName], [RegistrationNumber], [GSTNumber], [MobileNumber], [Category], [Email], [IWebsite], [Contact], [Password] " +
                           "FROM [Star_UpRegistration] WHERE [st_id] = @st_id";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@st_id", startupId);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        lblFirmName.Text = dr["FirmName"].ToString();
                        lblInvestorName.Text = dr["InvestorName"].ToString();
                        lblRegistrationNumber.Text = dr["RegistrationNumber"].ToString();
                        lblGSTNumber.Text = dr["GSTNumber"].ToString();
                        lblMobileNumber.Text = dr["MobileNumber"].ToString();
                        lblCategory.Text = dr["Category"].ToString();
                        lblEmail.Text = dr["Email"].ToString();

                        // Set website link
                        hlWebsite.NavigateUrl = dr["IWebsite"].ToString();

                        // Set the startup logo image
                        if (dr["logo"] != DBNull.Value)
                        {
                            
                            StartupLogo.ImageUrl = "logo/" + dr["logo"];
                        }
                    }
                    else
                    {
                        // Handle case where the startup is not found in the database
                        Response.Redirect("../home.aspx");
                    }
                }
            }
        }
    }

    



}

