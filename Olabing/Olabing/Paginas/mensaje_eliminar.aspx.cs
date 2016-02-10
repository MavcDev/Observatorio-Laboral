using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class mensaje_eliminar : System.Web.UI.Page
    {

        private String id;
        private String op;

        protected void Page_Load(object sender, EventArgs e)
        {
            id=Request.QueryString["id"];
            op = Request.QueryString["op"];
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.close();</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (op.Equals("1"))
            {
                new Foro().eliminar(id);
            }
            else
            {
                new Oferta().eliminar(id);
            }
            Response.Write("<script>opener.document.location.reload();</script>");
            Response.Write("<script>window.close();</script>");
        }
    }
}