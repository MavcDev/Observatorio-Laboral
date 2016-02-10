using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class mostrar_oferta : System.Web.UI.Page
    {
        private String id_oferta;
        private Oferta oferta;

        protected void Page_Load(object sender, EventArgs e)
        {
            id_oferta = Request.QueryString["id"];
            oferta = new Oferta();
            oferta.cargar(id_oferta);
            Label1.Text = oferta.Oficio;
            Label2.Text = oferta.Pre_requisito;
            Label3.Text = oferta.Entidad;
            Label4.Text = oferta.Direccion;
            Label5.Text = oferta.Telefono_cel;
            Label6.Text = oferta.Telefono_cel_opcional;
            Label7.Text = oferta.Telefono_fijo;
            Label8.Text = oferta.Correo;
            Label9.Text = oferta.Correo_opcional;
            Label10.Text = oferta.Informacion_adicional;
            Label11.Text = Convert.ToDateTime(oferta.Fecha_limite).ToString("dd-MM-yyyy");
            Label12.Text = Convert.ToDateTime(oferta.Fecha).ToString("dd-MM-yyyy");

            if (oferta.Tipo.Equals("1"))
            {
                Label13.Text = "Oferta Academica";
            }
            else
            {
                Label13.Text = "Oferta Empleo";
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