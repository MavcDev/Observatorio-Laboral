using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Olabing.Clases;
using System.Data;

namespace Olabing.Clases
{
    
    public class Chat
    {
        private String id_chat, texto, fecha, hora, cod_emi, cod_rec,usuario_emi,usuario_rece;

        public Chat() { }

        public  String Id{
            get { return id_chat; }
            set { id_chat = value; }
        }

        public String Texto
        {
            get { return texto; }
            set { texto = value; }
        }

        public String Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }

        public String Hora
        {
            get { return hora; }
            set { hora = value; }
        }

        public String Emisor
        {
            get { return cod_emi; }
            set { cod_emi = value; }
        }

        public String Receptor
        {
            get { return cod_rec; }
            set { cod_rec = value; }
        }

        public String Usuario_emisor
        {
            get { return usuario_emi; }
            set { usuario_emi = value; }
        }

        public String Usuario_receptor
        {
            get { return usuario_rece; }
            set { usuario_rece = value; }
        }

        public Chat[] cargar_chat(String emi,String rece,String limite)
        {
            Chat[] mensajes;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                String sql = "select chate.cod_emi,chate.texto,chate.fecha,chate.hora,concat(usu1.nombre1,' ',usu1.apellido1) from chat as chate inner join usuario as usu1 on usu1.cod=chate.cod_emi where cod_emi='"+emi+"' and cod_rece='"+rece+"' "+
                             "union all select chatr.cod_emi,chatr.texto,chatr.fecha,chatr.hora,concat(usu2.nombre1,' ',usu2.apellido1) from chat as chatr  inner join usuario as usu2 on usu2.cod=chatr.cod_emi where cod_emi='" + rece + "' and cod_rece='" + emi + "' order by fecha,hora desc limit " + limite + ";";

                DataSet data = cone.consulta(sql);
                if (data != null)
                {
                    mensajes = new Chat[data.Tables[0].Rows.Count];
                    for (int i = 0; i < mensajes.Length; i++)
                    {
                        mensajes[i] = new Chat();
                        mensajes[i].Emisor= Convert.ToString(data.Tables[0].Rows[i][0]);
                        mensajes[i].Texto = Convert.ToString(data.Tables[0].Rows[i][1]);
                        mensajes[i].Fecha = Convert.ToString(data.Tables[0].Rows[i][2]);
                        mensajes[i].Hora = Convert.ToString(data.Tables[0].Rows[i][3]);
                        mensajes[i].Usuario_emisor = Convert.ToString(data.Tables[0].Rows[i][4]);
                    }
                    cone.desconectar();
                    return mensajes;
                }
            }
            cone.desconectar();
            return null;
        }

        public bool crear()
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                if (cone.ejecuta("insert into chat values(null,'"+texto+"',CURRENT_DATE(),CURRENT_TIME(),'"+cod_emi+"','"+cod_rec+"');"))
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