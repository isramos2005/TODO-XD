using JafetGomez_PruebaTecnica.Models.Producto_TiposViewModel;
using System.Data.SqlClient;
using System.Data;
using JafetGomez_PruebaTecnica.Models.Producto;
using JafetGomez_PruebaTecnica.Models;

namespace JafetGomez_PruebaTecnica.Datos
{
    public class ProductoDatos
    {
        public List<ProductosModel> Listar()
        {
            var Listado = new List<ProductosModel>();
            var conx = new Conexion();
            using (var conexion = new SqlConnection(conx.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_Productos_List", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        Listado.Add(new ProductosModel()
                        {
                            prod_Id = Convert.ToInt32(dr["prod_Id"]),
                            PdTi_Nombre = Convert.ToString(dr["PdTi_Nombre"]),
                            prod_Nombre = dr["prod_Nombre"].ToString(),
                            prod_Codigo = dr["prod_Codigo"].ToString(),
                            prod_Estado = Convert.ToBoolean(dr["prod_Estado"])
                        });
                    }
                }
            }
            return Listado;
        }


        public bool Guardar(ProductosViewModel oproducto)
        {
            bool rpta;

            try
            {
                var conx = new Conexion();
                using (var conexion = new SqlConnection(conx.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_Productos_Insert", conexion);
                    cmd.Parameters.AddWithValue("prod_Nombre", oproducto.prod_Nombre);
                    cmd.Parameters.AddWithValue("prod_Codigo", oproducto.prod_Codigo);
                    cmd.Parameters.AddWithValue("PdTi_Id", oproducto.PdTi_Id);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();

                }
                rpta = true;
            }
            catch (Exception e)
            {

                string error = e.Message;
                rpta = false;
            }

            return rpta;
        }

        public bool Editar(ProductosModel oproducto)
        {
            bool rpta;
            try
            {
                var conx = new Conexion();
                using (var conexion = new SqlConnection(conx.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_Productos_Update", conexion);
                    cmd.Parameters.AddWithValue("prod_Id", oproducto.prod_Id);
                    cmd.Parameters.AddWithValue("prod_Nombre", oproducto.prod_Nombre);
                    cmd.Parameters.AddWithValue("prod_Codigo", oproducto.prod_Codigo);
                    cmd.Parameters.AddWithValue("PdTi_Id", oproducto.PdTi_Id);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                rpta = true;
            }
            catch (Exception e)
            {
                string error = e.Message;
                rpta = false;
            }
            return rpta;
        }

        public bool Eliminar(int prod_Id)
        {
            bool rpta;

            try
            {
                var conx = new Conexion();
                using (var conexion = new SqlConnection(conx.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("dbo.sp_Productos_Delete", conexion);
                    cmd.Parameters.AddWithValue("prod_Id", prod_Id);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();

                }
                rpta = true;

            }
            catch (Exception e)
            {
                string error = e.Message;
                rpta = false;

            }

            return rpta;
        }


    }
}
