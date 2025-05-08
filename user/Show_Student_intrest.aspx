<%@ Page Title="" Language="C#" MasterPageFile="~/Startup/Start_MasterPage.master" AutoEventWireup="true" CodeFile="Show_Student_intrest.aspx.cs" Inherits="Startup_Show_Investor_intrest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%= txtName.ClientID %>").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#repeaterTable tbody tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
});
</script>


     <div class="mx-auto max-w-screen-2xl bg-white  p-4 md:p-6 2xl:p-10">

         <div class="container">
    <h2 class="mt-4">Student Interest</h2>
    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label for="txtName" class="form-label">Search:</label>
                <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Search..."></asp:TextBox>
                
            </div>
        </div>
    </div>
    
    <div class="row">
        <table id="repeaterTable" class="table"  >
            <thead>
                <tr >
                    <th>Img</th>
                    <th>Student Name</th>
                    <th>Project Name</th>
                   <th>Email</th>
                     <th>Applied date </th>
                    <th>Resume</th>
                   
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="SqlDataSource22" >
                  <ItemTemplate>
<tr>
     <td class="h-12 w-12 rounded-full" >
         
         <img src="../user/image/<%# Eval("logo") %>" alt="Brand">
     </td>
        <td><%# Eval("StudentName") %></td>
        <td><%# Eval("Projectname") %></td>
        <td><%# Eval("EmailAddress") %></td>
        <td><%# Eval("date_applied") %></td>
     <td><a href='<%# "../user/Resume/" + Eval("resume_file") %>' target="_blank" class="btn btn-primary">Resume</a>
                                </td>
        
        
    </tr>
</ItemTemplate>

                </asp:Repeater>

                  <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:StarupConnectionString %>"  SelectCommand="SELECT * FROM [InvestorRegistration]" >
            </asp:SqlDataSource>
            </tbody>
        </table>
    </div>
</div>

       
           
         </div>


</asp:Content>

