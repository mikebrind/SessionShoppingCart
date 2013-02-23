<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="SessionShoppingCart.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <p>
      Select Category:
      <asp:DropDownList ID="Categories" runat="server" DataSourceID="CategoriesData" 
        DataTextField="CategoryName" DataValueField="CategoryID" AutoPostBack="true" />
      <asp:SqlDataSource ID="CategoriesData" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
        SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
    </p>
    <asp:GridView ID="Products" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
      DataSourceID="ProductsData" GridLines="None" EnableViewState="False">
      <Columns>
        <asp:TemplateField HeaderText="Add To Cart">
          <ItemTemplate>
            <asp:CheckBox ID="SelectedProducts" runat="server" />
          </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="ProductName" HeaderText="Product" SortExpression="ProductName" />
        <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
        <asp:BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="UnitPrice"
          DataFormatString="{0:c}" />
      </Columns>
    </asp:GridView>
    <asp:Button ID="AddToCart" runat="server" Text="Select Products" OnClick="AddToCart_Click" /> 
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Checkout" runat="server" Text="Check Out" onclick="Checkout_Click" />
    <asp:SqlDataSource ID="ProductsData" runat="server" 
      ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
      SelectCommand="SELECT Products.ProductID, Products.ProductName, Categories.CategoryName, 
        Products.UnitPrice FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID 
        WHERE Products.CategoryID = @CategoryID">
      <SelectParameters>
        <asp:ControlParameter ControlID="Categories" Name="CategoryID" PropertyName="SelectedValue"
          DefaultValue="1" />
      </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
