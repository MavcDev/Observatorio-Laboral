using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class crear_foro : System.Web.UI.Page
    {

        private String cod_tipo;

        protected void Page_Load(object sender, EventArgs e)
        {
            cod_tipo = Request.QueryString["tipo"];
            if (cod_tipo.Equals("1"))
            {
                Label7.Text = "Foro Academico";
            }
            else
            {
                Label7.Text = "Foro Investigativo";
            }
            if (!IsPostBack)
            {
                DropDownList2.DataSource = ListasDesple.getTema();
                DropDownList2.DataTextField = "nombre";
                DropDownList2.DataValueField = "id_tema";
                DropDownList2.DataBind();
            }
        }


        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Global.ruta + "/perfil.aspx?cod=" + Convert.ToString(Session["cod"]));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Foro foroe = new Foro();
            foroe.Cod_usuario = Convert.ToString(Session["cod"]);
            foroe.Tipo_foro = cod_tipo;
            foroe.Tema = DropDownList2.SelectedValue;
            if (!String.IsNullOrWhiteSpace(TextBox1.Text))
            {
                foroe.Pregunta = TextBox1.Text;
                foroe.crear();
                if (foroe.Tipo_foro.Equals("1"))
                {
                    Response.Redirect(Global.ruta + "/foros_academico.aspx");
                }
                else
                {
                    Response.Redirect(Global.ruta + "/foros_investigacion.aspx");
                }
                
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