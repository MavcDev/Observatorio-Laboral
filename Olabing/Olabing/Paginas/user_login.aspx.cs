using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class user_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Global.ruta = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.LastIndexOf("/"));

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Login_user login_user = new Login_user();
            login_user.Nick = TextBox2.Text;
            login_user.Password = TextBox1.Text;
            if (login_user.Verificar_login())
            {
                Session["cod"] = login_user.CodUsuario;
                if (login_user.TipoUsuario.Equals("2"))
                {
                    if (!new Detalle_encuesta().encuesta_0(login_user.CodUsuario))
                    {
                        Response.Redirect("~/Paginas/encuesta0.aspx");
                    }
                    Response.Redirect("~/Paginas/perfil.aspx?cod=" + login_user.CodUsuario);
                }
                else
                {
                    Response.Redirect("~/Paginas/perfil.aspx?cod=" + login_user.CodUsuario);
                }
            }
        }
        

    }
}