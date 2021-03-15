<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.bundle.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/popper-utils.min.js"></script>
    <link href="Content/bootstrap-grid.css" rel="stylesheet" />
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-reboot.css" rel="stylesheet" />
    <link href="Content/bootstrap-reboot.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/MainPageStyleSheet.css" rel="stylesheet" />
    <title>Person_Details</title>
</head>
<body>
    <div>
    <nav class="navbar navbar-custom">
    <a>
    <img src="Images/M_Logo.JPG" width="50" height="50" />
    <b>MYCURD</b>
    </a>
    </nav>
    </div>
    <br />
    <form id="form1" runat="server">
            <asp:HiddenField ID="PersonId" runat="server" />
            <div class="container-fluid">
            <div class="row">
            <div class="col-sm-3 col-lg-4" style="background-color:#F1EFEE;">
            <br />
                <img src="Images/User.png" style="width:40px;height:40px;margin-left:180px;"/>
                <b style="margin-left:150px;">Person Details</b>
            <table>
                
                <tr>
                    <td><asp:TextBox ID="First_Name" runat="server" class="form-control" placeholder="First Name" style="margin-left:0px;margin-top:5px;width:200px;"></asp:TextBox></td>
                    <td><asp:TextBox ID="Last_Name" class="form-control" runat="server" placeholder="Last Name" style="margin-left:10px;margin-top:5px;width:200px;"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="Gender" class="form-control" runat="server" style="margin-left:0px;margin-top:5px;width:200px;" AutoPostBack ="True">
                        <asp:ListItem Selected="True" Value="0" Text="Gender"></asp:ListItem>
                        <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                        <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                        <asp:ListItem Value="Others" Text="Others"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    
                    <td>
                       <asp:TextBox ID="Email" class="form-control" runat="server" placeholder="Email" style="margin-left:10px;margin-top:5px;width:200px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> 
                        <asp:TextBox ID="Mobile_Number" class="form-control" runat="server" placeholder="Mobile Number" style="margin-left:0px;margin-top:5px;width:200px;"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="Phone_Number" class="form-control" runat="server" placeholder="Phone Number" style="margin-left:10px;margin-top:5px;width:200px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="Address_Type_1" class="form-control" runat="server" style="margin-left:0px;margin-top:5px;width:200px;">
                            <asp:ListItem Selected="True" Value="0" Text="Select Address Type..."></asp:ListItem>
                            <asp:ListItem Value="1" Text="Permanent_Address"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Residential Address"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="Address1" runat="server" placeholder="Address" TextMode="MultiLine" style="margin-left:10px;margin-top:5px;width:200px;height:100px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="Address_Type_2" class="form-control" runat="server" style="margin-left:0px;margin-top:5px;width:200px;">
                            <asp:ListItem Selected="True" Value="0" Text="Select Address Type..."></asp:ListItem>
                            <asp:ListItem Value="1" Text="Permanent_Address"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Residential Address"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td><asp:TextBox ID="Address2" runat="server" placeholder="Address" TextMode="MultiLine" style="margin-left:10px;margin-top:5px;width:200px;height:100px;"></asp:TextBox></td>
                </tr>
                <tr>
                   <td><asp:Button ID="btnsave" class="btn btn-primary" style="background-color: #84E972;border-color: #84E972;color:black;margin-top:10px;" runat="server" Text="Save" OnClick="btnsave_Click" /></td>
                   <td><asp:Button ID="btndelete" class="btn btn-primary" style="margin-left:-30px;background-color: #ff8566;border-color: #ff8566;color:black;margin-top:10px;" runat="server" Text="Delete" OnClick="btndelete_Click" /></td>
                   <td><asp:Button ID="btnclear" class="btn btn-primary" style="margin-left:-60px;background-color: #4775d1;border-color: #4775d1;color:black;margin-top:10px;" runat="server" Text="Clear" OnClick="btnclear_Click" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
            <br />
            </div>
            <div class="col-sm-9 col-lg-8" style="background-color:white;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="font-size:14px;font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif" CellPadding="3" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="First_Name" HeaderText="First_Name" />
                    <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Mobile_Number" HeaderText="Mobile_Number" />
                    <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" />
                    <asp:BoundField DataField="Permanent_Address" HeaderText="Permanent_Address" />
                    <asp:BoundField DataField="Residential_Address" HeaderText="Residential_Address" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkview" runat="server" OnClick="Edit_OnClick" CommandArgument='<%# Eval("PersonId") %>'>Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </div>
            </div>
            </div>
    </form>
</body>
</html>
