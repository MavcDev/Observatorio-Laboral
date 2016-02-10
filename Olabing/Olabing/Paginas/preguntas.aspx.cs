using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Olabing.Clases;

namespace Olabing.Paginas
{
    public partial class preguntas : System.Web.UI.Page
    {

        private String topico;
        private String concepto;

        protected void Page_Load(object sender, EventArgs e)
        {
            int n= Convert.ToInt32(Session["r_top_e0"]) ;
            Topico[] topicos = ((Topico[])Session["topico_e0"]);
            if (n == 0)
            {
                Button2.Visible = false;
            }
            else
            {
                Button2.Visible = true;
            }
            if (n == topicos.Length - 1)
            {
                Button1.Visible = false;
                Button3.Visible = true;
            }
            else
            {
                Button1.Visible = true;
                Button3.Visible = false;
            }

            topico = Request.QueryString["top"];
            concepto = Request.QueryString["conp"];
            Label1.Text = concepto;
            Session["compo"] = new List<Object>();
            Session["tipos"] = new List<String>();
            cargar_pregunta();
        }

        public void cargar_pregunta()
        {
            Pregunta[] preguntas = new Pregunta().cargar_por_topico(topico);
            for (int i = 0; i < preguntas.Length;i++ )
            {
                TableRow fila = new TableRow();
                TableCell celda = new TableCell();
                celda.Text = (i+1) + ". " + preguntas[i].Concepto;
                fila.Cells.Add(celda);
                Table1.Rows.Add(fila);
                cargar_respuesta(preguntas[i].Id, preguntas[i].Tipo);
                TableRow filae = new TableRow();
                TableCell celdae = new TableCell();
                celdae.Text = "<br />";
                filae.Cells.Add(celdae);
                Table1.Rows.Add(filae);
            }
        }

        public void cargar_respuesta(String id_p,String id_t)
        {
            if(id_t.Equals("1")){
                RadioButtonList rl = new RadioButtonList();
                ((List<Object>)  Session["compo"]).Add(rl);
                ((List<String>)  Session["tipos"]).Add("1");
                Respuesta[] respuestas= new Respuesta().cargar_por_pregunta(id_p);
                for (int i = 0; i < respuestas.Length;i++ )
                {
                    ListItem item = new ListItem();
                    item.Text = respuestas[i].Concepto + " " + respuestas[i].Ir;
                    item.Value = respuestas[i].Id;
                    rl.Items.Add(item);
                }
                TableRow fila = new TableRow();
                TableCell celda = new TableCell();

                celda.Controls.AddAt(0, rl);
                fila.Cells.Add(celda);
                Table1.Rows.Add(fila);
            }
            if (id_t.Equals("2"))
            {
                Respuesta[] respuestas = new Respuesta().cargar_por_pregunta(id_p);
                for (int i = 0; i < respuestas.Length; i++)
                {
                    TableRow fila = new TableRow();
                    TableCell celda = new TableCell();
                    Label eti = new Label();
                    eti.Text = respuestas[i].Concepto + " ";
                    TextBox text = new TextBox();
                    text.ID = respuestas[i].Id;
                    ((List<String>)Session["tipos"]).Add("2");
                    ((List<Object>)Session["compo"]).Add(text);
                    celda.Controls.AddAt(0,eti);
                    celda.Controls.AddAt(1, text);
                    fila.Cells.Add(celda);
                    Table1.Rows.Add(fila);
                }
            }
            if (id_t.Equals("3"))
            {
                CheckBoxList cl = new CheckBoxList();
                ((List<Object>)Session["compo"]).Add(cl);
                ((List<String>)Session["tipos"]).Add("3");
                Respuesta[] respuestas = new Respuesta().cargar_por_pregunta(id_p);
                for (int i = 0; i < respuestas.Length; i++)
                {
                    ListItem item = new ListItem();
                    item.Text = respuestas[i].Concepto + " " + respuestas[i].Ir;
                    item.Value = respuestas[i].Id;
                    cl.Items.Add(item);
                }
                TableRow fila = new TableRow();
                TableCell celda = new TableCell();

                celda.Controls.AddAt(0, cl);
                fila.Cells.Add(celda);
                Table1.Rows.Add(fila);
            }
            if (id_t.Equals("4"))
            {
                RadioButtonList rl = new RadioButtonList();
                ((List<Object>)Session["compo"]).Add(rl);
                ((List<String>)Session["tipos"]).Add("4");
                Respuesta[] respuestas = new Respuesta().cargar_por_pregunta(id_p);
                for (int i = 0; i < respuestas.Length-1; i++)
                {
                    ListItem item = new ListItem();
                    item.Text = respuestas[i].Concepto;
                    item.Value = respuestas[i].Id;
                    rl.Items.Add(item);
                }
                TableRow fila = new TableRow();
                TableCell celda = new TableCell();
                celda.Controls.AddAt(0, rl);
                fila.Cells.Add(celda);
                Table1.Rows.Add(fila);
                TableRow fila2 = new TableRow();
                TableCell celda2 = new TableCell();
                TextBox text = new TextBox();
                text.ID = respuestas[respuestas.Length - 1].Id;
                ((List<Object>)Session["compo"]).Add(text);
                ((List<String>)Session["tipos"]).Add("4");
                Label eti = new Label();
                eti.Text = respuestas[respuestas.Length - 1].Concepto + " ";
                celda2.Controls.AddAt(0,eti);
                celda2.Controls.AddAt(1,text);
                fila2.Cells.Add(celda2);
                Table1.Rows.Add(fila2);
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            guardar_data();
            Session["r_top_e0"] = Convert.ToInt32(Session["r_top_e0"]) + 1;
            Topico[] topicos = ((Topico[])Session["topico_e0"]);
            Response.Redirect("~/Paginas/preguntas.aspx?top=" + topicos[Convert.ToInt32(Session["r_top_e0"])].Id + "&conp=" + topicos[Convert.ToInt32(Session["r_top_e0"])] .Concepto+ "");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["r_top_e0"] = Convert.ToInt32(Session["r_top_e0"]) - 1;
            Topico[] topicos = ((Topico[])Session["topico_e0"]);
            Response.Redirect("~/Paginas/preguntas.aspx?top=" + topicos[Convert.ToInt32(Session["r_top_e0"])].Id + "&conp=" + topicos[Convert.ToInt32(Session["r_top_e0"])].Concepto + "");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            guardar_data();
            Detalle_encuesta de = new Detalle_encuesta();
            de.Encuesta = Convert.ToString(Session["encuesta"]);
            de.Usuario = Convert.ToString(Session["cod"]);
            de.crear();
            Response.Redirect("~/Paginas/terminacion.aspx");

        }

        public void guardar_data()
        {
            List<Object> componentes = ((List<Object>)Session["compo"]);
            List<Object> componentesax = ((List<Object>)Session["compoaxu"]);
            List<String> tipos = ((List<String>)Session["tipos"]);
            for (int i = 0; i < componentes.Count; i++)
            {
                Detalle_respuesta dr = new Detalle_respuesta();
                if (tipos[i].Equals("1"))
                {
                    dr.Respuesta = ((RadioButtonList)componentes[i]).SelectedValue;
                    dr.Justificacion = "";
                    dr.Usuario = Convert.ToString(Session["cod"]);
                }
                if (tipos[i].Equals("2"))
                {
                    dr.Justificacion = ((TextBox)componentes[i]).Text;
                    dr.Respuesta = ((TextBox)componentes[i]).ID;
                    dr.Usuario = Convert.ToString(Session["cod"]);
                }
                if (tipos[i].Equals("4"))
                {
                    dr.Respuesta = ((RadioButtonList)componentes[i]).SelectedValue;
                    dr.Justificacion = "";
                    dr.Usuario = Convert.ToString(Session["cod"]);
                    dr.crear();

                    dr.Respuesta = ((TextBox)componentes[i+1]).ID;
                    dr.Justificacion = ((TextBox)componentes[i + 1]).Text;
                    dr.Usuario = Convert.ToString(Session["cod"]);
                    i += 1;
                }
                dr.crear();
                if (tipos[i].Equals("3"))
                {
                    CheckBoxList cl = ((CheckBoxList)componentes[i]);
                    for (int j = 0; j < cl.Items.Count; j++)
                    {
                        if (cl.Items[j].Selected)
                        {
                            Detalle_respuesta drs = new Detalle_respuesta();
                            drs.Justificacion = "";
                            drs.Respuesta = cl.Items[j].Value;
                            drs.Usuario = Convert.ToString(Session["cod"]);
                            drs.crear();
                        }
                    }
                }

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Paginas/user_login.aspx");
        }
     
    }
}