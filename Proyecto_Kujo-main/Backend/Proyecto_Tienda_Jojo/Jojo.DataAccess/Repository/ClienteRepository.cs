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
    public class ClienteRepository : IRepository<tbClientes>
    {
        public RequestStatus Delete(int id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);

            var parametros = new DynamicParameters();

            parametros.Add("@clie_Id", id, DbType.Int64, ParameterDirection.Input);

            return db.QueryFirst<RequestStatus>(ScriptDatabase.UDP_tbClientes_DELETE, parametros, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbClientes> Find(int? id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@clie_Id", id, DbType.Int32, ParameterDirection.Input);
            yield return db.QueryFirstOrDefault<tbClientes>(ScriptDatabase.UDP_tbClientes_FIND, parametros, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Insert(tbClientes item)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@clie_Nombres", item.clie_Nombres, DbType.String, ParameterDirection.Input);
            parametros.Add("@clie_Apellidos", item.clie_ApellIdos, DbType.String, ParameterDirection.Input);
            parametros.Add("@clie_FechaNacimiento", item.clie_FechaNacimiento, DbType.Date, ParameterDirection.Input);
            parametros.Add("@clie_Sexo", item.clie_Sexo, DbType.String, ParameterDirection.Input);
            parametros.Add("@estc_Id", item.estc_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@clie_Telefeno", item.clie_Telefeno, DbType.String, ParameterDirection.Input);
            parametros.Add("@muni_Id", item.muni_Id, DbType.String, ParameterDirection.Input);
            parametros.Add("@clie_Direccion", item.clie_Direccion, DbType.String, ParameterDirection.Input);
            parametros.Add("@clie_UserCrea", item.clie_UserCrea, DbType.Int32, ParameterDirection.Input);

            return db.QueryFirst<RequestStatus>(ScriptDatabase.UDP_tbClientes_INSERT, parametros, commandType: System.Data.CommandType.StoredProcedure);
        }

        public IEnumerable<tbClientes> List()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            return db.Query<tbClientes>(ScriptDatabase.UDP_tbClientes_INDEX, null, commandType: System.Data.CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbClientes item)
        {

            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@clie_Id", item.clie_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@clie_Nombres", item.clie_Nombres, DbType.String, ParameterDirection.Input);
            parametros.Add("@clie_Apellidos", item.clie_ApellIdos, DbType.String, ParameterDirection.Input);
            parametros.Add("@clie_FechaNacimiento", item.clie_FechaNacimiento, DbType.Date, ParameterDirection.Input);
            parametros.Add("@clie_Sexo", item.clie_Sexo, DbType.String, ParameterDirection.Input);
            parametros.Add("@estc_Id", item.estc_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@clie_Telefeno", item.clie_Telefeno, DbType.String, ParameterDirection.Input);
            parametros.Add("@muni_Id", item.muni_Id, DbType.String, ParameterDirection.Input);
            parametros.Add("@clie_Direccion", item.clie_Direccion, DbType.String, ParameterDirection.Input);
            parametros.Add("@clie_UserModifica", item.clie_UserModifica, DbType.Int32, ParameterDirection.Input);

            return db.QueryFirst<RequestStatus>(ScriptDatabase.UDP_tbClientes_UPDATE, parametros, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbEstadosCiviles> DDLEstadosCiviles()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            return db.Query<tbEstadosCiviles>(ScriptDatabase.DDL_EstadosCiviles, null, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbDepartamentos> DDLDepartamentos()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            return db.Query<tbDepartamentos>(ScriptDatabase.DDL_Departamentos, null, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbMunicipios> DDLMunicipios(string depto)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@dept_Id", depto, DbType.String, ParameterDirection.Input);
            return db.Query<tbMunicipios>(ScriptDatabase.DDL_Municipios, parametros, commandType: CommandType.StoredProcedure);
        }
    }
}
