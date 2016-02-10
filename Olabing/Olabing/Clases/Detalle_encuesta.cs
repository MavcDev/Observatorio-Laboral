using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Olabing.Clases;

namespace Olabing.Clases
{
    public class Detalle_encuesta
    {
        private String usuario, encuesta, fecha;

        public Detalle_encuesta() { }

        public String Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        public String Encuesta
        {
            get { return encuesta; }
            set { encuesta = value; }
        }

        public String Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }

        public bool encuesta_0(String cod)
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select cod from detalle_encuesta inner join usuario as usu on usu.cod=fk_usu5 where fk_usu5='"+cod+"' and fk_tipo_usu=2 and fk_encuesta=1;");
                cone.desconectar();
                if (data != null)
                {
                    if (data.Tables[0].Rows.Count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            cone.desconectar();
            return false;
        }

        public bool crear()
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                if (cone.ejecuta("insert into detalle_encuesta values('"+usuario+"',"+encuesta+",CURRENT_DATE);"))
                {
                    cone.desconectar();
                    return true;
                }
            }
            return false;
        }
    }
}