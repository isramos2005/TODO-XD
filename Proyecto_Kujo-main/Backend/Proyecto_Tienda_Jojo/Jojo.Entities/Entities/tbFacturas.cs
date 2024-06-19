﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace Jojo.Entities.Entities
{
    public partial class tbFacturas
    {
        public tbFacturas()
        {
            tbFacturasDetalles = new HashSet<tbFacturasDetalles>();
        }


        [Display(Name = "Id")]
        public int fact_Id { get; set; }
        [Display(Name = "Cliente Id")]
        public int? clie_Id { get; set; }
        [Display(Name = "Empleado Id")]
        public int? empl_Id { get; set; }

        [Display(Name = "Fecha Compra")]
        public DateTime? fact_fechacompra { get; set; }


        public int IdNueva { get; set; }


        [Display(Name = "Nombre Empleado")]
        public string NombreEmpleado { get; set; }

        public string FacturasPorcentaje { get; set; }

        public string FacturasTotales { get; set; }

        public string Total_Dia { get; set; }
        public string IVA_Dia { get; set; }
        public string SubTotal_Dia { get; set; }
        public string Fecha { get; set; }



        [Display(Name = "Nombre Cliente")]
        public string NombreCliente { get; set; }

        [NotMapped]
        public string prod_Id { get; set; }

        [NotMapped]
        public string prod_Descripcion { get; set; }






        [NotMapped]
        public string SubTotal { get; set; }

        [NotMapped]
        public string IVA { get; set; }

        [NotMapped]
        public string Total { get; set; }


        public bool? fact_estadocompra { get; set; }
        public bool? fact_Estado { get; set; }
        public int fact_UserCrea { get; set; }
        public DateTime fact_FechaCreacion { get; set; }
        public int? fact_UserModifica { get; set; }
        public DateTime? fact_FechaModificacion { get; set; }


        public virtual tbClientes clie { get; set; }
        public virtual tbEmpleados empl { get; set; }
        public virtual tbUsuarios fact_UserCreaNavigation { get; set; }
        public virtual tbUsuarios fact_UserModificaNavigation { get; set; }
        public virtual ICollection<tbFacturasDetalles> tbFacturasDetalles { get; set; }
    }
}