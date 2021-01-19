<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Guest_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table class="auto-style1">
        <tr>
            <td class="auto-style3">Name</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td>
                <asp:RadioButtonList ID="radGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
         <tr>
            <td class="auto-style2">Email</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="SingleLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Address</td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        
       
        <tr>
            <td class="auto-style2">Username</td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Password</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Confirm Password</td>
            <td>
                <asp:TextBox ID="txtConfirm" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
            </td>
            <td>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
            </td>
        </tr>
    </table>
</asp:Content>

