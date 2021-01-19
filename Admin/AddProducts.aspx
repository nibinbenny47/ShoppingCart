<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddProducts.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>Name</td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

                
            </td>
            
        </tr>
         
        <tr>
            <td>Photo</td>
            <td>
                <asp:FileUpload ID="fileImage" runat="server" />

            </td>
        </tr>

         
        <tr>
            <td>Item</td>
            <td>
                <asp:DropDownList ID="ddlItem" runat="server"></asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td>Desription</td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>

            </td>
        </tr>
         <tr>
             <td>Price</td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>

            </td>
        </tr>
         <tr>
             <td>Quantity</td>
            <td>
                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSave" runat="server"  Text="Save" OnClick="btnSave_Click"/>

            </td>
        </tr>

        
    </table>
</asp:Content>

