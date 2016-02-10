<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mensaje_eliminar.aspx.cs" Inherits="Olabing.Paginas.mensaje_eliminar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/Estilo/estilo_perfil.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div id="msg">
                <h2>Esta seguro de eliminar</h2>
                <asp:Button ID="Button1" runat="server" Text="Si" Width="50" CssClass="button" 
                    onclick="Button1_Click"/> 
                <asp:Button ID="Button2" runat="server" Text="No" Width="50" CssClass="button" 
                    onclick="Button2_Click" />
            </div>
         </center>
    </form>
</body>
</html>
