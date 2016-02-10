using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class encuesta0 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["topico_e0"] = new Topico().cargar_por_encuesta("1");
            Session["encuesta"] = "1";
            Topico[] topicos = (Topico[])Session["topico_e0"];
            Session["r_top_e0"] = 0;
            Response.Redirect("~/Paginas/preguntas.aspx?top=" + topicos[Convert.ToInt32(Session["r_top_e0"])].Id + "&conp=" + topicos[Convert.ToInt32(Session["r_top_e0"])] .Concepto+ "");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Paginas/user_login.aspx");
        }
    }
}