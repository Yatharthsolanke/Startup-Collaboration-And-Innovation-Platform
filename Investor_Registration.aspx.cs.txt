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
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showCategory();
        }

       
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string ppath;
        string file;


        if (FileUpload1.HasFile == true)
        {
            ppath = Server.MapPath("~/Invester/logo/") + "/" + FileUpload1.FileName;

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
            cmd.CommandText = "INSERT INTO InvestorRegistration (FirmName, InvestorName, RegistrationNumber, GSTNumber, MobileNumber, category,Email , IWebsite , Contact , Password ,logo) " +
                              "VALUES (@FirmName, @InvestorName, @RegistrationNumber, @GSTNumber, @MobileNumber,@category, @Email, @IWebsite , @Contact , @Password , @logo)";
 
            cmd.Parameters.AddWithValue("@FirmName", txtFirmName.Text);
            cmd.Parameters.AddWithValue("@InvestorName", txtInvestorName.Text);
            cmd.Parameters.AddWithValue("@RegistrationNumber", txtRegistrationNumber.Text);
            cmd.Parameters.AddWithValue("@GSTNumber", txtGSTNumber.Text);
            cmd.Parameters.AddWithValue("@MobileNumber", txtMobile.Text);
            cmd.Parameters.AddWithValue("@category", cblCategory.Text);            
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@IWebsite", txtwebsite.Text);
            cmd.Parameters.AddWithValue("@Contact", txtcontact.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@logo", file);

            // Execute the command
            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                Response.Write("<script>alert('Investor registered successfully!');</script>");
               

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
                Response.Write("<script>window.location.href='Investor_Registration.aspx';</script>");
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


    // This is your method for binding categories (unchanged)
    void showCategory()
    {
        con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        con.Open();
        cmd.CommandText = "SELECT CategoryID, CategoryName FROM Category"; // Ensure you select the ID as well for the checkbox value
        cmd.Connection = con;

        SqlDataReader dr = cmd.ExecuteReader();
        cblCategory.Items.Clear(); // Clear existing items before binding new ones

        // Loop through all rows returned by the query
        while (dr.Read())
        {
            string categoryName = dr.GetString(1); // CategoryName is the second column (index 1)
            int categoryID = dr.GetInt32(0); // CategoryID is the first column (index 0)

            // Add the item to the CheckBoxList (you may use CategoryID as the Value and CategoryName as the Text)
            cblCategory.Items.Add(new ListItem(categoryName, categoryID.ToString()));
        }

        // Close the reader and connection
        dr.Close();
        con.Close();
    }

 



}



