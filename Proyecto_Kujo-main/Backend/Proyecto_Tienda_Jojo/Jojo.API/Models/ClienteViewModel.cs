using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.API.Models
{
    public class ClienteViewModel
    {
        [Display(Name = "Id")]
        public int clie_Id { get; set; }
        [Display(Name = "Nombres")]
        public string clie_Nombres { get; set; }
        [Display(Name = "Apellidos")]
        public string clie_ApellIdos { get; set; }
        [Display(Name = "Fecha de Nacimiento")]
        public DateTime clie_FechaNacimiento { get; set; }
        [Display(Name = "Sexo")]
        public string clie_Sexo { get; set; }
        [Display(Name = "Sexo")]
        public string clieSexo { get; set; }
        [Display(Name = "Estado Civil")]
        public int estc_Id { get; set; }
        [Display(Name = "Estado Civil")]
        public string estc_Descripcion { get; set; }
        [Display(Name = "Teléfono")]
        public string clie_Telefeno { get; set; }
        [Display(Name = "Departamento")]
        public string dept_Id { get; set; }
        [Display(Name = "Departamento")]
        public string dept_Descripcion { get; set; }
        [Display(Name = "Municipio")]
        public string muni_Id { get; set; }
        [Display(Name = "Municipio")]
        public string muni_Descripcion { get; set; }
        [Display(Name = "Dirección")]
        public string clie_Direccion { get; set; }
        [Display(Name = "Estado")]
        public bool? clie_Estado { get; set; }
        [Display(Name = "Usuario Creador")]
        public int clie_UserCrea { get; set; }
        [Display(Name = "Usuario creador")]
        public string empl_Crea { get; set; }
        [Display(Name = "Fecha de creación")]
        public DateTime clie_FechaCreacion { get; set; }
        [Display(Name = "Último usuario modificador")]
        public int? clie_UserModifica { get; set; }
        [Display(Name = "Último usuario modificador")]
        public string empl_Modifica { get; set; }
        [Display(Name = "Última fecha de modificación")]
        public DateTime? clie_FechaModificacion { get; set; }

        [Display(Name = "Nombre Cliente")]
        public string NombreCliente { get; set; }
    }
}
