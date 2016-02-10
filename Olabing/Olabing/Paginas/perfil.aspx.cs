using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;
using System.Data;

namespace Olabing.Paginas
{
    public partial class perfil : System.Web.UI.Page
    {
        private String cod;

        protected void Page_Load(object sender, EventArgs e)
        {
            cod= Request.QueryString["cod"];
            if (!IsPostBack)
            {
                Usuario usuario = new Usuario();
                usuario.cargar(cod);
                Label1.Text = usuario.Primer_nombre + " " + usuario.Segundo_nombre;
                Label2.Text = usuario.Primer_apellido + " " + usuario.Segundo_apellido;
                Label3.Text = usuario.Correo_personal; Label4.Text = usuario.Correo_institucional;
                Label5.Text = usuario.Rol;
                Image1.ImageUrl = usuario.Foto;
                cargar_notificaciones();
            }

        }

        public void cargar_notificaciones()
        {
            DataSet data_note = ListasDesple.getNotificaciones(cod);
            if(data_note!=null){
                for (int i = 0; i < data_note.Tables[0].Rows.Count; i++)
                {
                    TableRow fila_nombre_foro = new TableRow();
                    TableCell celda1 = new TableCell();
                    HyperLink link = new HyperLink();
                    link.Text = Convert.ToString(data_note.Tables[0].Rows[i][11]);
                    link.NavigateUrl = Global.ruta + "/perfil.aspx?cod=" + data_note.Tables[0].Rows[i][10];
                    celda1.Controls.AddAt(0, link);
                    fila_nombre_foro.Cells.Add(celda1);
                    celda1.Attributes.Add("style", "BORDER-TOP:solid 2px blue");

                    TableRow espacio = new TableRow();
                    TableCell celda7 = new TableCell();
                    celda7.Text = "<br />";
                    espacio.Cells.Add(celda7);

                    if (Convert.ToString(data_note.Tables[0].Rows[i][9]).Equals("foro"))
                    {

                        TableRow forot = new TableRow();
                        TableRow tema_foro = new TableRow();
                        TableRow pregunta_foro = new TableRow();
                        TableRow fecha_foro = new TableRow();
                        TableRow ir_foro = new TableRow();


                        TableCell celda2 = new TableCell();
                        celda2.Text = "Foro : " + Convert.ToString(data_note.Tables[0].Rows[i][3]);

                        TableCell celda3 = new TableCell();
                        celda3.Text = "Tema : " + Convert.ToString(data_note.Tables[0].Rows[i][4]);

                        TableCell celda4 = new TableCell();
                        celda4.Text = "Pregunta : " + Convert.ToString(data_note.Tables[0].Rows[i][2]);

                        TableCell celda5 = new TableCell();
                        celda5.Text = "Foro creado el : " + Convert.ToDateTime(data_note.Tables[0].Rows[i][1]).ToString("dd-MM-yyyy");

                        TableCell celda6 = new TableCell();
                        HyperLink link_ir = new HyperLink();
                        link_ir.Text = "Ir al foro";
                        link_ir.NavigateUrl = Global.ruta + "/mostrar_foro.aspx?id=" + data_note.Tables[0].Rows[i][0];
                        celda6.Controls.AddAt(0, link_ir);

                        forot.Cells.Add(celda2);
                        tema_foro.Cells.Add(celda3);
                        pregunta_foro.Cells.Add(celda4);
                        fecha_foro.Cells.Add(celda5);
                        ir_foro.Cells.Add(celda6);

                        Table1.Rows.Add(espacio);
                        Table1.Rows.Add(fila_nombre_foro);
                        Table1.Rows.Add(forot);
                        Table1.Rows.Add(tema_foro);
                        Table1.Rows.Add(pregunta_foro);
                        Table1.Rows.Add(fecha_foro);
                        Table1.Rows.Add(ir_foro);
                    }
                    else
                    {
                        if (Convert.ToString(data_note.Tables[0].Rows[i][9]).Equals("oferta"))
                        {
                            TableRow ofertat = new TableRow();
                            TableRow oficio_oferta = new TableRow();
                            TableRow fecha_oferta = new TableRow();
                            TableRow ir_oferta = new TableRow();

                            TableCell celda2 = new TableCell();
                            celda2.Text = "Oferta : " + Convert.ToString(data_note.Tables[0].Rows[i][7]);

                            TableCell celda3 = new TableCell();
                            celda3.Text = "Oficio : " + Convert.ToString(data_note.Tables[0].Rows[i][2]);

                            TableCell celda4 = new TableCell();
                            celda4.Text = "Oferta creada el : " + Convert.ToDateTime(data_note.Tables[0].Rows[i][1]).ToString("dd-MM-yyyy");

                            TableCell celda5 = new TableCell();
                            HyperLink link_ir = new HyperLink();
                            link_ir.Text = "Ir a la oferta";
                            celda5.Controls.AddAt(0, link_ir);
                            link_ir.NavigateUrl = Global.ruta + "/mostrar_oferta.aspx?id=" + Convert.ToString(data_note.Tables[0].Rows[i][0]);


                            ofertat.Cells.Add(celda2);
                            oficio_oferta.Cells.Add(celda3);
                            fecha_oferta.Cells.Add(celda4);
                            ir_oferta.Cells.Add(celda5);

                            Table1.Rows.Add(espacio);
                            Table1.Rows.Add(fila_nombre_foro);
                            Table1.Rows.Add(ofertat);
                            Table1.Rows.Add(oficio_oferta);
                            Table1.Rows.Add(fecha_oferta);
                            Table1.Rows.Add(ir_oferta);

                        }
                    }
                }
            }
        }

        /*
         * 
         * window.open('Encuesta/InformacionGeneral.aspx', '', 'fullscreen=1');
         */

        protected void Timer1_Tick(object sender, EventArgs e)
        {
       //     Table1 = new Table();
            cargar_notificaciones();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Global.ruta + "/foros.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Global.ruta + "/ofertas.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
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