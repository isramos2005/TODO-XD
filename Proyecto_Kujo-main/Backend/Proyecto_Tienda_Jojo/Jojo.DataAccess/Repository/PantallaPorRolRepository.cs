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
    public class PantallaPorRolRepository : IRepository<tbPantallasPorRol>
    {
        public RequestStatus Delete(tbPantallasPorRol item, int id)
        {
            throw new NotImplementedException();
        }

        public tbPantallasPorRol Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbPantallasPorRol item, int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbPantallasPorRol item)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@role_Id", item.role_Id, DbType.String, ParameterDirection.Input);
            parametros.Add("@pant_Id", item.pant_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@pantrol_UserCrea", item.pantrol_UserCrea, DbType.Int32, ParameterDirection.Input);


            return (RequestStatus)db.QueryFirst(ScriptDatabase.UDP_tbPantallasPorRol_PantallasAgg, parametros, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus DeleteP(int role_Id, int pant_Id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@role_Id", role_Id, DbType.String, ParameterDirection.Input);
            parametros.Add("@pant_Id", pant_Id, DbType.Int32, ParameterDirection.Input);


            return (RequestStatus)db.QueryFirst(ScriptDatabase.UDP_tbPantallasPorRol_PantallasElim, parametros, commandType: CommandType.StoredProcedure);
        }


        public RequestStatus Insert(tbRoles item)
        {

            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@role_Descripcion", item.role_Descripcion, DbType.String, ParameterDirection.Input);
            parametros.Add("@role_UserCrea", item.role_UserCrea, DbType.String, ParameterDirection.Input);


            return (RequestStatus)db.QueryFirst(ScriptDatabase.UDP_tbRoles_Insert, parametros, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbRoles item)
        {

            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@role_Id", item.role_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@role_Descripcion", item.role_Descripcion, DbType.String, ParameterDirection.Input);
            parametros.Add("@role_UserModifica", item.role_UserModifica, DbType.Int32, ParameterDirection.Input);

            return (RequestStatus)db.QueryFirst(ScriptDatabase.UDP_tbRoles_Update, parametros, commandType: CommandType.StoredProcedure);

        }

        public RequestStatus Delete(tbRoles item)
        {

            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@role_Id", item.role_Id, DbType.Int32, ParameterDirection.Input);

            return (RequestStatus)db.QueryFirst(ScriptDatabase.UDP_tbRoles_Delete, parametros, commandType: CommandType.StoredProcedure);

        }

        public IEnumerable<tbPantallasPorRol> List()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbPantallasPorRol> Menu(int id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@user_Id", id, DbType.Int32, ParameterDirection.Input);
            return db.Query<tbPantallasPorRol>(ScriptDatabase.UDP_Menu, parametros, commandType: CommandType.StoredProcedure);

        }

        public IEnumerable<tbRoles> Roles()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);

            return db.Query<tbRoles>(ScriptDatabase.UDP_tbRoles_INDEX, null, commandType: CommandType.StoredProcedure);

        }

        public IEnumerable<tbRoles> FindR(int? id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@role_Id", id, DbType.Int32, ParameterDirection.Input);
            yield return db.QueryFirstOrDefault<tbRoles>(ScriptDatabase.UDP_tbRoles_FIND, parametros, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbPantallas> Pantallas(string ident)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@Identificador", ident, DbType.String, ParameterDirection.Input);

            return db.Query<tbPantallas>(ScriptDatabase.UDP_tbPantallasPorRol_Check, parametros, commandType: CommandType.StoredProcedure);

        }

        public IEnumerable<tbPantallas> PantallasChecked(int role_Id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@role_Id", role_Id, DbType.Int32, ParameterDirection.Input);

            return db.Query<tbPantallas>(ScriptDatabase.UDP_tbPantallasPorRol_Checked, parametros, commandType: CommandType.StoredProcedure);

        }

        public RequestStatus Update(tbPantallasPorRol item, int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Update(tbPantallasPorRol item)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        IEnumerable<tbPantallasPorRol> IRepository<tbPantallasPorRol>.Find(int? id)
        {
            throw new NotImplementedException();
        }
    }
}
