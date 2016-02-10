<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="encuesta0.aspx.cs" Inherits="Olabing.Paginas.encuesta0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/Estilo/estilo_perfil.css" rel="stylesheet" type="text/css" />
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
                            <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Cerrar</asp:LinkButton>
			            </p>		
		            </div>
            </div>
    <div id="pad">
    <center>
        <br />
        <br />
        <h1>Encuesta Momento 0</h1>
        <br />
        <br />
         <h2>Apreciado graduado:</h2>
         <p align="justify" style="margin-left: 40px; height: 134px; width: 639px;" > 
            Gracias por brindarnos su colaboración, el diligenciamiento 
            de la Encuesta de Seguimiento a Graduados es de gran valor 
            estratégico para analizar los avances en la calidad de la educación,
            la pertinencia del programa de ingeniería de sistemas y el impacto social. 
            A partir de la información recolectada, el programa de ingeniería de sistemas, 
            podrá identificar áreas de mejoramiento en los procesos de formación y diseñar
            y/o reestructurar planes de estudio.
        </p>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Entrar" CssClass="button" 
            onclick="Button1_Click" />
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
