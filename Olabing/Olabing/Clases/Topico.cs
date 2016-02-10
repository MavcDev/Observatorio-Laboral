using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Olabing.Clases;

namespace Olabing.Clases
{
    public class Topico
    {
        private String id, concepto, encuesta;

        public Topico() { }

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

        public String Encuesta
        {
            get { return encuesta; }
            set { encuesta = value; }
        }

        public Topico[] cargar_por_encuesta(String id_encu)
        {
            Topico[] topicos;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select id_topico,concepto from topico where fk_encuesta=" + id_encu + ";");
                if (data != null)
                {
                    topicos = new Topico[data.Tables[0].Rows.Count];
                    for (int i = 0; i < topicos.Length; i++)
                    {
                        topicos[i] = new Topico();
                        topicos[i].Id = Convert.ToString(data.Tables[0].Rows[i][0]);
                        topicos[i].Concepto = Convert.ToString(data.Tables[0].Rows[i][1]);
                    }
                    cone.desconectar();
                    return topicos;
                }
            }
            cone.desconectar();
            return null;
        }

    }
}