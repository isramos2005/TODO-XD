using Dapper;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Novanet.DataAccess.Repository
{
    public class ServicioRepository
    {
        public IEnumerable<dynamic> PagosByCliente(int piIDCliente, int piIDSolicitud )
        {
            try
            {

                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@piIDCliente", piIDCliente, DbType.Int64, ParameterDirection.Input);
                parametros.Add("@piIDSolicitud", piIDSolicitud, DbType.Int64, ParameterDirection.Input);

                using var result = db.QueryMultiple(ScriptsDataBase.PagosByCliente, parametros, commandType: CommandType.StoredProcedure);

                var ReadResult = result.Read<dynamic>().ToList();

                return ReadResult;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }


        public IEnumerable<dynamic> Productos_ListaPorCliente(int piIDSolicitud)
        {
            try
            {

                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@piIDSolicitud", piIDSolicitud, DbType.Int64, ParameterDirection.Input);

                using var result = db.QueryMultiple(ScriptsDataBase.Productos_ListaPorCliente, parametros, commandType: CommandType.StoredProcedure);

                var ReadResult = result.Read<dynamic>().ToList();

                return ReadResult;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }


        public IEnumerable<dynamic> ProductosAsolicitud_ListaPorCliente(int piIDSolicitud)
        {
            try
            {

                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@piIDSolicitud", piIDSolicitud, DbType.Int64, ParameterDirection.Input);

                using var result = db.QueryMultiple(ScriptsDataBase.ProductosAsolicitud_ListaPorCliente, parametros, commandType: CommandType.StoredProcedure);

                var ReadResult = result.Read<dynamic>().ToList();

                return ReadResult;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }


        public IEnumerable<dynamic> Solicitudes_AdicionProducto_Listado(int piIDSolicitud)
        {
            try
            {

                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@piIDSolicitud", piIDSolicitud, DbType.Int64, ParameterDirection.Input);

                var result = db.Query(ScriptsDataBase.Solicitudes_AdicionProducto_Listado, parametros, commandType: CommandType.StoredProcedure);

                
                return result;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public IEnumerable<dynamic> Solicitudes_AdicionProducto_Detalles(int piIDAdicionProduto)
        {
            try
            {

                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@piIDAdicionProduto", piIDAdicionProduto, DbType.Int64, ParameterDirection.Input);

                var result = db.Query(ScriptsDataBase.Solicitudes_AdicionProducto_Detalles, parametros, commandType: CommandType.StoredProcedure);


                return result;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public RequestStatus SolicitudesAdicionProducto_Insertar(int fiIDSolicitud, string jsonDetalles)
        {
            try
            {
                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@fiIDSolicitud", fiIDSolicitud, DbType.Int32, ParameterDirection.Input);
                parametros.Add("@jsondetalles", jsonDetalles, DbType.String, ParameterDirection.Input);

                var result = db.QueryFirstOrDefault<RequestStatus>(ScriptsDataBase.SolicitudesAdicionProducto_Insertar, parametros, commandType: CommandType.StoredProcedure);

                return result;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

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
}
