<%@ Page Title="" Language="C#" MasterPageFile="~/Startup/Start_MasterPage.master" AutoEventWireup="true" CodeFile="Show_Investor_intrest.aspx.cs" Inherits="Startup_Show_Investor_intrest" %>

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
    <h2 class="mt-4">Investor Interest</h2>
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
                    <th>Logo</th>
                    <th>Firm Name</th>
                    <th>Contact No</th>
                   <th>Email</th>
                     <th>Startup Idea</th>
                    <th>Query</th>
                   
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="SqlDataSource22" >
                  <ItemTemplate>
<tr>
     <td class="h-12 w-12 rounded-full" >
         
         <img src="../images/<%# Eval("log") %>" alt="Brand">
     </td>
        <td><%# Eval("Name") %></td>
        <td><%# Eval("Cont") %></td>
        <td><%# Eval("email") %></td>
        <td><%# Eval("Project") %></td>
     <td><%# Eval("qu") %></td>
    
        
        
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

