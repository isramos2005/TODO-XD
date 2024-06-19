using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.API.Models
{
    public class UsuarioViewModel
    {
        [Display(Name = "Id")]
        public int user_Id { get; set; }
        [Display(Name = "Nombre de Usuario")]
        public string user_NombreUsuario { get; set; }
        [Display(Name = "Empleado")]
        public string NombreEmpleado { get; set; }
        [Display(Name = "Contraseña")]
        public string user_Contraseña { get; set; }
        [Display(Name = "Admin")]
        public bool? user_Admin { get; set; }
        [Display(Name = "Admin")]
        public string EsAdmin { get; set; }
        [Display(Name = "Rol")]
        public int? role_Id { get; set; }
        [Display(Name = "Estado")]
        public bool? user_Estado { get; set; }
        [Display(Name = "Usuario Creador")]
        public int? user_UserCrea { get; set; }
        [Display(Name = "Fecha Creación")]
        public DateTime? user_FechaCrea { get; set; }
        [Display(Name = "Ultimo Usuario Modificador")]
        public int? user_UserModifica { get; set; }
        [Display(Name = "Ultima Fecha Modificacion")]
        public DateTime? user_FechaModifica { get; set; }

        public int empl_Id { get; set; }


        public string empl_Nombres { get; set; }
        public string empl_Apellidos { get; set; }
        [Display(Name = "Usuario Creador")]
        public string empl_Crea { get; set; }
        [Display(Name = "Ultimo Usuario Modificador")]
        public string empl_Modifica { get; set; }

        [Display(Name = "Admin")]
        public string Es_Admin { get; set; }
        [Display(Name = "Rol")]
        public string role_Descripcion { get; set; }

    }
}
