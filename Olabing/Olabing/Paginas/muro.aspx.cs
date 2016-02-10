using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class muro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_noti_oferta();
            cargar_noti_foro();
            if(!IsPostBack){
                Session["r_muro"] = "10";
            }
        }

        public void cargar_noti_foro(){
            Foro[] foros = new Foro().cargar_noti_foro(Convert.ToString(Session["r_muro"]));
            if (foros != null)
            {
                for (int i = 0; i < foros.Length; i++)
                {
                    TableRow fila_nombre_foro = new TableRow();
                    TableCell celda1 = new TableCell();
                    HyperLink link = new HyperLink();
                    link.Text = foros[i].Usuario;
                    link.NavigateUrl = Global.ruta + "/perfil.aspx?cod=" + foros[i].Cod_usuario;
                    celda1.Controls.AddAt(0, link);
                    fila_nombre_foro.Cells.Add(celda1);
                    celda1.Attributes.Add("style", "BORDER-TOP:solid 2px blue");

                    TableRow espacio = new TableRow();
                    TableCell celda7 = new TableCell();
                    celda7.Text = "<br />";
                    espacio.Cells.Add(celda7);

                    TableRow ofertat = new TableRow();
                    TableRow oficio_oferta = new TableRow();
                    TableRow fecha_oferta = new TableRow();
                    TableRow fecha_limite = new TableRow();
                    TableRow ir_oferta = new TableRow();

                    TableCell celda2 = new TableCell();
                    celda2.Text = "Foro : " + foros[i].Tipo_foro;

                    TableCell celda3 = new TableCell();
                    celda3.Text = "Tema : " + foros[i].Tema;

                    TableCell celda4 = new TableCell();
                    celda4.Text = "Pregunta : " + foros[i].Pregunta;

                    TableCell celda6 = new TableCell();
                    celda6.Text = "Foro creada el : " + Convert.ToDateTime(foros[i].Fecha).ToString("dd-MM-yyyy");


                    TableCell celda5 = new TableCell();
                    HyperLink link_ir = new HyperLink();
                    link_ir.Text = "Ir al foro";
                    link_ir.NavigateUrl = Global.ruta + "/mostrar_foro.aspx?id=" + foros[i].Id;
                    celda5.Controls.AddAt(0, link_ir);
 
                    ofertat.Cells.Add(celda2);
                    oficio_oferta.Cells.Add(celda3);
                    fecha_limite.Cells.Add(celda6);
                    fecha_oferta.Cells.Add(celda4);
                    ir_oferta.Cells.Add(celda5);

                    Table2.Rows.Add(espacio);
                    Table2.Rows.Add(fila_nombre_foro);
                    Table2.Rows.Add(ofertat);
                    Table2.Rows.Add(oficio_oferta);
                    Table2.Rows.Add(fecha_oferta);
                    Table2.Rows.Add(fecha_limite);
                    Table2.Rows.Add(ir_oferta);
                }
            }
        }

        public void cargar_noti_oferta()
        {
            Oferta[] ofertas = new Oferta().cargar_notificacion(Convert.ToString(Session["r_muro"]));
            if(ofertas !=null){
                for (int i = 0; i < ofertas.Length;i++ )
                {
                    TableRow fila_nombre_foro = new TableRow();
                    TableCell celda1 = new TableCell();
                    HyperLink link = new HyperLink();
                    link.Text = ofertas[i].Usuario;
                    link.NavigateUrl = Global.ruta + "/perfil.aspx?cod=" + ofertas[i].Cod_usuario;
                    celda1.Controls.AddAt(0, link);
                    fila_nombre_foro.Cells.Add(celda1);
                    celda1.Attributes.Add("style", "BORDER-TOP:solid 2px blue");

                    TableRow espacio = new TableRow();
                    TableCell celda7 = new TableCell();
                    celda7.Text = "<br />";
                    espacio.Cells.Add(celda7);

                    TableRow ofertat = new TableRow();
                    TableRow oficio_oferta = new TableRow();
                    TableRow fecha_oferta = new TableRow();
                    TableRow fecha_limite = new TableRow();
                    TableRow ir_oferta = new TableRow();

                    TableCell celda2 = new TableCell();
                    celda2.Text = "Oferta : " + ofertas[i].Tipo;

                    TableCell celda3 = new TableCell();
                    celda3.Text = "Oficio : " + ofertas[i].Oficio;

                    TableCell celda4 = new TableCell();
                    celda4.Text = "Oferta Limte hasta el : " + Convert.ToDateTime(ofertas[i].Fecha_limite).ToString("dd-MM-yyyy");

                    TableCell celda6 = new TableCell();
                    celda6.Text = "Oferta creada el : " + Convert.ToDateTime(ofertas[i].Fecha).ToString("dd-MM-yyyy");



                    TableCell celda5 = new TableCell();
                    HyperLink link_ir = new HyperLink();
                    link_ir.Text = "Ir a la oferta";
                    celda5.Controls.AddAt(0, link_ir);
                    link_ir.NavigateUrl = Global.ruta + "/mostrar_oferta.aspx?id=" + ofertas[i].Id;

                    ofertat.Cells.Add(celda2);
                    oficio_oferta.Cells.Add(celda3);
                    fecha_oferta.Cells.Add(celda4);
                    fecha_limite.Cells.Add(celda6);
                    ir_oferta.Cells.Add(celda5);

                    Table1.Rows.Add(espacio);
                    Table1.Rows.Add(fila_nombre_foro);
                    Table1.Rows.Add(ofertat);
                    Table1.Rows.Add(oficio_oferta);
                    Table1.Rows.Add(fecha_limite);
                    Table1.Rows.Add(fecha_oferta);
                    Table1.Rows.Add(ir_oferta);
                }
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Table1 = new Table();
            Table2 = new Table();
            cargar_noti_oferta();
            cargar_noti_foro();
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if(Convert.ToString(Session["r_muro"]).Equals("10")){
                LinkButton1.Text = "Recoger";
                Session["r_muro"] = "1000";
            }else{
                LinkButton1.Text = "Ver mas";
                Session["r_muro"] = "10";
            }
            Table1 = new Table();
            Table2 = new Table();
            cargar_noti_oferta();
            cargar_noti_foro();
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