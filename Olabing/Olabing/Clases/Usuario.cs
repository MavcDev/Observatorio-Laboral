using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Olabing.Clases
{
    public class Usuario
    {
        private String cod, nombre1, nombre2, apellido1,
        apellido2, correo_base, correo_insti,rol,imagen,añogd;

        public Usuario() { }

        public String Codigo
        {
            get { return cod; }
            set { cod = value; }
        }

        public String Primer_nombre
        {
            get { return nombre1; }
            set { nombre1 = value; }
        }

        public String Segundo_nombre
        {
            get { return nombre2; }
            set { nombre2 = value; }
        }

        public String Primer_apellido
        {
            get { return apellido1; }
            set { apellido1 = value; }
        }

        public String Segundo_apellido
        {
            get { return apellido2; }
            set { apellido2 = value; }
        }

        public String Correo_personal
        {
            get { return correo_base; }
            set { correo_base = value; }
        }

        public String Correo_institucional
        {
            get { return correo_insti; }
            set { correo_insti = value; }
        }

        public String Rol
        {
            get { return rol; }
            set { rol = value; }
        }

        public String Foto
        {
            get { return imagen; }
            set { imagen = value; }
        }

        public String Año_grado
        {
            get{return añogd;}
            set { añogd = value; }
        }

        public void cargar(String codigo)
        {
            cod = codigo;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select nombre1,nombre2,apellido1,apellido2,correo_base,correo_insti,nombre,foto from usuario inner join tipo_usuario on id_tipo_usu=fk_tipo_usu where cod='" + cod + "';");
                if (data != null)
                {
                    nombre1 = Convert.ToString(data.Tables[0].Rows[0][0]); apellido1 = Convert.ToString(data.Tables[0].Rows[0][2]);
                    nombre2 = Convert.ToString(data.Tables[0].Rows[0][1]); apellido2 = Convert.ToString(data.Tables[0].Rows[0][3]);
                    correo_base = Convert.ToString(data.Tables[0].Rows[0][4]); correo_insti = Convert.ToString(data.Tables[0].Rows[0][5]);
                    rol = Convert.ToString(data.Tables[0].Rows[0][6]); imagen = Convert.ToString(data.Tables[0].Rows[0][7]);
                }
            }
            cone.desconectar();
        }

        public Usuario[] cargar_egresados()
        {
            Usuario[] egresados;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select nombre1,nombre2,apellido1,apellido2,correo_base,correo_insti,nombre,foto,año_grado,cod from usuario inner join tipo_usuario on id_tipo_usu=fk_tipo_usu where id_tipo_usu=2;");
                if (data != null)
                {
                    egresados = new Usuario[data.Tables[0].Rows.Count];
                    for (int i = 0; i < egresados.Length; i++)
                    {
                        egresados[i] = new Usuario();
                        egresados[i].Primer_nombre = Convert.ToString(data.Tables[0].Rows[i][0]); egresados[i].Primer_apellido = Convert.ToString(data.Tables[0].Rows[i][2]);
                        egresados[i].Segundo_nombre = Convert.ToString(data.Tables[0].Rows[i][1]); egresados[i].Segundo_apellido = Convert.ToString(data.Tables[0].Rows[i][3]);
                        egresados[i].Correo_personal = Convert.ToString(data.Tables[0].Rows[i][4]); egresados[i].Correo_institucional = Convert.ToString(data.Tables[0].Rows[i][5]);
                        egresados[i].Rol = Convert.ToString(data.Tables[0].Rows[0][6]); egresados[i].Foto= Convert.ToString(data.Tables[0].Rows[i][7]);
                        egresados[i].Año_grado = Convert.ToString(data.Tables[0].Rows[i][8]); egresados[i].Codigo = Convert.ToString(data.Tables[0].Rows[i][9]);
                    }
                    cone.desconectar();
                    return egresados;
                }
            }
            cone.desconectar();
            return null;
        }

        public Usuario[] contactos(String cod_u)
        {
            Usuario[] contactos;
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select cod,nombre1,apellido1,foto from usuario where cod <> '" + cod_u + "' order by apellido1 desc;");
                if (data != null)
                {
                    contactos = new Usuario[data.Tables[0].Rows.Count];
                    for (int i = 0; i < contactos.Length;i++ )
                    {
                        contactos[i] = new Usuario();
                        contactos[i].Codigo = Convert.ToString(data.Tables[0].Rows[i][0]);
                        contactos[i].Primer_nombre= Convert.ToString(data.Tables[0].Rows[i][1]);
                        contactos[i].Primer_apellido = Convert.ToString(data.Tables[0].Rows[i][2]);
                        contactos[i].Foto = Convert.ToString(data.Tables[0].Rows[i][3]);
                    }
                    cone.desconectar();
                    return contactos;
                }
            }
            cone.desconectar();
            return null;
        }

    }
}