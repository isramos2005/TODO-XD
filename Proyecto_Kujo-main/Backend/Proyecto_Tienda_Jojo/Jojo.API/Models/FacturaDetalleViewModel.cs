﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.API.Models
{
    public class FacturaDetalleViewModel
    {
        public int facd_Id { get; set; }
        public int fact_Id { get; set; }
        public int prod_Id { get; set; }
        public decimal facd_PrecioUnitario { get; set; }
        public int prod_Cantidad { get; set; }
        public int facd_UserCrea { get; set; }
        public DateTime facd_FechaCreacion { get; set; }
        public int? facd_UserModifica { get; set; }
        public DateTime? facd_FechaModificacion { get; set; }
        public bool? facd_Estado { get; set; }

        [NotMapped]
        public string SubTotal { get; set; }

        [NotMapped]
        public string IVA { get; set; }

        [NotMapped]
        public string Total { get; set; }

        public string prod_Descripcion { get; set; }

    }
}