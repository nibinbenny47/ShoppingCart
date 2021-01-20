<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
    <asp:DropDownList runat="server" ID="ddlMenItem" OnSelectedIndexChanged="ddlMenItem_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
    <asp:DropDownList runat="server" ID="ddlWomenItem" OnSelectedIndexChanged="ddlWomenItem_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
    <%--<asp:Button  runat="server" ID="btnSave" OnClick="btnSave_Click"  Text="show"/>--%>
      <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:DataList runat="server" ID="dtlistMenItems" RepeatColumns="3">
                            <ItemTemplate>
                                <table class="style1">
                                <tr>
                                    <td><img src="../Admin/Photos/<%#Eval("product_photo")%>" width="40" height="40" style="height: 113px; width: 159px" /></td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <%#Eval("product_price")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        <%#Eval("product_description")%>
                                        </td>
                                    </tr>
                                     
                                        </table>
                            </ItemTemplate>
                        </asp:DataList>
                        </asp:View>
                <asp:View ID="View2" runat="server">
                      <asp:DataList runat="server" ID="dtlistWomenItems" RepeatColumns="3">
                          <ItemTemplate>
                                <table class="style1">
                                <tr>
                                    <td><img src="../Admin/Photos/<%#Eval("product_photo")%>" width="40" height="40" style="height: 113px; width: 159px" /></td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <%#Eval("product_price")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        <%#Eval("product_description")%>
                                        </td>
                                    </tr>
                                     
                                        </table>
                            </ItemTemplate>
                      </asp:DataList>
                </asp:View>
              <%-- <asp:View ID="View3" runat="server">
                      <asp:DataList runat="server" ID="dtlistSaree">
                          <ItemTemplate>
                                <table class="style1">
                                <tr>
                                    <td><img src="../Admin/Photos/<%#Eval("product_photo")%>" width="40" height="40" style="height: 113px; width: 159px" />;</td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <%#Eval("product_price")%>;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        <%#Eval("product_description")%>;
                                        </td>
                                    </tr>
                                     
                                        </table>
                            </ItemTemplate>
                      </asp:DataList>
                </asp:View>
               <asp:View ID="View4" runat="server">
                      <asp:DataList runat="server" ID="dtlistChuridhar">
                          <ItemTemplate>
                                <table class="style1">
                                <tr>
                                    <td><img src="../Admin/Photos/<%#Eval("product_photo")%>" width="40" height="40" style="height: 113px; width: 159px" />;</td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <%#Eval("product_price")%>;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        <%#Eval("product_description")%>;
                                        </td>
                                    </tr>
                                     
                                        </table>
                            </ItemTemplate>
                      </asp:DataList>
                </asp:View>--%>
              </asp:MultiView>
</asp:Content>

