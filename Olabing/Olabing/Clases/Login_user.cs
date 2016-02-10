using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Olabing.Clases
{
    public class Login_user
    {
        private String nick,password,cod,tipo;

        public Login_user() { }

        public String Nick
        {
            get { return nick; }
            set { nick = value; }
        }

        public String Password
        {
            get { return password; }
            set { password = value; }
        }

        public String CodUsuario
        {
            get { return cod; }
            set { cod = value; }
        }

        public String TipoUsuario
        {
            get { return tipo; }
            set { tipo = value; }

        }

        public bool Verificar_login()
        {
            ConexionMySql cone = new ConexionMySql();
            if (cone.conexion(false, "cadconex"))
            {
                DataSet data = cone.consulta("select login.cod,fk_tipo_usu from login inner join usuario as usu on usu.cod=login.cod where nick='"+nick+"' and password='"+password+"';");
                if (data != null)
                {
                    if (data.Tables[0].Rows.Count > 0)
                    {
                        cod = Convert.ToString(data.Tables[0].Rows[0][0]);
                        tipo = Convert.ToString(data.Tables[0].Rows[0][1]);
                        cone.desconectar();
                        return true;
                    }
                }
            }
            cone.desconectar();
            return false;
        }
    }
}