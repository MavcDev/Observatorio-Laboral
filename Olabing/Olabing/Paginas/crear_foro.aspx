<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crear_foro.aspx.cs" Inherits="Olabing.Paginas.crear_foro" %>

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
                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Perfil</asp:LinkButton>| 
                            <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Cerrar</asp:LinkButton>
			            </p>		
		            </div>
            </div>
              <div  id="menu">
                        <table>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButton2" runat="server" 
                                        ImageUrl="~/Imagenes/perfil.png" ToolTip="Perfil" 
                                        onclick="ImageButton1_Click1" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton3" runat="server" 
                                        ImageUrl="~/Imagenes/muro.png" ToolTip="Notificaciones" 
                                        PostBackUrl="~/Paginas/muro.aspx"  />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton4" runat="server" 
                                        ImageUrl="~/Imagenes/chat.png" ToolTip="Chat" 
                                        PostBackUrl="~/Paginas/chat_mensaje.aspx" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                        ImageUrl="~/Imagenes/egresado.png" PostBackUrl="~/Paginas/egresados.aspx" 
                                        ToolTip="Muro Egresados" />
                                </td>
                                <td>
                                    <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" >
                                        <DynamicHoverStyle BackColor="#8AD32E" ForeColor="White" />
                                        <DynamicMenuStyle BackColor="#A3E359"  HorizontalPadding="5px" BorderWidth="1px" BorderColor="#31B404" />
                                        <Items>
                                            <asp:MenuItem Text="Academico" Value="Academico" Selectable="False" 
                                                ImageUrl="~/Imagenes/academico.png">
                                                <asp:MenuItem Text="   Foros" Value="   Foros" ImageUrl="~/Imagenes/foros.png" 
                                                    NavigateUrl="~/Paginas/foros_academico.aspx"></asp:MenuItem>
                                                <asp:MenuItem Text="   Ofertas" Value="   Ofertas" ImageUrl="~/Imagenes/oferta_academica.png" 
                                                    NavigateUrl="~/Paginas/ofertas_academico.aspx"></asp:MenuItem>
                                            </asp:MenuItem>
                                            <asp:MenuItem ImageUrl="~/Imagenes/social.png" Selectable="False" Text="Social" 
                                                Value="Social">
                                                <asp:MenuItem ImageUrl="~/Imagenes/oferta_empleo.png" 
                                                    NavigateUrl="~/Paginas/ofertas_empleo.aspx" Text="   Ofertas" 
                                                    Value="   Ofertas"></asp:MenuItem>
                                                <asp:MenuItem ImageUrl="~/Imagenes/chats.png" 
                                                    NavigateUrl="~/Paginas/chat_mensaje.aspx" Text="   Chat" Value="   Chat">
                                                </asp:MenuItem>
                                            </asp:MenuItem>
                                            <asp:MenuItem ImageUrl="~/Imagenes/investigacion.png" Selectable="False" 
                                                Text="Investigación" Value="Investigación">
                                                <asp:MenuItem ImageUrl="~/Imagenes/foros.png" 
                                                    NavigateUrl="~/Paginas/foros_investigacion.aspx" Text="   Foros" 
                                                    Value="   Foros"></asp:MenuItem>
                                            </asp:MenuItem>
                                        </Items>
                                    </asp:Menu>
                                </td>
                            </tr>
                        </table>
	            </div>
        <div id="pad">
            <center>
            <br />
            <br />
                <asp:Label ID="Label7" runat="server" Font-Size="Large" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            <table>
                <tr>
                    <td heigth="400px" align="left">
                        Pregunta
                    </td>
                </tr>
                <tr>
                    <td heigth="400px" align="left">
                        ¿<asp:TextBox ID="TextBox1" runat="server" Width="402px" CssClass="textbox" ></asp:TextBox>?
                    </td>
                </tr>
                <tr>
                    <td heigth="150" align="left">
                        Tema
                    </td>
                </tr>
                <tr>
                    <td heigth="150" align="left">
                        <asp:DropDownList ID="DropDownList2" runat="server" Width="150">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
                <asp:Button ID="Button1" runat="server" Text="Crear" CssClass="button" 
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
