<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DbForms.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="MedNr" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="MedNr" HeaderText="MedNr" InsertVisible="False" 
            ReadOnly="True" SortExpression="MedNr" />
        <asp:BoundField DataField="Navn" HeaderText="Navn" SortExpression="Navn" />
        <asp:BoundField DataField="Etternavn" HeaderText="Etternavn" 
            SortExpression="Etternavn" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT * FROM [Medlemmer]"></asp:SqlDataSource>
</asp:Content>
