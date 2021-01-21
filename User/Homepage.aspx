<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
     <asp:DropDownList runat="server" ID="ddlMenItem" OnSelectedIndexChanged="ddlMenItem_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
    <asp:DropDownList runat="server" ID="ddlWomenItem" OnSelectedIndexChanged="ddlWomenItem_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
    <asp:HyperLink ID="hplinkViewCart" runat="server" NavigateUrl="~/User/ViewCart.aspx" Text="view cart" ></asp:HyperLink>
    <%--<asp:Button  runat="server" ID="btnSave" OnClick="btnSave_Click"  Text="show"/>--%>
      <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:DataList runat="server" ID="dtlistMenItems" RepeatColumns="3" OnItemCommand="dtlistMenItems_ItemCommand">
                            <ItemTemplate>
                                <table class="style1">
                                <tr>
                                    <td><asp:LinkButton ID="lkbtnViewProduct" runat="server" CommandArgument='<%# Eval("product_id") %>' CommandName="viewProduct">
                                        <img src="../Admin/Photos/<%#Eval("product_photo")%>" width="40" height="40" style="height: 113px; width: 159px" />
                                        </asp:LinkButton>
                                        </td>
                                    
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
                                     <%--<tr>
                                        <td>--%>
                                      
                                            <%--<asp:LinkButton ID="lkbtnAddToCart" runat="server" CommandArgument='<%# Eval("product_id") %>' CommandName="AddToCart"><%#Eval("product_photo")%></asp:LinkButton>--%>
                                      <%--  </td>
                                    </tr>--%>
                                     
                                        </table>
                            </ItemTemplate>
                        </asp:DataList>
                        </asp:View>
                <asp:View ID="View2" runat="server">
                      <asp:DataList runat="server" ID="dtlistWomenItems" RepeatColumns="3" OnItemCommand="dtlistWomenItems_ItemCommand">
                          <ItemTemplate>
                                <table class="style1">
                                <tr>
                                    <td><td><asp:LinkButton ID="lkbtnViewProduct" runat="server" CommandArgument='<%# Eval("product_id") %>' CommandName="viewProduct">
                                        <img src="../Admin/Photos/<%#Eval("product_photo")%>" width="40" height="40" style="height: 113px; width: 159px" />
                                        </asp:LinkButton></td>
                                    
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
                                    <tr>
                                        <td>
                                          <%--  
                                            <asp:LinkButton ID="lkbtnAddtoCart" runat="server" CommandName="AddToCart" CommandArgument=" <%#Eval("product_id")%>">
                                                ADDTOCART
                                            </asp:LinkButton>--%>
                                       <%--<asp:LinkButton ID="lkbtnAddtoCart" runat="server" CommandArgument="<%#Eval("product_id") %>" CommandName="AddToCart" Text="Addtocart"></asp:LinkButton>--%>
                                        </td>
                                    </tr>
                                     
                                        </table>
                            </ItemTemplate>
                      </asp:DataList>
                </asp:View>
              <asp:View ID="View3" runat="server">
                  <asp:Repeater runat="server" ID="rptrViewProduct" OnItemCommand="rptrViewProduct_ItemCommand" >
                      
                      <ItemTemplate>
                          <table>
                              <tr>
                                  <td>
                                       <asp:HiddenField ID="hdnPhoto" runat="server" Value='<%#Eval("product_photo")%>' />
                                      <img src="../Admin/Photos/<%#Eval("product_photo")%>" width="40" height="40" style="height: 113px; width: 159px" />
                
                                  </td>
                                  <td>
                                      <asp:HiddenField ID="hdnDescription" runat="server" Value='<%#Eval("product_description")%>' />
                                        <%#Eval("product_description")%>

                                  </td>
                                  <td>
                                      Quantity<asp:TextBox ID="txtQuantity" runat="server" OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true" ></asp:TextBox>
                                  </td>
                                  <%--<td><asp:Label runat="server" ID="lblPrice" Visible="false"></asp:Label></td>--%>
                                 <td>
                                     <asp:HiddenField runat="server" ID="hdnPrice" Value='<%#Eval("product_price")%>' />
                                 </td>
                                  <td>
                                      Total<asp:TextBox ID="txtTotal" runat="server" Text='<%#Eval("product_price")%>'  ></asp:TextBox>

                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <asp:Button ID="btnAddToCart" runat="server"  Text="ADD TO CART" OnClick="btnAddToCart_Click" />
                                      <%--<asp:LinkButton runat="server" ID="lkbtnAddToCart" Text="ADD TO CART" CommandArgument='<%#Eval("product_id") %>' CommandName="AddToCart"></asp:LinkButton>--%>
                                  </td>
                              </tr>
                          </table>
                      </ItemTemplate>
                      
                      
                  </asp:Repeater>
              </asp:View>
               
              </asp:MultiView>
</asp:Content>

