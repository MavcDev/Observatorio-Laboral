using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Olabing.Clases
{
    public class Comentariof
    {

        private String id, texto, fecha,hora,cod,id_foro,nombre_usu;
        public Comentariof() { }

        public String Id
        {
            get { return id; }
            set { id = value; }
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

        public String Cod_usuario
        {
            get { return cod; }
            set { cod = value; }
        }

        public String Hora
        {
            get { return hora; }
            set { hora = value; }
        }

        public String Id_foro
        {
            get { return id_foro; }
            set { id_foro = value; }
        }

        public String Usuario
        {
            get { return nombre_usu; }
            set { nombre_usu = value; }
        }

        public bool crear()
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                if (cone.ejecuta("insert into comentario_foro values(null,'" + texto + "', current_date(),current_time(),'" + cod + "'," + id_foro + ");"))
                {
                    cone.desconectar();
                    return true;
                }
            }
            return false;
        }

        public Comentariof[] cargar_todos(String id_f,String limite)
        {
            Comentariof[] comentarios;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select id_comenta_f,texto,fecha,Concat(nombre1,' ',apellido1),cod,hora from comentario_foro inner join usuario on fk_usu3=cod where fk_foro=" + id_f + " order by  fecha,hora desc limit " + limite + ";");
                if (data != null)
                {
                    comentarios = new Comentariof[data.Tables[0].Rows.Count];
                    for (int i = 0; i < comentarios.Length; i++)
                    {
                        comentarios[i] = new Comentariof();
                        comentarios[i].Id = Convert.ToString(data.Tables[0].Rows[i][0]);
                        comentarios[i].Texto = Convert.ToString(data.Tables[0].Rows[i][1]);
                        comentarios[i].Fecha = Convert.ToString(data.Tables[0].Rows[i][2]);
                        comentarios[i].Usuario = Convert.ToString(data.Tables[0].Rows[i][3]);
                        comentarios[i].Cod_usuario = Convert.ToString(data.Tables[0].Rows[i][4]);
                        comentarios[i].Hora = Convert.ToString(data.Tables[0].Rows[i][5]);
                    }
                    cone.desconectar();
                    return comentarios;
                }
            }
            cone.desconectar();
            return null;
        }
    }
}