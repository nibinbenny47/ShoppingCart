<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="GenderCategory.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   Gender:<asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
    <asp:Button ID="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click" />
</asp:Content>

