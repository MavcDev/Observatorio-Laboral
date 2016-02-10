using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

namespace Olabing.Clases
{
    public class ConexionMySql
    {
        private MySqlConnection Conexion;
        public ConexionMySql() { }

        public MySqlConnection getConexion(){return Conexion;}

        public void desconectar() 
        {
            try
            {
                this.Conexion.Close();
            }catch(Exception){}
        }

        public  bool conexion(Boolean val, String cadcox)
        {//val false = cadena web config
         //val true = cadena parametro
            try
            {
                if (!val)
                {
                    Conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings[cadcox].ConnectionString);
                    Conexion.Open();
                }
                else
                {
                    Conexion = new MySqlConnection(cadcox);
                    Conexion.Open();
                }
                return true;
            }
            catch (Exception) {
  
            }
            return false;
        }

        public DataSet consulta(String sql)
        {
            MySqlCommand instruccion = new MySqlCommand(sql, this.Conexion);
            try{
                DataSet data = new DataSet();
                MySqlDataAdapter dataper = new MySqlDataAdapter(sql,this.Conexion);
                dataper.Fill(data);
                return data;
            }catch(Exception){ return null;}
        }

        public bool ejecuta(String sql)
        {
            MySqlCommand instruccion = new MySqlCommand(sql, this.Conexion);
            try
            {
                 return Convert.ToBoolean(instruccion.ExecuteNonQuery());
            }catch(Exception){}
            return false;
        }
    }
}