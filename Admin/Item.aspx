<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Item.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Item Name</td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
       
        <tr>
            <td>
                Select Category
            </td>
            <td>
                <%--<asp:RadioButtonList ID="radgender" runat="server"></asp:RadioButtonList>--%>
               <%-- <asp:CheckBoxList ID="chboxGender" runat="server" RepeatDirection="vertical">
                </asp:CheckBoxList>--%>
                <asp:RadioButtonList ID="rdbGenderCategory" runat="server" RepeatDirection="horizontal"></asp:RadioButtonList>
                
                <%--<asp:DropDownList runat="server" ID="ddlcategory"></asp:DropDownList>--%>
            </td> 
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
            </td>
            <td style="font-style: italic">&nbsp;</td>
        </tr>
        </table>
    <asp:Repeater ID="rptrItem" runat="server" >
        <HeaderTemplate>
            <table border="1">
                <tr>
                    <th>
                        Name
                    </th>
                    <th>
                        Category
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                     <%# Eval("item_name") %>
                </td>
                 <td>
                  <%# Eval("gender_category") %>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>

