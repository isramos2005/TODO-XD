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
    public class ProductoRepository : IRepository<tbProductos>
    {

        public RequestStatus Delete(int id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@prod_Id", id, DbType.Int32, ParameterDirection.Input);
            return db.QueryFirst<RequestStatus>(ScriptDatabase.UDP_tbProducto_DELETE, parametros, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbProductos> Find(int? id)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@prod_Id", id, DbType.Int32, ParameterDirection.Input);
            yield return db.QueryFirstOrDefault<tbProductos>(ScriptDatabase.UDP_tbProducto_FIND, parametros, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Insert(tbProductos item)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@prod_Descripcion", item.prod_Descripcion, DbType.String, ParameterDirection.Input);
            parametros.Add("@cate_Id", item.cate_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@prov_Id", item.prov_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@prod_Stock", item.prod_Stock, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@prod_Precio", item.prod_Precio, DbType.Decimal, ParameterDirection.Input);
            parametros.Add("@prod_UserCrea", item.prod_UserCrea, DbType.Int32, ParameterDirection.Input);

            return db.QueryFirst<RequestStatus>(ScriptDatabase.UDP_tbProducto_INSERT, parametros, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbProductos> List()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            return db.Query<tbProductos>(ScriptDatabase.UDP_tbProducto_INDEX, null, commandType: System.Data.CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbProductos item)
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@prod_Id", item.prod_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@prod_Descripcion", item.prod_Descripcion, DbType.String, ParameterDirection.Input);
            parametros.Add("@cate_Id", item.cate_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@prov_Id", item.prov_Id, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@prod_Stock", item.prod_Stock, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@prod_Precio", item.prod_Precio, DbType.Decimal, ParameterDirection.Input);
            parametros.Add("@prod_UserModifica", item.prod_UserModifica, DbType.Int32, ParameterDirection.Input);

            return db.QueryFirst<RequestStatus>(ScriptDatabase.UDP_tbProducto_UPDATE, parametros, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbProductos> DDLProveedores()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            return db.Query<tbProductos>(ScriptDatabase.DDL_Proveedores, null, commandType: System.Data.CommandType.StoredProcedure);
        }

        public IEnumerable<tbProductos> DDlCategorias()
        {
            using var db = new SqlConnection(JojoTienda_Context.ConnectionString);
            return db.Query<tbProductos>(ScriptDatabase.DDL_Categorias, null, commandType: System.Data.CommandType.StoredProcedure);
        }

    }
}
