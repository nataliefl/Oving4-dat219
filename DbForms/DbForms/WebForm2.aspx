<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="DbForms.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="ddlSelectSport" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="Sport" DataValueField="Sport">
    </asp:DropDownList>
    <asp:GridView ID="gv1" runat="server">
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Sport FROM Sports GROUP BY Sport"></asp:SqlDataSource>
    </asp:Content>
