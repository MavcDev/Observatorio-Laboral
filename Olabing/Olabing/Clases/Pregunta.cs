using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Olabing.Clases;
using System.Data;

namespace Olabing.Clases
{
    public class Pregunta
    {
        private String id, concepto, pregunta, topico, tipo;

        public Pregunta() { }

        public String Id
        {
            get { return id; }
            set { id = value; }
        }

        public String Concepto
        {
            get { return concepto; }
            set { concepto = value; }
        }

        public String FK_Pregunta
        {
            get { return pregunta; }
            set { pregunta = value; }
        }

        public String Topico
        {
            get { return topico; }
            set { topico = value; }
        }

        public String Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public Pregunta[] cargar_por_topico(String id_topico)
        {
            Pregunta[] preguntas;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select id_pregunta,concepto,fk_tipo from pregunta where fk_topico="+id_topico+";");
                preguntas = new Pregunta[data.Tables[0].Rows.Count];
                if (data != null)
                {
                    for (int i = 0; i < preguntas.Length;i++ )
                    {
                        preguntas[i] = new Pregunta();
                        preguntas[i].Id = Convert.ToString(data.Tables[0].Rows[i][0]);
                        preguntas[i].Concepto = Convert.ToString(data.Tables[0].Rows[i][1]);
                        preguntas[i].Tipo = Convert.ToString(data.Tables[0].Rows[i][2]);
                    }
                    cone.desconectar();
                    return preguntas;
                }
            }
            cone.desconectar();
            return null;
        }
    }
}