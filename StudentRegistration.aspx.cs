using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.IO;

public partial class Investor_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ppath;
        string file;

        try
        {
            // File Upload Handling
            if (FileUpload1.HasFile)
            {
                string uniqueFileName = Path.GetFileNameWithoutExtension(FileUpload1.FileName) + "_" + DateTime.Now.Ticks + Path.GetExtension(FileUpload1.FileName);
                ppath = Server.MapPath("~/user/image/") + "/" + uniqueFileName;
                FileUpload1.SaveAs(ppath);
                file = uniqueFileName;
            }
            else
            {
                file = "cusdummy.png"; // Default Image
            }

            // Password Hashing
           

            // Database Insertion
            using (SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = "INSERT INTO Students_Registration (StudentName, CollegeName, Degree, Experience, Languages, MobileNumber, EmailAddress, Password, logo) " +
                                      "VALUES (@StudentName, @CollegeName, @Degree, @Experience, @Languages, @MobileNumber, @Email, @Password, @logo)";

                    // Adding parameters
                    cmd.Parameters.AddWithValue("@StudentName", txtStudentName.Text);
                    cmd.Parameters.AddWithValue("@CollegeName", txtCollegeName.Text);
                    cmd.Parameters.AddWithValue("@Degree", txtDegree.Text);
                    cmd.Parameters.AddWithValue("@Experience", txtExpertise.Text);
                    cmd.Parameters.AddWithValue("@Languages", txtLanguages.Text);
                    cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@logo", file);

                    int n = cmd.ExecuteNonQuery();
                    if (n > 0)
                    {
                        txtStudentName.Text = "";
                        txtCollegeName.Text = "";
                        txtDegree.Text = "";
                        txtExpertise.Text = "";
                        txtLanguages.Text = "";
                        txtMobile.Text = "";
                        txtEmail.Text = "";
                        txtPassword.Text = "";



                        Response.Write("<script>alert('Student registered successfully!');</script>");
                    
                    
                    }
                    else
                    {
                        Response.Write("<script>alert('Error in registration. Please try again.');</script>");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
        }
    }



}


 
