using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class editar_oferta : System.Web.UI.Page
    {
        private String cod;
        private String cod_tipo;
        private String cod_ofe;
        private Oferta oferta;

        protected void Page_Load(object sender, EventArgs e)
        {
            cod_tipo = Request.QueryString["tipo"];
            cod = Convert.ToString(Session["cod"]);
            cod_ofe = Request.QueryString["ofe"];
            oferta = new Oferta();
            oferta.cargar(cod_ofe);
            if (cod_tipo.Equals("1"))
            {
                Label1.Text = "Oferta Academica";
            }
            else
            {
                Label1.Text = "Oferta Empleo";
            }
            if(!IsPostBack){
                TextBox1.Text = oferta.Oficio;
                TextBox2.Text = oferta.Pre_requisito;
                TextBox3.Text = oferta.Entidad;
                TextBox4.Text = oferta.Direccion;
                TextBox5.Text = oferta.Telefono_cel;
                TextBox6.Text = oferta.Telefono_cel_opcional;
                TextBox7.Text = oferta.Telefono_fijo;
                TextBox8.Text = oferta.Correo;
                TextBox9.Text = oferta.Correo_opcional;
                TextBox10.Text = oferta.Informacion_adicional;
                TextBox11.Text = Convert.ToDateTime(oferta.Fecha_limite).ToString("yyyy-MM-dd");
            }
        }
        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Oferta oferta = new Oferta();
            oferta.Id = cod_ofe;
            oferta.Cod_usuario = cod;
            oferta.Tipo = cod_tipo;
            oferta.Oficio = TextBox1.Text;
            oferta.Pre_requisito = TextBox2.Text;
            oferta.Entidad = TextBox3.Text;
            oferta.Direccion = TextBox4.Text;
            oferta.Telefono_cel = TextBox5.Text;
            oferta.Telefono_cel_opcional = TextBox6.Text;
            oferta.Telefono_fijo = TextBox7.Text;
            oferta.Correo = TextBox8.Text;
            oferta.Correo_opcional = TextBox9.Text;
            oferta.Informacion_adicional = TextBox10.Text;
            oferta.Fecha_limite = TextBox11.Text;
            oferta.editar();
            if (cod_tipo.Equals("1"))
            {
                Response.Redirect(Global.ruta + "/ofertas_academico.aspx");
            }
            else
            {
                Response.Redirect(Global.ruta + "/ofertas_empleo.aspx");
            }   
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "fecha", "document.getElementById('" + TextBox11.ClientID + "').value = \" " + Calendar1.SelectedDate.Year + "-" + Calendar1.SelectedDate.Month + "-" + Calendar1.SelectedDate.Day + "\";", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mostrar", "document.getElementById('" + Calendar1.ClientID + "').style.visibility='hidden';", true);
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