<%@ Page Title="" Language="C#" MasterPageFile="~/Startup/Start_MasterPage.master" AutoEventWireup="true" CodeFile="pop.aspx.cs" Inherits="Startup_Show_Investor_intrest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Add jQuery and Bootstrap CSS/JS -->
    
    <script type="text/javascript">
        $(document).ready(function () {
            // Search functionality in the modal
            $("#<%= txtName.ClientID %>").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#repeaterTable tbody tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>

    <div class="mx-auto max-w-screen-2xl bg-white p-4 md:p-6 2xl:p-10">
        <div class="container">
           
            <!-- Button to trigger Modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tableModal">
                Show Investor Table
            </button>

            <!-- Modal -->
            <div class="modal fade" id="tableModal" tabindex="-1" role="dialog" aria-labelledby="tableModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content"  style="margin-left:50px" >
                        <div class="modal-header">
                            <h5 class="modal-title" id="tableModalLabel">Investor Interest Table</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Search input inside the modal -->
                            <div class="form-group">
                                <label for="txtName" class="form-label">Search:</label>
                                <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Search..."></asp:TextBox>
                            </div>

                            <!-- Table inside the modal -->
                            <table id="repeaterTable" class="table">
                                <thead>
                                    <tr>
                                        <th>Logo</th>
                                        <th>Firm Name</th>
                                        <th>Contact No</th>
                                        <th>Email</th>
                                        <th>Startup Idea</th>
                                        <th>Query</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource22">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="h-12 w-12 rounded-full">
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
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Corrected SqlDataSource with SelectCommand -->
    <asp:SqlDataSource ID="SqlDataSource22" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StarupConnectionString %>" 
        SelectCommand="SELECT * FROM [InvestorRegistration]">
    </asp:SqlDataSource>

</asp:Content>





