using Dapper;
using Microsoft.Data.SqlClient;
using Novanet.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Novanet.DataAccess.Repository
{
    public class ClientesPrecalificadosRepository : IRepository<EquifaxCliente>
    {
        public RequestStatus Delete(EquifaxCliente item)
        {
            throw new NotImplementedException();
        }

        public EquifaxCliente Find(int? id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<EquifaxCliente> DNIPrecalificado(string dni)
        {
            try
            {
                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();
                parametros.Add("@piIDUsuario", 2, DbType.Int32, ParameterDirection.Input);

                var query = db.Query<EquifaxCliente>(ScriptsDataBase.Precalificado_DNI, parametros, commandType: CommandType.StoredProcedure);

                var result = query.Where(x => x.FcIdentidad == dni);


                return result;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return Enumerable.Empty<EquifaxCliente>();
            }
        }



        public RequestStatus Insert(EquifaxCliente item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<EquifaxCliente> List()
        {
            throw new NotImplementedException();
        }

        public RequestStatus Update(EquifaxCliente item)
        {
            throw new NotImplementedException();
        }
    }
}
