using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.WebUI.Models
{
    public class PantallaPorRolViewModel
    {
        public int pantrol_Id { get; set; }
        public int? role_Id { get; set; }
        public int? pant_Id { get; set; }
        public bool? pantrol_Estado { get; set; }
        public int? pantrol_UserCrea { get; set; }
        public DateTime? pantrol_FechaCrea { get; set; }
        public int? pantrol_UserMofica { get; set; }
        public DateTime? pantrol_FechaModifica { get; set; }

        [Display(Name = "Pantalla Nombre")]

        public string pant_Nombre { get; set; }
        [Display(Name = "Identificador")]

        public string pant_Identificador { get; set; }
        [Display(Name = "Link")]

        public string pant_href { get; set; }


    }
}
