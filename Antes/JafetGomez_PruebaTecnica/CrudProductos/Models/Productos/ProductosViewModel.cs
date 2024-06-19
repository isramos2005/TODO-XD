using System.ComponentModel.DataAnnotations;

namespace JafetGomez_PruebaTecnica.Models.Producto
{
    public class ProductosViewModel
    {
        public int prod_Id { get; set; }
        public string prod_Codigo { get; set; }
        public string prod_Nombre { get; set; }
        public int PdTi_Id { get; set; }
        public string TipoProducto { get; set; }
        public bool prod_Estado { get; set; }
    }
}
