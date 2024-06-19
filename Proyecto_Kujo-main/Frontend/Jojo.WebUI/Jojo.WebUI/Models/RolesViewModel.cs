using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.WebUI.Models
{
    public class RolesViewModel
    {
        [Display(Name = "Id")]
        public int role_Id { get; set; }
        [Display(Name = "Descripcion")]

        public string role_Descripcion { get; set; }
        [Display(Name = "Estado")]

        public bool? role_Estado { get; set; }
        [Display(Name = "Usuario Creador")]

        public int? role_UserCrea { get; set; }
        [Display(Name = "Fecha Creación")]

        public DateTime? role_FechaCrea { get; set; }
        [Display(Name = "Ultimo Usuario Modificador")]

        public int? role_UserModifica { get; set; }
        [Display(Name = "Ultima Fecha Modificación")]
        public DateTime? role_FechaModifica { get; set; }
        [Display(Name = "Usuario Creador")]
        public string empl_Crea { get; set; }
        [Display(Name = "Ultimo Usuario Modificador")]
        public string empl_Modifica { get; set; }
    }
}
