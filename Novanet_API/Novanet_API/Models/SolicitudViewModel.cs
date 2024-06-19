using System.Collections.Generic;

namespace Novanet.API.Models
{
    public class SolicitudViewModel
    {
        public int fiIDSolicitud { get; set; }
        public List<DetalleProducto> jsondetalles { get; set; }
    }


    public class DetalleProducto
    {
        public int fiIDAdicionProduto { get; set; }
        public int fiIDProducto { get; set; }
        public int fiCantidad { get; set; }
    }


}
