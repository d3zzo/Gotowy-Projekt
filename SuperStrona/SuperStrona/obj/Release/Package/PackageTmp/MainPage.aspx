<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="SuperStrona.MainPage" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        body {
            background-image: url(http://trunkweed.com/uploads/posts/images/598048-hd-wallpapes-food-free.jpg);
            background-repeat: no-repeat;
            background-size: 175%;
            position: relative;
            margin: 0;
            padding-bottom: 6rem;
            min-height: 100%;
            font-family: "Helvetica Neue", Arial, sans-serif;
            font-weight: 550;
        }
        .footer {
            position: center;
            right: 0;
            left: 0;
            text-align: center;
            font: bold;           
        }
        div.pozycja{
            position: fixed;
            top: 25%;
            left: 25%;
        }
    </style>
    <title>Ksiazka Kucharska</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center><h1>Książka kucharska</h1>
            <h3> Autor: Konrad Wyparło</h3>
        <asp:Button ID="Button1" runat="server" Text="Wybierz potrawę" Height="36px" Width="301px" OnClick="wybierzPotrawe" ValidateRequestMode="Disabled" style="font-weight: 700" Font-Bold="True" />
        <asp:Button ID="Button2" runat="server" Text="Dodaj włansy przepis" Height="36px" Width="301px" OnClick="dodajPrzepis" ValidateRequestMode="Disabled" style="font-weight: 700" Font-Bold="True" />
        </center>
            <br />
            <center>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="3">
            <asp:View ID="View1" runat="server">
                <asp:ListBox ID="ListBox1" runat="server" style="margin-left: 0px" Width="820px" Font-Bold="True"></asp:ListBox>
                <br />
                <br />
                <asp:Button ID="Button4" runat="server" Height="36px" OnClick="Button4_Click" style="margin-left: 0px; font-weight: 700;" Text="Co potrzebne do przygotowania?" Width="323px" Font-Bold="True" />
                <br />
                <br />
                <asp:ListBox ID="ListBox2" runat="server" style="margin-left: 0px" Width="820px" Font-Bold="True" Rows="6"></asp:ListBox>
            </asp:View>
            <asp:View ID="View2" runat="server">
                Nazwa potrawy:
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Proszę podać nazwę potrawy" Font-Bold="True" ForeColor="Red" ValidationGroup="vg" Font-Underline="False" Font-Strikeout="False" Font-Overline="False"></asp:RequiredFieldValidator>
                <br />
                <br />
                Wybierz składniki, dodając własne lub korzystając z gotowych:
                <br />
                <br />
                Nazwa składnika:
                <br />
                <br />
                <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" EnableViewState="False" ViewStateMode="Disabled"></asp:TextBox>
&nbsp;
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" style="font-weight: 700" Text="Dodaj składnik" ValidationGroup="ValidSkladnik" />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Proszę podać nazwę składnika" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidSkladnik"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" CausesValidation="True"></asp:CheckBoxList>   
                <asp:CustomValidator runat="server" ID="cvmodulelist" ClientValidationFunction="ValidateModuleList" ErrorMessage="Wybierz przynajmniej jeden składnik" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationGroup="vg"></asp:CustomValidator>
                <br />
                <br />             
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Dodaj przepis" ValidationGroup="vg" style="font-weight: 700" Height="47px" Width="228px"  />
                <br />     
            </asp:View>
            <asp:View ID="View3" runat="server">
                <br />
                <br />
                <strong>Przepis dodano pomyślnie.</strong>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <div class="pozycja">
                <div class=" footer">Aplikacja umożliwiająca wygodne przeglądanie listy składników przepisów kulinarnych. </div>
                <div class=" footer">Po wybraniu właściwego przepisu, wystarczy nacisnąć przycisk "Co potrzebne do przygotowania?" aby zobaczyć listę składników danej potrawy.</div>
                <div class=" footer">Aplikacja pozwala również na zamieszczanie własnych potraw, na podstawie istniejących juz składników lub tych, dodanych samodzielnie. </div>
                <div class=" footer">Dodawanie przepisu polega na wpisaniu nazwy potrawy oraz wybraniu odpowiednich składników z listy.</div> 
                <div class=" footer">W wypadku braku po pożądanego składnika możliwe jest dodanie go do listy poprzez wpisanie jego nazwy oraz naciśnięcie przycisku "Dodaj składnik".</div>
                </div>
           </asp:View>
        </asp:MultiView>
        </center>
        </div>
    </form>
</body>
</html>

<script>
    function ValidateModuleList(source, args) {
        var chkListModules = document.getElementById('<%= CheckBoxList1.ClientID %>');
        var chkListinputs = chkListModules.getElementsByTagName("input");
        for (var i = 0; i < chkListinputs.length; i++) {
            if (chkListinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
        args.IsValid = false;
    }
</script>
