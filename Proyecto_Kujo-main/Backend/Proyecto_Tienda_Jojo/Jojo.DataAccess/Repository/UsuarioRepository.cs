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
    public class UsuarioRepository : IRepository<tbUsuarios>
    {



        public RequestStatus Insert(tbUsuarios item)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();


            parametros.Add("@user_NombreUsuario", item.user_NombreUsuario, DbType.String, ParameterDirection.Input);
            parametros.Add("@user_Contraseña", item.user_Contraseña, DbType.String, ParameterDirection.Input);
            parametros.Add("@user_Admin", item.user_Admin, DbType.Boolean, ParameterDirection.Input);
            parametros.Add("@empl_Id", item.empl_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@role_Id", item.role_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@user_UserCrea", item.user_UserCrea, DbType.Int32, ParameterDirection.Input);

            return (RequestStatus)db.QueryFirst(ScriptDatabase.UDP_tbUsuarios_Insert, parametros, commandType: System.Data.CommandType.StoredProcedure);
        }

        public IEnumerable<tbEmpleados> Empleados()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);

            return db.Query<tbEmpleados>(ScriptDatabase.DDL_Empleados, null, commandType: CommandType.StoredProcedure);

        }

        public IEnumerable<tbUsuarios> List()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            return db.Query<tbUsuarios>(ScriptDatabase.UDP_tbUsuarios_INDEX, null, commandType: System.Data.CommandType.StoredProcedure);
        }


        public RequestStatus Update(tbUsuarios item)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@user_Id", item.user_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@user_Admin", item.user_Admin, DbType.Boolean, ParameterDirection.Input);
            parametros.Add("@role_Id", item.role_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@empl_Id", item.empl_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@user_UserModifica", item.user_UserModifica, DbType.Int32, ParameterDirection.Input);


            return db.QueryFirst<RequestStatus>(ScriptDatabase.UDP_tbUsuarios_Update, parametros, commandType: CommandType.StoredProcedure);

        }

        public RequestStatus Delete(int id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@user_Id", id, DbType.Int32, ParameterDirection.Input);

            return db.QueryFirst<RequestStatus>(ScriptDatabase.UDP_tbUsuarios_Delete, parametros, commandType: CommandType.StoredProcedure);
        }



        public IEnumerable<tbUsuarios> Login(string user, string pass)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@user_NombreUsuario", user, DbType.String, ParameterDirection.Input);
            parametros.Add("@user_Contraseña", pass, DbType.String, ParameterDirection.Input);

            var usuario = db.QueryFirstOrDefault<tbUsuarios>(ScriptDatabase.UDP_Login, parametros, commandType: CommandType.StoredProcedure);

            if (usuario != null)
            {
                yield return usuario;
            }
            else
            {
                yield break;
            }
        }

        public IEnumerable<tbUsuarios> Find(int? id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@user_Id", id, DbType.Int32, ParameterDirection.Input);
            yield return db.QueryFirstOrDefault<tbUsuarios>(ScriptDatabase.UDP_tbUsuarios_FIND, parametros, commandType: CommandType.StoredProcedure);
        }
    }
}
