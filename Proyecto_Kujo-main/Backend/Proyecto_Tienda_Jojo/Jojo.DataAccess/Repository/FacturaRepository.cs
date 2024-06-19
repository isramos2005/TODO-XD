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
    public class FacturaRepository : IRepository<tbFacturas>
    {
        public RequestStatus Delete(int id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@@facd_Id", id, DbType.Int32, ParameterDirection.Input);

            return db.QueryFirst<RequestStatus>(ScriptDatabase.UDP_tbFacturasDetalles_DELETE, parametros, commandType: System.Data.CommandType.StoredProcedure);

        }

        public IEnumerable<tbFacturas> Find(int? id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@fact_Id", id, DbType.Int32, ParameterDirection.Input);

            yield return db.QueryFirstOrDefault<tbFacturas>(ScriptDatabase.UDP_tbFactura_FIND, parametros, commandType: System.Data.CommandType.StoredProcedure);
        }

        public IEnumerable<tbFacturas> Insert(tbFacturas item)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@clie_Id", item.clie_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@empl_Id", item.empl_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@fact_UserCrea", item.fact_UserCrea, DbType.Int32, ParameterDirection.Input);

            yield return db.QueryFirstOrDefault<tbFacturas>(ScriptDatabase.UDP_tbFacturas_INSERT, parametros, commandType: System.Data.CommandType.StoredProcedure);


        }

        public IEnumerable<tbFacturas> Grafica()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
              return db.Query<tbFacturas>(ScriptDatabase.UPD_tbFacturas_FacturasPorEmpleado,null, commandType: System.Data.CommandType.StoredProcedure);

        }

        public IEnumerable<tbFacturas> Reporte()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            return db.Query<tbFacturas>(ScriptDatabase.UPD_tbFacturas_Reporte, null, commandType: System.Data.CommandType.StoredProcedure);

        }

        public IEnumerable<tbFacturas> List()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            return db.Query<tbFacturas>(ScriptDatabase.UDP_tbFactura_INDEX, null, commandType: System.Data.CommandType.StoredProcedure);

        }

        public RequestStatus Update(tbFacturas item)
        {
            throw new NotImplementedException();
        }

        RequestStatus IRepository<tbFacturas>.Insert(tbFacturas item)
        {
            throw new NotImplementedException();
        }
    }
}
