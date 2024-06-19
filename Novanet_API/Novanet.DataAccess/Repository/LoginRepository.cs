using Dapper;
using Microsoft.Data.SqlClient;
using Novanet.Entities.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;


namespace Novanet.DataAccess.Repository
{
    public class LoginRepository
    {

        public static string url = "https://orion.novanetgroup.com/Account/LoginAPI";

        public async Task<string> LoginAsync(string Email, string Password)
        {
            try
            {

                var jsonResponse = "";

                using StringContent jsonContent = new(
                    JsonSerializer.Serialize(new
                    {
                        Email = Email,
                        Password = Password
                    }),
                    Encoding.UTF8,
                    "application/json");

                var httpClient = new HttpClient();

                

                using HttpResponseMessage response = await httpClient.PostAsync(
                    url,
                    jsonContent);


                jsonResponse = await response.Content.ReadAsStringAsync();

                return jsonResponse;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
        }


        public IEnumerable<dynamic> PrimerInicio(string pcUsuarioAcceso, string pcIdentidadCliente)
        {
            try
            {
                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@pcUsuarioAcceso", pcUsuarioAcceso, DbType.String, ParameterDirection.Input);
                parametros.Add("@pcIdentidadCliente", pcIdentidadCliente, DbType.String, ParameterDirection.Input);

                using var result = db.QueryMultiple(ScriptsDataBase.sp_ValidarPrimerInicio, parametros, commandType: CommandType.StoredProcedure);

                var firstResult = result.Read<dynamic>().ToList();
                return firstResult;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }


        public IEnumerable<dynamic> LoginApp(string fcUsuarioAcceso, string fcPassword)
        {
            try
            {

                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();



                parametros.Add("@fcUsuarioAcceso", fcUsuarioAcceso, DbType.String, ParameterDirection.Input);
                parametros.Add("@fcPassword", fcPassword, DbType.String, ParameterDirection.Input);

                using var result = db.QueryMultiple(ScriptsDataBase.sp_LoginAppMovil, parametros, commandType: CommandType.StoredProcedure);
                    
                var firstResult = result.Read<dynamic>().ToList();
                var secondResult = result.Read<dynamic>().ToList();
                var thirdResult = result.Read<dynamic>().ToList();
                var fourthResult = result.Read<dynamic>().ToList();
                var fifthResult = result.Read<dynamic>().ToList();


                var combinedResults = new List<IEnumerable<dynamic>> { firstResult, secondResult, thirdResult, fourthResult , fifthResult };
                return combinedResults;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        public IEnumerable<dynamic> IdentidadRegistro(string pcIdentidadCliente)
        {
            try
            {
                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@pcIdentidadCliente", pcIdentidadCliente, DbType.String, ParameterDirection.Input);

                using var result = db.QueryMultiple(ScriptsDataBase.sp_InformacionRegistrar, parametros, commandType: CommandType.StoredProcedure);

                var firstResult = result.Read<dynamic>().ToList();
                return firstResult;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        

        public class UsuariosViewModel
        {
            public string pcIdentidadCliente { get; set; }

            public string pcUsuarioAcceso { get; set; }

            public int fiAccesoAutorizado { get; set; }
            public int fiIDUsuario { get; set; }
            public string fcMensaje { get; set; }
            public string fcNombreCorto { get; set; }
            public int fiIDEquipo { get; set; }
            public int fiEsSupervisor { get; set; }
            public string fcLlaveURL { get; set; }
            public string fecha { get; set; }
        }
    }
}
