using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.WebUI.Models
{
    public class FacturaViewModel
    {

        [Display(Name = "Id")]
        public int fact_Id { get; set; }
        [Display(Name = "Cliente")]
        public int? clie_Id { get; set; }
        [Display(Name = "Empleado")]
        public int? empl_Id { get; set; }

        [Display(Name = "Fecha Compra")]
        public DateTime? fact_fechacompra { get; set; }

        [NotMapped]
        [Display(Name = "Nombre Empleado")]
        public string NombreEmpleado { get; set; }

        [NotMapped]
        [Display(Name = "Nombre Cliente")]
        public string NombreCliente { get; set; }

        [NotMapped]
        public string prod_Id { get; set; }

        [NotMapped]
        [Display(Name = "Producto")]
        public string prod_Descripcion { get; set; }

        [NotMapped]
        public string SubTotal { get; set; }

        [NotMapped]
        public string IVA { get; set; }

        [NotMapped]
        public string Total { get; set; }

        public bool? fact_estadocompra { get; set; }
        [Display(Name = "Estado")]
        public bool? fact_Estado { get; set; }
        [Display(Name = "Fecha de creación")]
        public int fact_UserCrea { get; set; }
        [Display(Name = "Usuario creador")]
        public string empl_Crea { get; set; }
        [Display(Name = "Fecha de creación")]
        public DateTime fact_FechaCreacion { get; set; }
        [Display(Name = "Último usuario modificador")]
        public int? fact_UserModifica { get; set; }
        [Display(Name = "Último usuario modificador")]
        public string empl_Modifica { get; set; }
        [Display(Name = "Última fecha de modificación")]
        public DateTime? fact_FechaModificacion { get; set; }

        public int IdNueva { get; set; }

        public string FacturasPorcentaje { get; set; }

        public string FacturasTotales { get; set; }

        [Display(Name = "Total por día")]
        public string Total_Dia { get; set; }
        [Display(Name = "IVA por día")]
        public string IVA_Dia { get; set; }
        [Display(Name = "SubTotal por día")]
        public string SubTotal_Dia { get; set; }
        [Display(Name = "Fecha")]
        public string Fecha { get; set; }

    }
}

