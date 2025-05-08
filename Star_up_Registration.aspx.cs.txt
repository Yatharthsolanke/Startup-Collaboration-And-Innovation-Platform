using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Investor_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ppath;
        string file;


        if (FileUpload1.HasFile == true)
        {
            ppath = Server.MapPath("~/Startup/logo/") + "/" + FileUpload1.FileName;

            FileUpload1.SaveAs(ppath);
            file = FileUpload1.FileName;
        }
        else
        {
            file = "cusdummy.png";
        }






        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        SqlCommand cmd = new SqlCommand();

        try
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Star_UpRegistration (FirmName, InvestorName, RegistrationNumber, GSTNumber, MobileNumber, category,Email , IWebsite , Contact,Password , logo ) " +
                              "VALUES (@FirmName, @InvestorName, @RegistrationNumber, @GSTNumber, @MobileNumber,@category, @Email , @IWebsite , @Contact ,@Password , @logo )";

           
            cmd.Parameters.AddWithValue("@FirmName", txtFirmName.Text);
            cmd.Parameters.AddWithValue("@InvestorName", txtInvestorName.Text);
            cmd.Parameters.AddWithValue("@RegistrationNumber", txtRegistrationNumber.Text);
            cmd.Parameters.AddWithValue("@GSTNumber", txtGSTNumber.Text);
            cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text);
            cmd.Parameters.AddWithValue("@category", ddlcategory.Text);            
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@IWebsite", txtwebsite.Text);
            cmd.Parameters.AddWithValue("@Contact", txtcontact.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@logo", file);
            
            // Execute the command
            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                Response.Write("<script>alert('Star_Up registered successfully!');</script>");
                

                txtFirmName.Text = "";
                txtInvestorName.Text = "";
                txtRegistrationNumber.Text = "";
                txtGSTNumber.Text = "";
                txtMobile.Text = "";
                txtEmail.Text = "";
                txtwebsite.Text = "";
                txtcontact.Text = "";
                txtPassword.Text = "";
            }
            else
            {
                Response.Write("<script>alert('Error in registration. Please try again.');</script>");
                Response.Write("<script>window.location.href='Star_up_Registration.aspx';</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
        }
        finally
        {
            con.Close();
        }

    }
}


 
