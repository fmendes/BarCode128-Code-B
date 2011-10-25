<%@ Page Title="" Language="C#" MasterPageFile="~/CoverSheet.Master" AutoEventWireup="true" CodeBehind="print.aspx.cs" Inherits="CoverSheetBarCode.print" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-weight: 700; text-align:center">
    <p class="print">Enrollment Application Cover Sheet</p>
    <asp:DetailsView ID="dvCoverSheet" runat="server" DataSourceID="DBAccess" 
        Height="50px" Width="621px" 
        style="font-family: Arial, Helvetica, sans-serif; font-size: x-small" 
            CaptionAlign="Top" CssClass="print" AutoGenerateRows="False">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" />
            <asp:BoundField DataField="Date" DataFormatString="{0:MM/dd/yyyy}" 
                HeaderText="Date" />
            <asp:BoundField DataField="Region" HeaderText="Region" />
            <asp:BoundField DataField="Last Name" HeaderText="Last Name" />
            <asp:BoundField DataField="Suffix" HeaderText="Suffix" />
            <asp:BoundField DataField="First Name" HeaderText="First Name" />
            <asp:BoundField DataField="Middle Initial" HeaderText="Middle Initial" />
            <asp:BoundField DataField="EmTrac #" HeaderText="EmTrac #" />
            <asp:BoundField DataField="RTI Code" HeaderText="RTI Code" />
            <asp:BoundField DataField="Site Code" HeaderText="Site Code" />
            <asp:BoundField DataField="Facility Name" HeaderText="Facility Name" />
            <asp:BoundField DataField="City" HeaderText="City" />
            <asp:BoundField DataField="State" HeaderText="State" />
            <asp:BoundField DataField="Billing Name" HeaderText="Billing Name" />
        </Fields>
        <HeaderStyle Font-Bold="True" Font-Size="Medium" HorizontalAlign="Center" />
    </asp:DetailsView>
    <br class="print" />
    <asp:Image ID="imgBarCode" runat="server" Height="320px" Width="400px" 
        ImageAlign="Middle" CssClass="print" />
    <br class="print" />
        <br />
        <input id="btnPrint" type="button" value="Print" 
            onclick="window.print();return false;" 
            style="font-weight: bold; font-size: medium; width: 247px;" 
        class="noprint" />
    </div>
    <asp:ObjectDataSource ID="DBAccess" runat="server" SelectMethod="GetCoverSheet" 
        TypeName="CoverSheetBarCode.DBAccess">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="iId" SessionField="SHEET_ID" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
