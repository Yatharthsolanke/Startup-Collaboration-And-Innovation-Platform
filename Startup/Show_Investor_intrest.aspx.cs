using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Startup_Show_Investor_intrest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource22.SelectCommand= @"  SELECT  ir.logo AS log,  ir.FirmName AS Name,  ir.Contact AS Cont,  ir.Email AS email,   up.Projectname AS Project,    ii.Query AS qu
FROM   Investor_intrest ii INNER JOIN   InvestorRegistration ir ON ii.in_id = ir.in_id  INNER JOIN    Upload_Project_Idea up ON ii.pi_id = up.pi_id  ORDER BY intrest_id DESC  ";
    
    
    
    }
}