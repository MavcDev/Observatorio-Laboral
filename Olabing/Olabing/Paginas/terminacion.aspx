<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="terminacion.aspx.cs" Inherits="Olabing.Paginas.terminacion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="/Estilo/estilo_perfil.css" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div id="wrap">
         <div id="header">			
		        <h1 id="logo-text"><a href="index.html">Olabing</a></h1>		
		        <p id="slogan">Observatorio laboral de ingeniería de sistemas</p>
                	<div id="header-links">
			            <p>
                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Cerrar</asp:LinkButton>	
			            </p>		
		            </div>
           </div>
    <div id="pad">
        <center>
            <h2>Gracias</h2>
            <p>
                Con 
                su ayuda, mejoramos la calidad de la educación en el programa de ingeniería de sistemas 
            </p>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Ir a Perfil" onclick="Button1_Click" CssClass="button" />
        </center>
    </div>
            <div id="footer">
		     <p>
		         &copy; 2013 <strong>Olabing</strong> |
		        <a href="http://www.bluewebtemplates.com/" title="Website Templates">Universidad de la amzonia</a>
   	        </p>
	    </div>
    </div>
    </form>
</body>
</html>
