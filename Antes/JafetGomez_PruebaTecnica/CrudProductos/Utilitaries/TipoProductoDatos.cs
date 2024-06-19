using System.Data.SqlClient;
using System.Data;
using JafetGomez_PruebaTecnica.Models.Producto_TiposViewModel;

namespace JafetGomez_PruebaTecnica.Datos
{
    public class TipoProductoDatos
    {
        public List<Producto_TiposViewModel> Listar()
        {
            var Listado = new List<Producto_TiposViewModel>();
            var cn = new Conexion();
            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("dbo.sp_TipoProductoSelect", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        Listado.Add(new Producto_TiposViewModel()
                        {
                            PdTi_Id = Convert.ToInt32(dr["PdTi_Id"]),
                            PdTi_Nombre = Convert.ToString(dr["PdTi_Nombre"]),
                            PdTi_Codigo = dr["PdTi_Codigo"].ToString()
                        });
                    }
                }
                conexion.Close();
            }
            return Listado;
        }
    }
}
