using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }







    protected void btnsig_in_Click(object sender, EventArgs e)
    {
        if (ddlUserType.SelectedItem.ToString() == "Investor")
        {
            con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select   in_id   from InvestorRegistration where Email=@u and Password=@p";
            cmd.Parameters.AddWithValue("@u", txtuname.Text.Trim());
            cmd.Parameters.AddWithValue("@p", txtpassword.Text.Trim());

            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                Session.Add("in_id", dr.GetInt32(0));

                Response.Redirect("Invester/Default.aspx");

               
            }
            else
            {
                lblmsg.Text = "Invalid id and password";
            }
            con.Close();
        }
        if (ddlUserType.SelectedItem.ToString() == "startup")
        {
            con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select  st_id   from Star_UpRegistration where Email=@u and Password=@p";
            cmd.Parameters.AddWithValue("@u", txtuname.Text.Trim());
            cmd.Parameters.AddWithValue("@p", txtpassword.Text.Trim());

            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                Session.Add("st_id", dr.GetInt32(0));
                Response.Redirect("Startup/Default.aspx");
               
            }
            else
            {

                lblmsg.Text = "Invalid id and password";
            }
            con.Close();
        }
        if (ddlUserType.SelectedItem.ToString() == "Student")
        {

            con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select StudentID from Students_Registration where EmailAddress=@u and Password=@p";
            cmd.Parameters.AddWithValue("@u", txtuname.Text.Trim());
            cmd.Parameters.AddWithValue("@p", txtpassword.Text.Trim());

            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                Session.Add("StudentID", dr.GetInt32(0));
                Response.Redirect("user/Default.aspx");
            }
            else
            {

               
                lblmsg.Text = "Invalid id and password";

            }
            con.Close();
        }
    }
}