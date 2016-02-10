using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class foros_academico : System.Web.UI.Page
    {
        private String cod;

        protected void Page_Load(object sender, EventArgs e)
        {
            cod = Convert.ToString(Session["cod"]);
            cargar_encabezado();
            cargar_foros_academicos();
        }

        public void cargar_foros_academicos()
        {
            Foro[] foros = new Foro().cargar_por_tipo("1");
            for (int i = 0; i < foros.Length;i++ )
            {
                TableRow fila1 = new TableRow();
                fila1.Height = 30;
                TableCell celda = new TableCell();
                celda.CssClass = "td";
                celda.Text = foros[i].Tema;
                TableCell celda1 = new TableCell();
                celda1.CssClass = "td";
                celda1.Text = foros[i].Pregunta;
                TableCell celda2 = new TableCell();
                celda2.CssClass = "td";
                celda2.Text = Convert.ToDateTime(foros[i].Fecha).ToString("dd-MM-yyyy");
                TableCell celda3 = new TableCell();
                celda3.CssClass = "td";
                HyperLink link_usu = new HyperLink();
                link_usu.Text= foros[i].Usuario;
                celda3.Controls.AddAt(0, link_usu);
                TableCell celda4 = new TableCell();
                celda4.CssClass = "td";
                HyperLink link = new HyperLink();
                link.NavigateUrl = Global.ruta + "/mostrar_foro.aspx?id=" + foros[i].Id;
                link.Text = "Ir al foro";
                celda4.Controls.AddAt(0, link);

                fila1.Cells.Add(celda);
                fila1.Cells.Add(celda1);
                fila1.Cells.Add(celda2);
                fila1.Cells.Add(celda3);
                fila1.Cells.Add(celda4);

                TableCell celda5 = new TableCell();
                celda5.CssClass = "td";
                TableCell celda6 = new TableCell();
                celda6.CssClass = "td";

                if(foros[i].Cod_usuario.Equals(cod)){
                    ImageButton edit = new ImageButton();
                    edit.ImageUrl = "~/Imagenes/edit.png";
                    edit.CommandName = foros[i].Id;
                    edit.PostBackUrl="~/Paginas/editar_foro.aspx?tipo=1&fo="+foros[i].Id+"";
                    celda5.Controls.AddAt(0, edit);
                    HyperLink link_eli = new HyperLink();
                    link_eli.Text = "<a href=\"ejemplo.htm\" target=\"_blank\" onClick=\"window.open('/Paginas/mensaje_eliminar.aspx?id=" + foros[i].Id + "&op=1', this.target, 'width=250,height=50,left=540,top=200,scrollbars=NO, resizable=NO'); return false;\"><img src=\"/Imagenes/eliminar_btn.png\"></a>";
                    celda6.Controls.AddAt(0, link_eli);
                }
                fila1.Cells.Add(celda5);
                fila1.Cells.Add(celda6);
                Table1.Rows.Add(fila1);
            }
        }

        public void cargar_encabezado()
        {
            Table1.CssClass = "table";
            TableRow fila = new TableRow();
            fila.CssClass = "tr";
            String[] titulos ={"Tema","Pregunta","Fecha creacion","Usuario","Abrir","Modificar","Eliminar"};
            for (int i = 0; i < titulos.Length;i++ )
            {
                TableHeaderCell celda = new TableHeaderCell();
                celda.CssClass = "th";
                celda.Text = titulos[i];
                fila.Cells.Add(celda);
            }
            Table1.Rows.Add(fila);
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Paginas/user_login.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
        }
    }
}