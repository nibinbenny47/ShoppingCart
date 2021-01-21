<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="rptrViewCart" runat="server" OnItemCommand="rptrViewCart_ItemCommand">
        <ItemTemplate>
            <table>
                              <tr>
                                  <td>
                                       
                                      <img src="../Admin/Photos/<%#Eval("product_photo")%>" width="40" height="40" style="height: 113px; width: 159px" />
                
                                  </td>
                                  <td>
                                      <asp:HiddenField ID="hdnDescription" runat="server" Value='<%#Eval("product_description")%>' />
                                        <%#Eval("product_description")%>

                                  </td>
                                  <td>
                                      Quantity: <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("cart_quantity")%>'></asp:Label>
                                      <%--Quantity<asp:TextBox ID="txtQuantity" runat="server"  ></asp:TextBox>--%>
                                  </td>
                                  <%--<td><asp:Label runat="server" ID="lblPrice" Visible="false"></asp:Label></td>--%>
                                 <td>
                                     <asp:HiddenField runat="server" ID="hdnPrice" Value='<%#Eval("product_price")%>' />
                                 </td>
                                  <td>
                                      Total:<asp:Label ID="lblTotal" runat="server" Text='<%#Eval("cart_total")%>'></asp:Label>
                                      <%--Total<asp:TextBox ID="txtTotal" runat="server" Text='<%#Eval("cart_total")%>'  ></asp:TextBox>--%>

                                  </td>
                                  <td>
                                      <asp:LinkButton ID="lkbtnDelete" runat="server" CommandName="deleteFromCart" CommandArgument='<%#Eval("cart_id") %>' >Delete</asp:LinkButton>
                                  </td>
                                  <td>
                                      <asp:LinkButton ID="lkbtnBookNow" runat="server" CommandName="BookNow" CommandArgument='<%#Eval("cart_id") %>'>Book Now</asp:LinkButton>
                                  </td>
                              </tr>
                
                </table>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>

