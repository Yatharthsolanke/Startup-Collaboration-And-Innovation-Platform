using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management;
using System.Net;
using System.Configuration;
using System.Data.SqlClient;
public partial class Startup_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["StudentID"] != null)
        {
            //int studentId = (int)Session["st_id"];
            DisplayStudentDetails();
        }
        else
        {
            //Response.Redirect("Login.aspx");
        }
    }


    private void DisplayStudentDetails()
    {
        string connectionString = System.Configuration.ConfigurationManager.AppSettings["LIS"];
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string query = "SELECT [StudentID], [StudentName], [CollegeName], [Degree], [Experience], [Languages], [MobileNumber], [EmailAddress], [Password], [Resume], [PortfolioLink], [Logo] " +
                           "FROM [Students_Registration] WHERE [StudentID] = @StudentID";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@StudentID", Session["StudentID"]);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        lblStudentName.Text = dr["StudentName"].ToString();
                        lblCollegeName.Text = dr["CollegeName"].ToString();
                        lblDegree.Text = dr["Degree"].ToString();
                        lblExperience.Text = dr["Experience"].ToString();
                        lblLanguages.Text = dr["Languages"].ToString();
                        lblMobileNumber.Text = dr["MobileNumber"].ToString();
                        lblEmailAddress.Text = dr["EmailAddress"].ToString();

                        // Set portfolio and resume links
                        hlPortfolioLink.NavigateUrl = dr["PortfolioLink"].ToString();
                        hlResume.NavigateUrl = dr["Resume"].ToString();

                        // Set the student logo image
                        if (dr["Logo"] != DBNull.Value)
                        {
                           
                            StudentLogo.ImageUrl = "image/" + dr["Logo"];
                        }
                    }
                    else
                    {
                        //// Handle case where the student is not found in the database
                        //Response.Redirect("ErrorPage.aspx");
                    }
                }
            }
        }
    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
         // Or wherever you want to navigate
    }


}

