<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crear_oferta.aspx.cs" Inherits="Olabing.Paginas.crear_oferta" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/Estilo/estilo_perfil.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
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
    <br />
    <br />
    <div>
        <center>
         <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <br />
            <table>
                <tr>
                    <td align="left" width="100px">
                        Oficio
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td align="left" width="100px">
                        Pre Requisitos
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="150px" Height="20px"></asp:TextBox>
                    </td>    
                </tr>
                <tr>
                    <td align="left" width="100px">
                        Entidad
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox3" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td align="left" width="100px">
                        Dirección
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox4" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" width="100px">
                        Telefono Celular
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox5" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td align="left" width="100px">
                        Telefono Celular</td>
                    <td align="left">
                        <asp:TextBox ID="TextBox6" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td align="left" Width="85px" >    
                        Telefono fijo
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox7" runat="server"  Width="125px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" width="100px">
                        Correo
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox8" runat="server"  Width="150px"></asp:TextBox>
                    </td>
                    <td align="left" width="100px">
                        Correo opcional
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox9" runat="server" Width="150px"></asp:TextBox>
                    </td>
                 </tr>
                 <tr>
                    <td align="left" width="100px" valign="top">
                        Mas Información
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine" Width="150px" Height="50px"></asp:TextBox>
                    </td>
                 </tr>
                 <tr>
                    <td align="left"  width="100px" >
                        Oferta hasta
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox11" runat="server" Width="150px"></asp:TextBox>
                    </td>
                 </tr>
                 <tr>
                    <td>
        
                    </td>
                    <td colspan="2" align="left">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Calendar ID="Calendar1" runat="server" Width="100px" Height="50px" 
                                    onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>     
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Crear" CssClass="button" onclick="Button1_Click" />
                    </td>
                 </tr>
            </table>
            </center>
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
