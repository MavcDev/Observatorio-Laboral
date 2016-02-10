using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class mostrar_foro : System.Web.UI.Page
    {

        private String id_foro;

        protected void Page_Load(object sender, EventArgs e)
        {
            id_foro =  Request.QueryString["id"];
            Foro foro = new Foro();
            foro.cargar(id_foro);
            Label1.Text = foro.Tipo_foro;
            Label2.Text = foro.Tema;
            Label3.Text ="¿ "+ foro.Pregunta+" ?";
            HyperLink1.Text = " "+foro.Usuario;
            HyperLink1.NavigateUrl = Global.ruta + "/perfil.aspx?cod=" + foro.Cod_usuario;
            Label5.Text = "Creado el : "+Convert.ToDateTime(foro.Fecha).ToString("dd-MM-yyyy");
            if(!IsPostBack){
                Session["r_foro"] = "10";
            }
            cargar_comentarios();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Comentariof comentaf = new Comentariof();
            comentaf.Cod_usuario =Convert.ToString(Session["cod"]);
            comentaf.Id_foro = id_foro;
            if(!String.IsNullOrWhiteSpace(TextBox1.Text)){
                comentaf.Texto = TextBox1.Text;
                comentaf.crear();
                TextBox1.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "borrar1", "document.getElementById('" + TextBox1.ClientID + "').value = \"\";", true);
                //cargar_comentario(HyperLink1.Text,Convert.ToString(Session["cod"]),TextBox1.Text,DateTime.Now.ToShortDateString(),true);
            }
        }

        public void cargar_comentario(String id_c, String nombre,String codnombre,String textocom,String fecha,String hora)
        {
            TableRow fila_nombre = new TableRow();
            TableRow fila_texto = new TableRow();
            TableRow fila_fecha = new TableRow();
            TableRow espacio = new TableRow();
            TableCell celda1 = new TableCell();
            TableCell celda2 = new TableCell();
            TableCell celda3 = new TableCell();
            TableCell celda4 = new TableCell();
            TextBox texto = new TextBox();
            texto.TextMode = TextBoxMode.MultiLine;
            texto.Width = 500;
            texto.Height = 100;
            texto.ReadOnly = true;
            HyperLink link = new HyperLink();
            link.Text = nombre;
            link.NavigateUrl = Global.ruta + "/perfil.aspx?cod=" + codnombre;
            celda1.Controls.AddAt(0, link);
            texto.Text = textocom;
            celda2.Text = Convert.ToDateTime(fecha).ToString("dd-MM-yyyy") + " - " + hora;
            celda3.Controls.AddAt(0, texto);
            celda4.Text = "<br />";
            fila_nombre.Cells.Add(celda1);
            fila_texto.Cells.Add(celda3);
            fila_fecha.Cells.Add(celda2);;
            espacio.Cells.Add(celda4);
            Table1.Rows.Add(fila_nombre);
            Table1.Rows.Add(fila_texto);
            Table1.Rows.Add(fila_fecha);
            Table1.Rows.Add(espacio);
        }

        public void cargar_comentarios()
        {
            Comentariof comentaf = new Comentariof();
            Comentariof[] comentarios = comentaf.cargar_todos(id_foro,Convert.ToString(Session["r_foro"]));
            if(comentarios!=null){
                for (int i = 0; i < comentarios.Length;i++ )
                {
                    cargar_comentario(comentarios[i].Id, comentarios[i].Usuario, comentarios[i].Cod_usuario, comentarios[i].Texto, comentarios[i].Fecha,comentarios[i].Hora);
                }
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Table1 = new Table();
            cargar_comentarios();
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Paginas/user_login.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["r_foro"]).Equals("10"))
            {
                LinkButton3.Text = "Recoger";
                Session["r_foro"] = "1000";
            }
            else
            {
                LinkButton3.Text = "Ver mas";
                Session["r_foro"] = "10";
            }
        }
    }
}