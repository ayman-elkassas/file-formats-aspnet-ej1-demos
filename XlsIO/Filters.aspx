<%@ Page Title="XlsIO-Filters-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="True" Inherits="WebSampleBrowser.XlsIO.Filters" Codebehind="Filters.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
        This sample demonstrates how to apply different types of filters within a range.
    </p>
    <br />
    <p>
        Click the button to view an Excel spreadsheet generated by Essential XlsIO. 
        Please note that Microsoft Excel Viewer or Microsoft Excel is required to view the resultant document.
    </p>
    <div>
        <table id="PanelTable" width="630px" cellpadding="0" cellspacing="0" border="0">
            <td>                
				 <div>
                    <table width="300px" cellpadding="0" cellspacing="0" border="0">
                        <tr> 
						<td align="left" >
						<asp:Label runat="server" ID="label11" Text="Choose the Filter Type"></asp:Label>
						</td>
						<td align="left">
                        <asp:Dropdownlist id="FilterList" runat="server" OnSelectedIndexChanged="FilterList_SelectedIndexChanged" AutoPostBack="true" Width="125px"> </asp:Dropdownlist>
                        </td>
						</tr>
                    </table>
                </div>
                <br />
                <asp:panel runat="server"  id="actionType" visible="false">
                    <asp:label id="lb1" runat="server">Action Type</asp:label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Radiobutton id="rdb1" runat="server" Text="Filter In Place"  groupname="radio" />&nbsp;&nbsp;&nbsp;
                    <asp:Radiobutton id="rdb2" runat="server" Text="Filter Copy" groupname="radio" />
                    <br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Checkbox id="chb1" runat="server" Text="Unique Records" />
                </asp:panel>
                
                <asp:panel runat="server"  id="colorFilter" visible="false">
                    <asp:label id="lb2" runat="server">Filter Type</asp:label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Radiobutton id="rdb3" runat="server" Text="Font Color" checked="true" groupname="radio" />&nbsp;&nbsp;&nbsp;
                    <asp:Radiobutton id="rdb4" runat="server" Text="Cell Color" groupname="radio" />
                    <br/>
                    <br />
                    <asp:Label ID ="lb3" runat ="server">Color</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Dropdownlist id="colorsList" runat="server" AutoPostBack="false" Width="125px"/>
                </asp:panel>
                
                
                <asp:panel runat="server"  id="iconFilter" visible="false">
                    <table>
                    <tr>
                        <td>
                            <asp:label id="iconSetTypeLabel" runat="server">IconSet Type</asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <ej:ComboBox ID="iconSetList" runat="server" DataTextField="IconSetName" DataValueField="Id" EnableViewState="False" ClientSideOnChange="onChange" Height="5%" Width="65%" Placeholder="Select Iconset"></ej:ComboBox>
                        </td>
                    </tr>
                    </table>
                    <br />
                    <table>
                    <tr>
                    <td>
                        <asp:Label ID ="iconIdLabel" runat ="server">Icon ID</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                    <ej:ComboBox ID="selectIcon" runat="server" ClientSideOnChange="onIconId" Enabled="false" AllowCustom="False" EnableViewState="False" Height="5%" Width="65%" DataTextField="text"  
                    ItemTemplate="<div><img class='eimg' src='../Content/XlsIO/autofilter/${eimg}.png'/><div class='ename'> ${text} </div></div>"
                    Placeholder="Select Icon" ></ej:ComboBox>
                    </td>
                    </tr>
                    </table>
                </asp:panel>
                
                <br/>
                <div>
                    <table width="50%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Input Template"
                                    Width="110px" />
                            </td>
                             <td>
                                <asp:button id="Button2" runat="server" text="Create Document" onclick="Button1_Click" AutoPostBack="true" Width="120px"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="temp" ContentPlaceHolderID="EventSection" runat="server" Visible="false">
    <asp:HiddenField ID="iconsetTemp" runat="server"/>
    <asp:HiddenField ID="iconidTemp" runat="server"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onChange(e) {
            var ctry = $('#<%=selectIcon.ClientID%>').data("ejComboBox");
            ctry.option({ enabled: true, query: new ej.Query().where('Id', 'equal', e.model.value), value: null });
            $("#<%= iconsetTemp.ClientID %>").val(e.model.value);
        }
        function onIconId(e) {
            $("#<%= iconidTemp.ClientID %>").val(e.model.value);
        }
    </script>
</asp:Content>

                    
