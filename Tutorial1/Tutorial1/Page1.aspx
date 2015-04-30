<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page1.aspx.cs" Inherits="Tutorial1.Page1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>       
       
        <table class="auto-style1">
            <tr>
                <td> <asp:TextBox ID="txtInput1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqValidTxtInput1" runat="server" ControlToValidate="txtInput1" ErrorMessage="Please enter text" ForeColor="#990000" ValidationGroup="myValidation"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgValidInpu1" runat="server" ControlToValidate="txtInput1" ErrorMessage="Please enter numbers only" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtInput2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label runat="server" ID="lblOp" /></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnSubmit" runat="server" Text="Calculate" OnClick="btnSubmit_Click" /></td>
            </tr>
        </table>
    </div>
        
    </form>
</body>
</html>
