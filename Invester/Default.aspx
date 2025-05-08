<%@ Page Title="" Language="C#" MasterPageFile="~/Invester/In_MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Invester_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
        }
        .investor-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 15px;
            overflow: hidden;
        }
        .investor-card:hover {
            transform: scale(1.02);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .investor-header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .investor-logo {
            max-width: 150px;
            max-height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0,123,255,0.05);
        }
        .detail-label {
            font-weight: 600;
            color: #6c757d;
        }
    </style>

      <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card investor-card shadow-sm">
                        <div class="investor-header">
                            <h2 class="mb-0">Investor Details</h2>
                        </div>
                        <div class="card-body">
                            <asp:Repeater ID="InvestorRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="text-center mb-4">
                                        <asp:Image ID="LogoImage" runat="server" 
                                            ImageUrl='<%# "logo/" + Eval("logo") %>' 
                                            CssClass="investor-logo" 
                                            AlternateText="Investor Logo" />
                                    </div>
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <td class="detail-label">Firm Name</td>
                                                <td><%# Eval("FirmName") %></td>
                                            </tr>
                                            <tr>
                                                <td class="detail-label">Investor Name</td>
                                                <td><%# Eval("InvestorName") %></td>
                                            </tr>
                                            <tr>
                                                <td class="detail-label">Registration Number</td>
                                                <td><%# Eval("RegistrationNumber") %></td>
                                            </tr>
                                            <tr>
                                                <td class="detail-label">GST Number</td>
                                                <td><%# Eval("GSTNumber") %></td>
                                            </tr>
                                            <tr>
                                                <td class="detail-label">Mobile Number</td>
                                                <td><%# Eval("MobileNumber") %></td>
                                            </tr>
                                            <tr>
                                                <td class="detail-label">Category</td>
                                                <td><%# Eval("Category") %></td>
                                            </tr>
                                            <tr>
                                                <td class="detail-label">Email</td>
                                                <td><%# Eval("Email") %></td>
                                            </tr>
                                            <tr>
                                                <td class="detail-label">Website</td>
                                                <td><%# Eval("IWebsite") %></td>
                                            </tr>
                                            <tr>
                                                <td class="detail-label">Contact</td>
                                                <td><%# Eval("Contact") %></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>






</asp:Content>

