using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Olabing.Clases;
using System.Data;

namespace Olabing.Clases
{
    public class Respuesta
    {
        private String id, concepto, pregunta,ir;

        public Respuesta() { }

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

        public String Pregunta
        {
            get { return pregunta; }
            set { pregunta = value; }
        }

        public String Ir
        {
            get { return ir; }
            set { ir = value; }
        }

        public Respuesta[] cargar_por_pregunta(String id_pre)
        {
            Respuesta[] respuesta;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select id_respuesta,concepto,ir from respuesta where fk_pregunta ="+id_pre+";");
                respuesta = new Respuesta[data.Tables[0].Rows.Count];
                if (data != null)
                {
                    for (int i = 0; i < respuesta.Length; i++)
                    {
                        respuesta[i] = new Respuesta();
                        respuesta[i].Id = Convert.ToString(data.Tables[0].Rows[i][0]);
                        respuesta[i].Concepto = Convert.ToString(data.Tables[0].Rows[i][1]);
                        respuesta[i].Ir = Convert.ToString(data.Tables[0].Rows[i][2]);
                    }
                    cone.desconectar();
                    return respuesta;
                }
            }
            cone.desconectar();
            return null;
        }
    }
}