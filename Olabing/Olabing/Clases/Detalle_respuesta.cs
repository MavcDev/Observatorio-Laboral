using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Olabing.Clases
{
    public class Detalle_respuesta
    {
        private String usuario, respuesta, justificacion;

        public Detalle_respuesta() { }

        public String Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        public String Respuesta
        {
            get { return respuesta; }
            set { respuesta = value; }
        }

        public String Justificacion
        {
            get { return justificacion; }
            set { justificacion = value; }
        }

        public bool crear()
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                if (cone.ejecuta("insert into detalle_respuesta  values('"+usuario+"',"+respuesta+",'"+justificacion+" ');"))
                {
                    cone.desconectar();
                    return true;
                }
            }
            cone.desconectar();
            return false;
        }
    }
}