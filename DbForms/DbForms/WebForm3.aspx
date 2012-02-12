<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="DbForms.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divRegister">
    
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfv1" runat="server" 
        ControlToValidate="txtName" ErrorMessage="Name required!" 
        ValidationGroup="rGroup"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtSurname" runat="server" 
        style="margin-left: 0px" TabIndex="1"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfv2" runat="server" 
        ErrorMessage="Last Name required!" ControlToValidate="txtSurname" 
        ValidationGroup="rGroup"></asp:RequiredFieldValidator>
    <br />
    <asp:DropDownList ID="ddl1" runat="server" TabIndex="2">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfv3" runat="server" 
        ErrorMessage="Select sex!" ControlToValidate="ddl1" 
        ValidationGroup="rGroup"></asp:RequiredFieldValidator>
    <br />
    <asp:CheckBoxList ID="cbl1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="Sport" DataValueField="Sport" 
        TabIndex="3">
    </asp:CheckBoxList>
    <br />
    <asp:Button ID="bt1Register" runat="server" Text="Register" 
        ValidationGroup="rGroup" onclick="bt1Register_Click" TabIndex="4" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT DISTINCT Sport FROM Sports"></asp:SqlDataSource>
        </div>
</asp:Content>
