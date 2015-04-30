<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page3.aspx.cs" Inherits="Tutorial1.Page3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Panel ID="pnlGrid" runat="server">
              <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" AllowSorting="true" AllowPaging="True" OnPageIndexChanging="gvCustomers_PageIndexChanging" OnSorting="gvCustomers_Sorting" >
            <Columns>
                <%--<asp:BoundField HeaderText="Customer ID" DataField="CustomerID"/>--%>
                <asp:TemplateField HeaderText="CustomerID" HeaderStyle-Font-Bold="true" SortExpression="CustomerID">
                    <ItemTemplate>
                        <asp:Label ID="lblCustomerID" runat="server" Text='<%# Eval("CustomerID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CompanyName" HeaderStyle-Font-Bold="true" SortExpression="CompanyName" >
                    <ItemTemplate>
                        <asp:Label ID="lblCompanyName" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkbtnView" CommandArgument="CustomerID" OnClick="lnkbtnView_Click" runat="server">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="pnlDetailView" runat="server">
            <asp:DetailsView ID="dvCustomers" runat="server" AutoGenerateRows="false" Width="368px">
                <Fields>
                    <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderText="CustomerID">
                        <ItemTemplate>
                            <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("CustomerID") %>'></asp:Label>
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderText="CompanyName">
                        <ItemTemplate>
                            <asp:Label ID="lblCompanyName" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
                        </ItemTemplate>
                         
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderText="ContactName">
                        <ItemTemplate>
                            <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("ContactName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderText="ContactTitle">
                        <ItemTemplate>
                            <asp:Label ID="lblContactTitle" runat="server" Text='<%# Eval("ContactTitle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Font-Bold="true" HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </asp:Panel>

        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
