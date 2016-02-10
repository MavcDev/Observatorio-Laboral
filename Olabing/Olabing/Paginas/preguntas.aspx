<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="preguntas.aspx.cs" Inherits="Olabing.Paginas.preguntas" %>

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
                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Cerrar</asp:LinkButton>			
			            </p>		
		            </div>
           </div>
      <div id="pad">
        <center>
            <br />
                <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Large"></asp:Label>
            <br />
            <br />
            <asp:Table ID="Table1" runat="server" Width="700px">
            </asp:Table>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Atras" CssClass="button" 
                onclick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="Finalizar" CssClass="button" 
                onclick="Button3_Click" Visible="False" />
            <asp:Button ID="Button1" runat="server" Text="Siguiente"  CssClass="button"
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
