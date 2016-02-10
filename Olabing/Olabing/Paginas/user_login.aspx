<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_login.aspx.cs" Inherits="Olabing.Paginas.user_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="/Estilo/estilo_perfil.css" type="text/css" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server" >
    <div id="wrap">
    	<div id="header">			
		    <h1 id="logo-text"><a href="index.html">Olabing</a></h1>		
		    <p id="slogan">Observatorio laboral de ingeniería de sistemas</p>	
        </div>
        <div  id="menu2">
            <table width="790">
                <tr>
                    <td align="right" valign="middle">
                        Usuario:
                        <asp:TextBox ID="TextBox2" runat="server" Width="125px"  TextMode="SingleLine" ></asp:TextBox>
                    </td>
                    <td align="right" width="220px" valign="middle">
                        Contraseña:
                        <asp:TextBox ID="TextBox1" runat="server"  Width="125px" TextMode="Password" ></asp:TextBox>
                    </td>
                    <td align="right" width="50px">
                        <asp:Button ID="Button1" runat="server" Text="Entrar" CssClass="button" 
                            onclick="Button1_Click"  />
                    </td>
                    <td align="right" width="10px">
    
                    </td>
                </tr>
            </table>
	    </div>	            
        <center>
        <div id="pad">
            <br />
            <table width="790px">
                <tr>
                    <td width="395px" valign="middle">
  
                    </td>
                    <td width="395px" valign="middle" >
                        <asp:Image ID="Image1" runat="server" 
                            ImageUrl="~/Imagenes/logosimbolo_transparente.gif" />
                    </td>
                </tr>
            </table>
         </div>
         </center>
        <div id="footer">
		    <p>
		        &copy; 2013 13 <strong>Olabing</strong> |
		        <a href="http://www.bluewebtemplates.com/" title="Website Templates">Universidad de la amzonia</a>
   	        </p>
	    </div>	
    </div>
    </form>
</body>
</html>
