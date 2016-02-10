using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class chat_mensaje : System.Web.UI.Page
    {
        private String cod;
        private String rec;

        protected void Page_Load(object sender, EventArgs e)
        {
            rec = Convert.ToString(Session["rec"]);
            cod = Convert.ToString(Session["cod"]);
            cargar_contactos();
            if(!IsPostBack){
                Session["r_chat"] = "4";
                HyperLink1.Text = Convert.ToString(Session["name"]);
                HyperLink1.NavigateUrl = Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]);
            }
        }

        public void cargar_contactos()
        {
            Usuario[] contactos = new Usuario().contactos(cod);
            for (int i = 0; i < contactos.Length; i++)
            {
                TableRow fila = new TableRow();
                TableCell celda = new TableCell();
                TableCell foto = new TableCell();
                LinkButton link = new LinkButton();
                link.Text = contactos[i].Primer_nombre + " " + contactos[i].Primer_apellido;
                link.CommandName = contactos[i].Codigo;
                link.Click += msn_Click;
                celda.Controls.AddAt(0, link);
                Image fotoc = new Image();
                fotoc.Width = 40; fotoc.Height = 40;
                fotoc.ImageUrl = contactos[i].Foto;
                foto.Controls.AddAt(0, fotoc);
                fila.Cells.Add(foto);
                fila.Cells.Add(celda);
                Table1.Rows.Add(fila);
            }
        }

        protected void msn_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            rec = ((LinkButton)sender).CommandName;
            Session["rec"] = rec;
            if(!String.IsNullOrWhiteSpace(rec)){
                cargar_texto();
            }
        }

        public void cargar_texto()
        {
            Chat[] mensajes = new Chat().cargar_chat(cod, rec,Convert.ToString(Session["r_chat"]));
            for (int i = mensajes.Length-1; i >= 0 ;i-- )
            {
                    TextBox1.Text += mensajes[i].Usuario_emisor + "\n";
                    TextBox1.Text += mensajes[i].Texto + "\n";
                    TextBox1.Text += Convert.ToDateTime(mensajes[i].Fecha).ToString("dd-MM-yyyy") +" - " + mensajes[i].Hora + "\n\n";
                    if(mensajes[i].Emisor.Equals(rec)){
                        HyperLink1.Text = mensajes[i].Usuario_emisor;
                        HyperLink1.NavigateUrl = Global.ruta + "/perfil.aspx?cod=" + mensajes[i].Emisor;
                    }
            }
            
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            if (!String.IsNullOrWhiteSpace(rec))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ScrollTextbox", "document.getElementById('" + TextBox1.ClientID + "').scrollTop = document.getElementById('" + TextBox1.ClientID + "').scrollHeight; " + " ", true);
                cargar_texto();
            }
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Chat mensaje = new Chat();
            mensaje.Texto = TextBox2.Text;
            mensaje.Emisor = cod;
            mensaje.Receptor = rec;
            mensaje.crear();
            TextBox2.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "borrar","document.getElementById('" + TextBox2.ClientID + "').value = \"\";", true);
            cargar_texto();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["r_chat"]).Equals("4"))
            {
                LinkButton1.Text = "Recoger Historial";
                Session["r_chat"] = "1000";
            }
            else
            {
                LinkButton1.Text = "Ver Historial";
                Session["r_chat"] = "4";
            }
            cargar_texto();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Paginas/user_login.aspx");
        }

    }
}