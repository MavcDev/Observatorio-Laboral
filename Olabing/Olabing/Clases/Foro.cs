using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Olabing.Clases
{
    public class Foro
    {
        private String id, pregunta, fecha, cod, id_tipo, id_tema,nombre_usu;

        public Foro() { }

        public String Id
        {
            get { return id; }
            set { id = value; }
        }

        public String Pregunta
        {
            get { return pregunta; }
            set { pregunta = value; }
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

        public String Tipo_foro
        {
            get { return id_tipo; }
            set { id_tipo = value; }
        }

        public String Tema
        {
            get { return id_tema; }
            set { id_tema = value; }
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
                if (cone.ejecuta("insert into foro values(null,'" + pregunta + "',current_date(),'" + cod + "'," + id_tipo + "," + id_tema + ");"))
                {
                    cone.desconectar();
                    return true;
                }
            }
            return false;
        }

        public void cargar(String id_f)
        {
            id = id_f;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select foro.id_foro,foro.pregunta,foro.fecha, Concat(usu.nombre1,' ',usu.apellido1),tema.nombre,tipof.nombre,cod from foro  inner join  usuario as usu on usu.cod=fk_usu1 inner join tema on tema.id_tema=fk_tema inner join tipo_foro as tipof on tipof.id_tipo_foro=fk_tipo_foro where foro.id_foro="+id+";");
                if (data != null)
                {
                    id = Convert.ToString(data.Tables[0].Rows[0][0]); pregunta = Convert.ToString(data.Tables[0].Rows[0][1]);
                    fecha = Convert.ToString(data.Tables[0].Rows[0][2]);
                    nombre_usu = Convert.ToString(data.Tables[0].Rows[0][3]);
                    id_tipo = Convert.ToString(data.Tables[0].Rows[0][5]); 
                    id_tema = Convert.ToString(data.Tables[0].Rows[0][4]);
                    cod = Convert.ToString(data.Tables[0].Rows[0][6]);
                }
            }
            cone.desconectar();
        }

        public Foro[] cargar_por_tema_tipo(String id_te,String id_tipo)
        {
            Foro[] foros_tema;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select id_foro,pregunta from foro inner join tema on tema.id_tema=fk_tema where tema.id_tema="+id_te+" and  fk_tipo_foro="+id_tipo+";");
                if (data != null)
                {
                    foros_tema = new Foro[data.Tables[0].Rows.Count];
                    for (int i = 0; i < foros_tema.Length;i++ )
                    {
                        foros_tema[i] = new Foro();
                        foros_tema[i].Id = Convert.ToString(data.Tables[0].Rows[i][0]);
                        foros_tema[i].Pregunta = Convert.ToString(data.Tables[0].Rows[i][1]);
                    }
                    cone.desconectar();
                    return foros_tema;
                }
            }
            cone.desconectar();
            return null;
        }

        public Foro[] cargar_por_tipo(String id_tipo)
        {
            Foro[] foros;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select foro.id_foro,foro.pregunta,foro.fecha, Concat(usu.nombre1,' ',usu.apellido1),tema.nombre,cod from foro  inner join  usuario as usu on usu.cod=fk_usu1 inner join tema on tema.id_tema=fk_tema inner join tipo_foro as tipof on tipof.id_tipo_foro=fk_tipo_foro where fk_tipo_foro=" + id_tipo + " order by fecha desc;");
                if (data != null)
                {
                    foros = new Foro[data.Tables[0].Rows.Count];
                    for (int i = 0; i < foros.Length; i++)
                    {
                        foros[i] = new Foro();
                        foros[i].Id = Convert.ToString(data.Tables[0].Rows[i][0]);
                        foros[i].Pregunta = Convert.ToString(data.Tables[0].Rows[i][1]);
                        foros[i].Fecha = Convert.ToString(data.Tables[0].Rows[i][2]);
                        foros[i].Usuario = Convert.ToString(data.Tables[0].Rows[i][3]);
                        foros[i].Tema = Convert.ToString(data.Tables[0].Rows[i][4]);
                        foros[i].Cod_usuario = Convert.ToString(data.Tables[0].Rows[i][5]);
                    }
                    cone.desconectar();
                    return foros;
                }
            }
            cone.desconectar();
            return null;
        }

        public Foro[] cargar_noti_foro(String limite)
        {
            Foro[] foros;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select foro.id_foro,foro.pregunta,foro.fecha, Concat(usu.nombre1,' ',usu.apellido1),tema.nombre,tipof.nombre,cod from foro  inner join  usuario as usu on usu.cod=fk_usu1 inner join tema on tema.id_tema=fk_tema inner join tipo_foro as tipof on tipof.id_tipo_foro=fk_tipo_foro order by fecha desc limit " + limite + ";");
                if (data != null)
                {
                    foros = new Foro[data.Tables[0].Rows.Count];
                    for (int i = 0; i < foros.Length; i++)
                    {
                        foros[i] = new Foro();
                        foros[i].Id = Convert.ToString(data.Tables[0].Rows[i][0]); foros[i].Pregunta = Convert.ToString(data.Tables[0].Rows[i][1]);
                        foros[i].Fecha = Convert.ToString(data.Tables[0].Rows[i][2]);
                        foros[i].Usuario = Convert.ToString(data.Tables[0].Rows[i][3]);
                        foros[i].Tipo_foro = Convert.ToString(data.Tables[0].Rows[i][5]);
                        foros[i].Tema = Convert.ToString(data.Tables[0].Rows[i][4]);
                        foros[i].Cod_usuario = Convert.ToString(data.Tables[0].Rows[i][6]);
                    }
                    cone.desconectar();
                    return foros;
                }
            }
            cone.desconectar();
            return null;
        }

        public bool editar()
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                bool ret = cone.ejecuta("update foro set pregunta='"+pregunta+"', fk_tema="+id_tema+"  where id_foro="+id+"; ");
                cone.desconectar();
                return ret;
            }
            cone.desconectar();
            return false;
        }

        public bool eliminar(String id_foro)
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                bool ret1 = cone.ejecuta("delete from comentario_foro where fk_foro="+id_foro+";");
                bool ret = cone.ejecuta("delete from foro where id_foro="+id_foro+";");
                cone.desconectar();
                return ret;
            }
            cone.desconectar();
            return false;
        }

    }
}