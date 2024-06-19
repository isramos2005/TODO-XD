using Dapper;
using Jojo.Entities.Entities;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Jojo.DataAccess.Repository
{
    public class FacturaDetalleRepository : IRepository<tbFacturasDetalles>
    {
        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbFacturasDetalles> Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbFacturasDetalles item)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@fact_Id", item.fact_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@prod_Id", item.prod_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@facd_PrecioUnitario", item.facd_PrecioUnitario, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@facd_Cantidad", item.prod_Cantidad, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@facd_UserCrea", item.facd_UserCrea, DbType.Int32, ParameterDirection.Input);

            return (RequestStatus)db.QueryFirst(ScriptDatabase.UDP_tbFacturasDetalles_INSERT, parametros, commandType: System.Data.CommandType.StoredProcedure);

        }

        public IEnumerable<tbFacturasDetalles> List(int id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@fact_Id", id, DbType.Int32, ParameterDirection.Input);

            return db.Query<tbFacturasDetalles>(ScriptDatabase.UDP_tbFacturadetalles_Load, parametros, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbFacturasDetalles> Detalle(int id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@fact_Id", id, DbType.Int32, ParameterDirection.Input);

            return db.Query<tbFacturasDetalles>(ScriptDatabase.UDP_tbDetalles_INDEX, parametros, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbFacturasDetalles> List()
        {
            throw new NotImplementedException();
        }

        public RequestStatus Update(tbFacturasDetalles item)
        {
            throw new NotImplementedException();
        }
    }
}
