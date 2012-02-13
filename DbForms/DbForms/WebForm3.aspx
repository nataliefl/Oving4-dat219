<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="DbForms.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divRegister">
    
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Name" ></asp:Label>
    <asp:RequiredFieldValidator ID="rfv1" runat="server" 
        ControlToValidate="txtName" ErrorMessage="(*)Name required!" 
        ValidationGroup="rGroup"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtSurname" runat="server" 
        style="margin-left: 0px" TabIndex="1"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Surname"></asp:Label>
    <asp:RequiredFieldValidator ID="rfv2" runat="server" 
        ErrorMessage="(*)Last Name required!" ControlToValidate="txtSurname" 
        ValidationGroup="rGroup"></asp:RequiredFieldValidator>
        <br />
    <asp:TextBox ID="txtTelefon" runat="server" 
        style="margin-left: 0px" TabIndex="2"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="Telephone"></asp:Label>
        <asp:RequiredFieldValidator ID="rfv6" runat="server" 
            ControlToValidate="txtTelefon" Display="Dynamic" 
            ErrorMessage="(*)Number required!" ValidationGroup="rGroup"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rfv4" runat="server" ControlToValidate="txtTelefon" 
            Display="Dynamic" ErrorMessage="(*)Can i haz a proper number?" 
            MaximumValue="99999999" MinimumValue="10000000" ValidationGroup="rGroup"></asp:RangeValidator>
        <br />
    <asp:TextBox ID="txtEmail" runat="server" 
        style="margin-left: 0px" TabIndex="3"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Mail"></asp:Label>
        <asp:RequiredFieldValidator ID="rfv5" runat="server" 
            ControlToValidate="txtEmail" ErrorMessage="(*)Can i haz mail? no?" 
            ValidationGroup="rGroup"></asp:RequiredFieldValidator>
        <br />
    <br />
    <asp:DropDownList ID="ddl1" runat="server" TabIndex="4">
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfv3" runat="server" 
        ErrorMessage="Select sex!" ControlToValidate="ddl1" 
        ValidationGroup="rGroup"></asp:RequiredFieldValidator>
    <br />
    <asp:CheckBoxList ID="cbl1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="Sport" DataValueField="Sport" 
        TabIndex="5">
    </asp:CheckBoxList>
    <br />
    <asp:Button ID="bt1Register" runat="server" Text="Register" 
        ValidationGroup="rGroup" onclick="bt1Register_Click" TabIndex="6" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT DISTINCT Sport FROM Sports"></asp:SqlDataSource>
        </div>
</asp:Content>
