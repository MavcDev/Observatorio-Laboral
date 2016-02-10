using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class egresados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_egresados();
        }

        public void cargar_egresados()
        {
            Usuario[] egresados = new Usuario().cargar_egresados();
            for (int i = 0; i < egresados.Length;i++ )
            {
                TableRow fila1 = new TableRow();
                TableRow fila2 = new TableRow();
                TableRow fila3 = new TableRow();
                TableRow fila4 = new TableRow();
                TableRow filaf = new TableRow();
                HyperLink link = new HyperLink();
                TableRow espacio = new TableRow();
                TableCell vacio = new TableCell();
                vacio.Text = "<br />";
                espacio.Cells.Add(vacio);
                TableCell foto = new TableCell();
                foto.Attributes.Add("style", "BORDER-TOP:solid 2px blue; BORDER-left:solid 1px blue");
                foto.Width = 90;
                foto.RowSpan = 4;
                Image image = new Image();
                image.ImageUrl = egresados[i].Foto;
                image.Width = 90; image.Height = 100;
                foto.Controls.AddAt(0, image);
                TableCell nombres = new TableCell();
                Label text = new Label();
                text.Text = "Nombres : ";
                nombres.Attributes.Add("style", "BORDER-TOP:solid 2px blue");
                link.Text = egresados[i].Primer_nombre + " " + egresados[i].Segundo_nombre;
                link.NavigateUrl = Global.ruta + "/perfil.aspx?cod=" + egresados[i].Codigo;
                nombres.Controls.AddAt(0, text);
                nombres.Controls.AddAt(1, link);                
                TableCell apellidos = new TableCell();
                apellidos.Text = "Apellidos : " + egresados[i].Primer_apellido + " " + egresados[i].Segundo_apellido;
                TableCell correo = new TableCell();
                correo.Text = "Correo : " + egresados[i].Correo_personal;
                TableCell añog = new TableCell();
                añog.Text = "Graduado en el año : " + egresados[i].Año_grado;
                fila1.Cells.Add(foto);
                fila1.Cells.Add(nombres);
                fila2.Cells.Add(apellidos);
                fila3.Cells.Add(correo);
                fila4.Cells.Add(añog);

                Table1.Rows.Add(fila1);
                Table1.Rows.Add(fila2);
                Table1.Rows.Add(fila3);
                Table1.Rows.Add(fila4);
                Table1.Rows.Add(espacio);
            }

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
    }
}