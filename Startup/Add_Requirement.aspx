<%@ Page Title="" Language="C#" MasterPageFile="~/Startup/Start_MasterPage.master" AutoEventWireup="true" CodeFile="Add_Requirement.aspx.cs" Inherits="Startup_Add_Requirement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

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
            <h2 class="mt-4">Add Requirement For Student </h2>  <div style="text-align:end"  > <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#tableModal">
                Edit Requirement</button>  </div> 
              <div class="row">
       
         <div class="col-lg-6">
              <asp:UpdatePanel ID="FileUploadUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                          
            <div class="form-group">
                <asp:HiddenField ID="hfpid" runat="server" />
                 <asp:HiddenField ID="hfdate" runat="server" />
                <label for="lblname" class="form-label"  Font-Bold="true" >Project Name :</label>
                <asp:DropDownList ID="ddlidea" class="form-control" runat="server" OnSelectedIndexChanged="ddlidea_SelectedIndexChanged"   ValidationGroup="er"  AutoPostBack="true" >

                </asp:DropDownList>
             
                <asp:RequiredFieldValidator ID="RequiValidatorFirmName" runat="server" 
                    ControlToValidate="ddlidea" ErrorMessage="!"   ValidationGroup="er"   ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
                </div>
                                </ContentTemplate>
                        </asp:UpdatePanel>
        </div>
                  
<div class="col-lg-6">
            <div class="form-group">
                <label for="lblname" class="form-label"  Font-Bold="true" >Requirement skill:</label>
                <asp:TextBox ID="txtreq_skill" class="form-control"  runat="server"   ValidationGroup="er"  TextMode="MultiLine" >

                </asp:TextBox>
             
                <asp:RequiredFieldValidator ID="RequiredFieldmName" runat="server" 
                    ControlToValidate="txtreq_skill" ErrorMessage="*"    ValidationGroup="er"  ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
                </div>
        </div>


<div class="col-lg-6">
            <div class="form-group">
                <label for="lblname" class="form-label"  Font-Bold="true" >Requirement:</label>
                <asp:TextBox ID="txtrequirement" class="form-control"  runat="server"  TextMode="MultiLine"  ValidationGroup="er"  ></asp:TextBox>
             
                <asp:RequiredFieldValidator ID="RequiredField11" runat="server" 
                    ControlToValidate="txtrequirement" ErrorMessage="*"   ForeColor="Red"   ValidationGroup="er" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
                </div>
        </div>

<div class="col-lg-6">
            <div class="form-group">
                <label for="lblname" class="form-label"  Font-Bold="true" >Salary Range:</label>
                <asp:TextBox ID="txtsalary" class="form-control"  runat="server"  ValidationGroup="er" ></asp:TextBox>
             
                <asp:RequiredFieldValidator ID="RequidatorFirmName" runat="server" 
                    ControlToValidate="txtsalary" ErrorMessage="!"   ForeColor="Red"  ValidationGroup="er"  
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
                </div>
        </div>

<div class="col-lg-6">
            <div class="form-group">
                <label for="lblname" class="form-label"  Font-Bold="true" >location:</label>
                <asp:TextBox ID="txtlocation" class="form-control"  runat="server"  ValidationGroup="er" ></asp:TextBox>
             
                <asp:RequiredFieldValidator ID="RequireFiddrmName" runat="server" 
                    ControlToValidate="txtlocation" ErrorMessage="!"   ForeColor="Red"   ValidationGroup="er" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
                </div>
        </div>

                   <div class="col-lg-6">
            <div class="form-group">
                <label for="lblname" class="form-label"  Font-Bold="true" >Status:</label>
                <asp:DropDownList ID="ddlstatus" class="form-control" runat="server"  ValidationGroup="er" >
                    <asp:ListItem>Select</asp:ListItem>
                      <asp:ListItem>Active</asp:ListItem>
                      <asp:ListItem>deactivate</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirmName" runat="server"   ValidationGroup="er" 
                    ControlToValidate="ddlstatus" ErrorMessage="*"  InitialValue="Select"  ForeColor="Red" 
                    CssClass="error-message" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
                </div>
        </div>



                   <div class="col-lg-12"></div>
        <div class="col-lg-5">
            </div>
        <!-- Submit Button -->
        <div class="col-lg-6">
            <div class="form-group">
                 <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success "   OnClick="btnSubmit_Click"   ValidationGroup="er"  />
             <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn  btn-warning "   OnClick="btnupdate_Click"   ValidationGroup="er"  />
            
                 <asp:Button ID="btndelet" runat="server" Text="Delete" CssClass="btn  btn-danger "   OnClick="btndelet_Click"   ValidationGroup="er"  />
            
                </div>
        </div>


                  </div>

           

          <div class="modal fade" id="tableModal" tabindex="-1" role="dialog" aria-labelledby="tableModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content"  style="margin-left:50px" >
                        <div class="modal-header">
                            <h5 class="modal-title" id="tableModalLabel">Requirement For Student </h5>
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
                                         <th>Id</th>
                                        <th>Project name</th>
                                        <th>Required skill</th>
                                        <th>requirements</th>
                                        <th>salary_range</th>
                                        <th>status</th>
                                      
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource22">
                                        <ItemTemplate>
                                            <tr>

                                                  <td><%# Eval("req_id") %></td>
                                                 <td><%# Eval("Projectname") %></td>
                                             
                                                <td><%# Eval("req_skill") %></td>
                                                <td><%# Eval("requirements") %></td>
                                                <td><%# Eval("salary_range") %></td>
                                                <td><%# Eval("status") %></td>
                                               <td>
                <!-- Pass the pi_id to the button -->
               <asp:Button ID="btnshow" runat="server" Text="Select" 
            CommandName="SelectProject" 
             CommandArgument='<%# Eval("req_id") + "|" + Eval("Projectname")  %>' 
            OnCommand="btnshow_Command" 
            ValidationGroup="wf" 
            CssClass="btn btn-warning" />

            </td>
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
         <asp:SqlDataSource ID="SqlDataSource22" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StarupConnectionString %>" 
        SelectCommand="">
    </asp:SqlDataSource>









        </div>


    </div>

 





</asp:Content>

