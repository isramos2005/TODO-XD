using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.WebUI.Models
{
    public class PantallaViewModel
    {
        public int pant_Id { get; set; }
        public string pant_Nombre { get; set; }
        public string pant_Identificador { get; set; }
        public string pant_href { get; set; }
        public bool? pant_Estado { get; set; }
        public int? pant_UserCrea { get; set; }
        public DateTime? pant_FechaCrea { get; set; }
        public int? pant_UserMofica { get; set; }
        public DateTime? pant_FechaModifica { get; set; }
    }
}
