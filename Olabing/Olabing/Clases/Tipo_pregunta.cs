using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Olabing.Clases
{
    public class Tipo_pregunta
    {
        private String id, concepto;

        public Tipo_pregunta() { }

        public String Id
        {
            get { return id; }
            set { id = value; }
        }

        public String Concepto
        {
            get { return concepto; }
            set { concepto = value; }
        }
    }
}