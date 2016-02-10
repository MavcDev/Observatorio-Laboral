using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Olabing.Clases
{
    public static class ListasDesple
    {

        public static DataSet getTipo_foro()
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select * from tipo_foro;");
                cone.desconectar();
                return data;
            }
            return null;
        }

        public static DataSet getTema()
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select * from tema;");
                cone.desconectar();
                return data;
            }
            return null;
        }

        public static DataSet getTipo_oferta()
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select * from tipo_oferta;");
                cone.desconectar();
                return data;
            }
            return null;
        }

        public static DataSet getNotificaciones(String cod_u)
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                String sql = "select v.*,u.cod,concat(u.nombre1,' ',u.apellido1) as nombre "+ 
                "from (select o.id_oferta,o.fecha,o.oficio,o.entidad,o.direccion,o.telcel1,o.correo1,tof.nombre,o.fk_usu2,'oferta' as tp "+
                "from oferta o "+
                "inner join tipo_oferta tof on o.fk_tipo_ofe=tof.id_tipo_ofe union all "+
                "select f.id_foro,f.fecha,f.pregunta,tf.nombre,t.nombre,null,null,null,f.fk_usu1,'foro' "+
                "from foro f "+
                "inner join tipo_foro tf on tf.id_tipo_foro=f.fk_tipo_foro "+
                "inner join tema t on t.id_tema=f.fk_tema) v "+
                "inner join usuario u on u.cod=v.fk_usu2 "+
                "where cod='" + cod_u + "' " +
                "order by v.fecha desc; ";
                DataSet data = cone.consulta(sql);
                cone.desconectar();
                return data;
            }
            return null;
        }
    }
}