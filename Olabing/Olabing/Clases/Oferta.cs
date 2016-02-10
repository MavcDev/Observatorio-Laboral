using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Olabing.Clases
{
    public class Oferta
    {
        private String id,pre_requisito,
            oficio, entidad, direccion, telcel1, telcel2,
            telfijo, correo1, correo2, mas_info, fecha,fecha_limite, tipo,
            cod,nombre_usu;

        public Oferta() { }

        public String Id
        {
            get { return id; }
            set { id = value; }
        }

        public String Pre_requisito
        {
            get { return pre_requisito; }
            set { pre_requisito = value; }
        }

        public String Oficio
        {
            get { return oficio; }
            set { oficio = value; }
        }

        public String Entidad
        {
            get { return entidad; }
            set { entidad = value; }
        }

        public String Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        public String Telefono_cel
        {
            get { return telcel1; }
            set { telcel1 = value; }
        }

        public String Telefono_cel_opcional 
        {
            get { return telcel2; }
            set { telcel2 = value; }
        }

        public String Telefono_fijo
        {
            get { return telfijo; }
            set { telfijo = value; }
        }

        public String Correo
        {
            get { return correo1; }
            set { correo1 = value; }
        }

        public String Correo_opcional
        {
            get { return correo2; }
            set { correo2 = value; }
        }

        public String Informacion_adicional
        {
            get { return mas_info; }
            set { mas_info = value; }
        }

        public String Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }

        public String Fecha_limite
        {
            get { return fecha_limite; }
            set { fecha_limite = value; }
        }

        public String Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public String Cod_usuario
        {
            get { return cod; }
            set { cod = value; }
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
                if (cone.ejecuta("insert into oferta values(null,'" + pre_requisito + "','" + entidad + "','" + oficio + "','" + direccion + "','" + telcel1 + "','" + telcel2 + "','" + telfijo + "','" + correo1 + "','" + correo2 + "','" + mas_info + "',current_date(),'"+fecha_limite+"','"+cod+"','"+tipo+"');"))
                {
                    cone.desconectar();
                    return true;
                }
            }
            cone.desconectar();
            return false;
        }

        public void cargar(String id_ofe)
        {
            id = id_ofe;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select id_oferta,oficio,entidad,direccion,telcel1,telcel2,telfijo,correo1,correo2,mas_info,fk_tipo_ofe,cod,nombre,fecha,fecha_limite,pre_requisito from oferta inner join tipo_oferta as tpo on tpo.id_tipo_ofe=fk_tipo_ofe inner join usuario on cod= fk_usu2 where id_oferta=" + id_ofe + ";");
                if (data != null)
                {
                    id = Convert.ToString(data.Tables[0].Rows[0][0]); oficio =  Convert.ToString(data.Tables[0].Rows[0][1]);
                    entidad = Convert.ToString(data.Tables[0].Rows[0][2]); direccion = Convert.ToString(data.Tables[0].Rows[0][3]);
                    telcel1 = Convert.ToString(data.Tables[0].Rows[0][4]); telcel2 = Convert.ToString(data.Tables[0].Rows[0][5]);
                    telfijo = Convert.ToString(data.Tables[0].Rows[0][6]); correo1 = Convert.ToString(data.Tables[0].Rows[0][7]);
                    correo2 = Convert.ToString(data.Tables[0].Rows[0][8]); mas_info = Convert.ToString(data.Tables[0].Rows[0][9]);
                    tipo = Convert.ToString(data.Tables[0].Rows[0][10]); cod = Convert.ToString(data.Tables[0].Rows[0][11]);
                    nombre_usu = Convert.ToString(data.Tables[0].Rows[0][12]); fecha = Convert.ToString(data.Tables[0].Rows[0][13]);
                    fecha_limite = Convert.ToString(data.Tables[0].Rows[0][14]);
                    pre_requisito = Convert.ToString(data.Tables[0].Rows[0][15]);
                }
            }
            cone.desconectar();
        }

        public Oferta[] cargar_todos()
        {
            Oferta[] ofertas;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select id_oferta,oficio,entidad,direccion,telcel1,telcel2,telfijo,correo1,correo2,mas_info,nombre,fecha,fecha_limite from oferta inner join tipo_oferta as tpo on tpo.id_tipo_ofe=fk_tipo_ofe;");
                if (data != null)
                {
                    ofertas = new Oferta[data.Tables[0].Rows.Count];
                    for (int i = 0; i < ofertas.Length; i++)
                    {
                        ofertas[i] = new Oferta();
                        ofertas[i].Id = Convert.ToString(data.Tables[0].Rows[0][0]); ofertas[i].Oficio = Convert.ToString(data.Tables[0].Rows[0][1]);
                        ofertas[i].Entidad = Convert.ToString(data.Tables[0].Rows[0][2]); ofertas[i].Direccion = Convert.ToString(data.Tables[0].Rows[0][3]);
                        ofertas[i].Telefono_cel = Convert.ToString(data.Tables[0].Rows[0][4]); ofertas[i].Telefono_cel_opcional = Convert.ToString(data.Tables[0].Rows[0][5]);
                        ofertas[i].Telefono_fijo = Convert.ToString(data.Tables[0].Rows[0][6]); ofertas[i].Correo = Convert.ToString(data.Tables[0].Rows[0][7]);
                        ofertas[i].Correo_opcional = Convert.ToString(data.Tables[0].Rows[0][8]); ofertas[i].Informacion_adicional = Convert.ToString(data.Tables[0].Rows[0][9]);
                        ofertas[i].Tipo = Convert.ToString(data.Tables[0].Rows[0][10]); ofertas[i].Cod_usuario = Convert.ToString(data.Tables[0].Rows[0][11]);
                        ofertas[i].Usuario = Convert.ToString(data.Tables[0].Rows[0][12]); ofertas[i].Fecha = Convert.ToString(data.Tables[0].Rows[0][13]);
                        ofertas[i].Fecha_limite = Convert.ToString(data.Tables[0].Rows[0][14]);
                    }
                    cone.desconectar();
                    return ofertas;
                }
            }
            cone.desconectar();
            return null;
        }

        public Oferta[] cargar_por_tipo(String id_tipo)
        {
            Oferta[] ofertas;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select id_oferta,oficio,entidad,direccion,telcel1,correo1,nombre,fecha,fecha_limite,cod,concat(nombre1,' ',apellido1) from oferta inner join usuario as usu on usu.cod=fk_usu2 inner join tipo_oferta as tpo on tpo.id_tipo_ofe=fk_tipo_ofe where fk_tipo_ofe="+id_tipo+"  order by fecha desc;");
                if (data != null)
                {
                    ofertas = new Oferta[data.Tables[0].Rows.Count];
                    for (int i = 0; i < ofertas.Length; i++)
                    {
                        ofertas[i] = new Oferta();
                        ofertas[i].Id = Convert.ToString(data.Tables[0].Rows[i][0]);
                        ofertas[i].Oficio = Convert.ToString(data.Tables[0].Rows[i][1]);
                        ofertas[i].Entidad = Convert.ToString(data.Tables[0].Rows[i][2]);
                        ofertas[i].Direccion = Convert.ToString(data.Tables[0].Rows[i][3]);
                        ofertas[i].Telefono_cel = Convert.ToString(data.Tables[0].Rows[i][4]);
                        ofertas[i].Correo = Convert.ToString(data.Tables[0].Rows[i][5]);
                        ofertas[i].Tipo = Convert.ToString(data.Tables[0].Rows[i][6]);
                        ofertas[i].Fecha = Convert.ToString(data.Tables[0].Rows[i][7]);
                        ofertas[i].Fecha_limite = Convert.ToString(data.Tables[0].Rows[i][8]);
                        ofertas[i].Cod_usuario = Convert.ToString(data.Tables[0].Rows[i][9]);
                        ofertas[i].Usuario = Convert.ToString(data.Tables[0].Rows[i][10]);
                    }
                    cone.desconectar();
                    return ofertas;
                }
            }
            cone.desconectar();
            return null;
        }

        public Oferta[] cargar_notificacion(String limite)
        {
                        Oferta[] ofertas;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select id_oferta,oficio,entidad,direccion,telcel1,correo1,cod,concat(nombre1,' ',apellido1),fecha,fecha_limite,nombre from oferta as ofe inner join tipo_oferta as tpo on tpo.id_tipo_ofe=fk_tipo_ofe inner join usuario on cod= fk_usu2 where CURRENT_DATE < ofe.fecha_limite  order by fecha desc limit " + limite + ";");
                if (data != null)
                {
                    ofertas = new Oferta[data.Tables[0].Rows.Count];
                    for (int i = 0; i < ofertas.Length; i++)
                    {
                        ofertas[i] = new Oferta();
                        ofertas[i].Id = Convert.ToString(data.Tables[0].Rows[i][0]); ofertas[i].Oficio = Convert.ToString(data.Tables[0].Rows[i][1]);
                        ofertas[i].Entidad = Convert.ToString(data.Tables[0].Rows[i][2]); ofertas[i].Direccion = Convert.ToString(data.Tables[0].Rows[i][3]);
                        ofertas[i].Telefono_cel = Convert.ToString(data.Tables[0].Rows[i][4]); ofertas[i].Correo = Convert.ToString(data.Tables[0].Rows[i][5]);
                        ofertas[i].Cod_usuario = Convert.ToString(data.Tables[0].Rows[i][6]); ofertas[i].Usuario = Convert.ToString(data.Tables[0].Rows[i][7]);
                        ofertas[i].Fecha = Convert.ToString(data.Tables[0].Rows[i][8]); ofertas[i].Fecha_limite = Convert.ToString(data.Tables[0].Rows[i][9]);
                        ofertas[i].Tipo=Convert.ToString(data.Tables[0].Rows[i][10]);
                    }
                    cone.desconectar();
                    return ofertas;
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
                bool ret = cone.ejecuta("update oferta set oficio='" + oficio + "',pre_requisito='" + pre_requisito + "', entidad='" + entidad + "',direccion='" + direccion + "',telcel1='" + telcel1 + "',telcel2='" + telcel2 + "',telfijo='" + telfijo + "',correo1='" + correo1 + "',correo2='" + correo2 + "', mas_info='" + mas_info + "',fecha_limite='" + fecha_limite + "' where id_oferta=" + id + ";");
                cone.desconectar();
                return ret;
            }
            cone.desconectar();
            return false;
        }

        public bool eliminar(String id_oferta)
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                bool ret = cone.ejecuta("delete from oferta where id_oferta="+id_oferta+";");
                cone.desconectar();
                return ret;
            }
            cone.desconectar();
            return false;
        }

    }
}