using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.API.Models
{
    public class ProductoViewModel
    {
        [Display(Name = "Id")]
        public int prod_Id { get; set; }
        [Display(Name = "Descripción del producto")]
        public string prod_Descripcion { get; set; }
        [Display(Name = "Categoría")]
        public string cate_Descripcion { get; set; }
        [Display(Name = "Categoría")]
        public int cate_Id { get; set; }
        [Display(Name = "Proveedor")]
        public string prov_Nombre { get; set; }
        [Display(Name = "Proveedor")]
        public int prov_Id { get; set; }
        [Display(Name = "Stock")]
        public int prod_Stock { get; set; }
        [Display(Name = "Precio Unitario")]
        public decimal prod_Precio { get; set; }
        [Display(Name = "Estado")]
        public bool? prod_Estado { get; set; }
        [Display(Name = "Usuario Creador")]
        public string empl_Crea { get; set; }
        [Display(Name = "Usuario Creador")]
        public int prod_UserCrea { get; set; }
        [Display(Name = "Fecha de creación")]
        public DateTime prod_FechaCreacion { get; set; }
        [Display(Name = "Último usuario modificador")]
        public string empl_Modifica { get; set; }
        [Display(Name = "Último usuario modificador")]
        public int? prod_UserModifica { get; set; }
        [Display(Name = "Última fecha de  modificación")]
        public DateTime? prod_FechaModificacion { get; set; }

    }
}
