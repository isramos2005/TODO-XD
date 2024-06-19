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
    public class PruebaRepository
    {
            public IEnumerable<dynamic> List(int pilDUsuario, int pilDSolicitud)
            {
                try
                {

                    using var db = new SqlConnection(Novanet_Context.ConnectionString);
                    var parametros = new DynamicParameters();

                    parametros.Add("@piIDUsuario", pilDUsuario, DbType.Int32, ParameterDirection.Input);
                    parametros.Add("@piIDSolicitud", pilDSolicitud, DbType.Int32, ParameterDirection.Input);

                    using var result = db.QueryMultiple(ScriptsDataBase.sp_ClienteListar, parametros, commandType: CommandType.StoredProcedure);

                    var firstResult = result.Read<dynamic>().ToList();
                    var secondResult = result.Read<dynamic>().ToList();
                    var thirdResult = result.Read<dynamic>().ToList();
                    var fourthResult = result.Read<dynamic>().ToList();


                    var combinedResults = new List<IEnumerable<dynamic>> { firstResult, secondResult, thirdResult, fourthResult };
                    return combinedResults;
                }
                catch (Exception e)
                {
                    Console.Write(e);
                    return Enumerable.Empty<dynamic>();
                }
          
            }
    }
}
