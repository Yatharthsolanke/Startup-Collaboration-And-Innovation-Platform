<%@ Page Title="" Language="C#" MasterPageFile="~/Invester/In_MasterPage.master" AutoEventWireup="true" CodeFile="info_project.aspx.cs" Inherits="Invester_info_project" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<div class="mx-auto max-w-screen-2xl bg-white p-4 md:p-6 2xl:p-10">
   <div class="card">
        <div class="bb ze ki xn 2xl:ud-px-0">
          <div class="tc sf yo zf kq">
            <div class="ro">
              <asp:Repeater ID="EventRepeater" runat="server" DataSourceID="SqlDataSource1">
                 <ItemTemplate>
                    <div class="event-item">
                        <img src='<%# "../Startup/logo/" + Eval("ProjectImage") %>' alt="Blog" class="event-image" />

                        <h2 class="event-title"><%# Eval("Projectname") %></h2>

                        <ul class="event-details">
                            <li><span class="label">Author: </span> <b><%# Eval("FirmName") %> </b> </li>
                            <li><span class="label">Published On: </span><b><%# Eval("Pub_date", "{0:dd-MM-yyyy}") %></b></li>
                            <li><span class="label">Category: </span><b><%# Eval("P_Category") %></b></li>
                        </ul>

                        <p class="event-description"><%# Eval("Description") %></p>
                    </div>
                 </ItemTemplate>
              </asp:Repeater>
            </div>
          </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:StarupConnectionString %>" 
                           SelectCommand="">
        </asp:SqlDataSource>

        <!-- Query Section -->
        <div class="bb ze ki xn 2xl:ud-px-0">
            <div class="row">
                <label for="txtFirmName" class="form-label"><strong>Any Query</strong></label>
                        <label for="txtFirmName" class="form-label text-danger"><strong>* If you're interested, please click on Submit button and the Startup will contact you</strong></label>
                <!-- Query Textbox -->
                <div class="col-lg-4">
                   
                    <div class="form-group">
                         
                        <asp:TextBox ID="txtquery" runat="server" Text="I Am Interested." class="form-control"></asp:TextBox>
                 
                        </div>
                     
                </div>
                 <div class="col-lg-8">
                     &nbsp;&nbsp;&nbsp;
                 </div>
                <br />
              <div class="col-lg-3">
                    <div class="form-group">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btn-block" OnClick="btnSubmit_Click" />
                    </div>
                </div>
                 <div class="col-lg-9"></div>
            </div>
        </div>
   </div>
</div>

<!-- Additional Custom Styles -->
<style>
    .event-item {
        margin-bottom: 30px;
    }

    .event-image {
        width: 70%;
        height: auto;
        border-radius: 8px;
        margin-bottom: 15px;
    }

    .event-title {
        font-size: 1.5rem;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
    }

    .event-details {
        list-style: none;
        padding: 0;
        margin-bottom: 15px;
    }

    .event-details li {
        margin-bottom: 5px;
    }

    .label {
        font-weight: bold;
    }

     .event-description {
        font-size: 1rem; /* Default font size */
        color: #555;     /* Text color */
        line-height: 1.8; /* Increase line height for better readability */
        margin-bottom: 15px; /* Space below the paragraph */
        padding: 10px 0;  /* Padding top and bottom to create breathing room */
        text-align: justify; /* Justify the text for better alignment */
        background-color: #f9f9f9; /* Light background color for the paragraph */
        border-left: 5px solid #4CAF50; /* Add a colored border for emphasis */
        border-radius: 5px; /* Rounded corners for the border */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Soft shadow around the paragraph */
    }

    /* For cases where the description is very short and you want to keep it visually balanced */
        .event-description:empty {
            display: none;
        }

    .query-section .form-label {
        font-size: 1rem;
        font-weight: normal;
        color: #333;
    }

    .query-section .form-control {
        margin-top: 10px;
    }

    .btn-block {
        width: 100%;
    }

    .row {
        display: flex;
        flex-wrap: wrap;
    }

    .col-lg-6 {
        flex: 1 1 45%;
        margin-right: 10px;
    }

    .col-lg-6:last-child {
        margin-right: 0;
    }

    @media (max-width: 768px) {
        .col-lg-6 {
            flex: 1 1 100%;
        }

        .event-title {
            font-size: 1.25rem;
        }
    }
</style>

</asp:Content>

