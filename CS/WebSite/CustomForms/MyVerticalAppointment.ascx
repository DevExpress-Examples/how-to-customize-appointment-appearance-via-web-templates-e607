﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MyVerticalAppointment.ascx.cs" Inherits="MyVerticalAppointment" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.Web.v15.2" Namespace="DevExpress.Web" TagPrefix="dxe" %>
<div id="appointmentDiv" runat="server" class='<%#((VerticalAppointmentTemplateContainer)Container).Items.AppointmentStyle.CssClass %>'>
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr valign="top" >
            <td runat="server" id="statusContainer">    
            </td>
            <td style="width:100%">
                <table cellpadding="1" cellspacing="0" width="100%">
                    <tr valign="top">
                        <td>
                            <table id="imageContainer" runat="server" cellpadding="1" cellspacing="0" style="text-align: center">
                                <tr><td></td></tr>
                            </table>
                        </td>
                        <td style="width:100%">                    
                            <table width="100%" cellpadding="1" cellspacing="0" >                        
                                <tr>
                                    <td>
                                        <dxe:ASPxLabel runat="server" EnableViewState="false" EncodeHtml="true" ID="lblStartTime" Text='<%#((VerticalAppointmentTemplateContainer)Container).Items.StartTimeText.Text%>' Visible='<%#((VerticalAppointmentTemplateContainer)Container).Items.StartTimeText.Visible%>'></dxe:ASPxLabel>
                                        <dxe:ASPxLabel runat="server" EnableViewState="false" EncodeHtml="true" style="margin-left: -4px;" ID="lblEndTime" Text='<%#((VerticalAppointmentTemplateContainer)Container).Items.EndTimeText.Text%>' Visible='<%#((VerticalAppointmentTemplateContainer)Container).Items.EndTimeText.Visible%>'></dxe:ASPxLabel>        
                                        <dxe:ASPxLabel runat="server" EnableViewState="false" EncodeHtml="true" ID="lblTitle" Text='<%#((VerticalAppointmentTemplateContainer)Container).Items.Title.Text%>'></dxe:ASPxLabel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div runat="server" id="horizontalSeparator" class='<%#((VerticalAppointmentTemplateContainer)Container).Items.HorizontalSeparator.Style.CssClass %>' visible='<%#((VerticalAppointmentTemplateContainer)Container).Items.HorizontalSeparator.Visible%>'></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dxe:ASPxLabel runat="server" EnableViewState="false" EncodeHtml="true" ID="lblDescription" Text='<%#((VerticalAppointmentTemplateContainer)Container).Items.Description.Text%>'></dxe:ASPxLabel>
                                    </td>        
                                </tr>
                                <tr>
                                    <td>
                                         <dxe:ASPxLabel runat="server" ID="lblPriceHeader" ForeColor="DarkBlue" Text="Price:  " Visible="true"></dxe:ASPxLabel>
                                         <dxe:ASPxLabel runat="server" ID="lblPrice" ForeColor="DarkBlue" Visible="true"></dxe:ASPxLabel>
                                    </td>        
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>