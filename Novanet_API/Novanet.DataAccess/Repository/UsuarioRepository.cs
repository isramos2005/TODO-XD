using Dapper;
using Microsoft.Data.SqlClient;
using Novanet.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats;
using SixLabors.ImageSharp.Processing;
using SixLabors.ImageSharp.Formats.Png;

namespace Novanet.DataAccess.Repository
{
    public class UsuarioRepository : IRepository<ClientesMovilLogin>
    {
        public RequestStatus Delete(ClientesMovilLogin item)
        {
            throw new NotImplementedException();
        }

        public ClientesMovilLogin Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus FindEmail(string email)
        {

            using var db = new SqlConnection(Novanet_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@pcCorreo", email, DbType.String, ParameterDirection.Input);
            var result = db.QueryFirst<RequestStatus>(ScriptsDataBase.BuscarCorreoAppMovil, parametros, commandType: CommandType.StoredProcedure);

            return result;

        }


        public RequestStatus CambioContrasenia(ClientesMovilLogin item)
        {

            using var db = new SqlConnection(Novanet_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@piIDUnico", item.FiIdunico, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@pcPassword", item.FcPassword, DbType.String, ParameterDirection.Input);

            var result = db.QueryFirst<RequestStatus>(ScriptsDataBase.CambiodeContraAppMovil, parametros, commandType: CommandType.StoredProcedure);

            return result;

        }

        public RequestStatus ReferirCliente(ClientesReferidosCredito item)
        {

            using var db = new SqlConnection(Novanet_Context.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@pcNombreReferido", item.FcNombreReferido, DbType.String, ParameterDirection.Input);
            parametros.Add("@pcNumeroTelefono", item.FcNumeroTelefono, DbType.String, ParameterDirection.Input);
            parametros.Add("@fiIDEquifaxClienteReferente", item.FiIdequifaxClienteReferente, DbType.Int32, ParameterDirection.Input);

            var result = db.QueryFirst<RequestStatus>(ScriptsDataBase.ClientesReferidos_Insertar, parametros, commandType: CommandType.StoredProcedure);

            return result;
        }

        public RequestStatus Insert(ClientesMovilLogin item)
        {
            try
            {
                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@pcUsuarioAcceso", item.FcUsuarioAcceso, DbType.String, ParameterDirection.Input);
                parametros.Add("@pcPassword", item.FcPassword, DbType.String, ParameterDirection.Input);
                parametros.Add("@piIDCliente", item.FiIdcliente, DbType.Int32, ParameterDirection.Input);

                var result = db.QueryFirst<RequestStatus>(ScriptsDataBase.RegistroUsuarioPrincipal, parametros, commandType: CommandType.StoredProcedure);

                return result;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);

                var result = new RequestStatus();
                result.CodeStatus = 500;
                result.MessageStatus = "Ha ocurrido un error inesperado";
                return result;
            }
        }

        public RequestStatus InsertUsuarioFamiliar(ClientesMovilLogin item)
        {
            try
            {
                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();

                parametros.Add("@pcNombreUsuario", item.FcNombreUsuario, DbType.String, ParameterDirection.Input);
                parametros.Add("@pcUsuarioAcceso", item.FcUsuarioAcceso, DbType.String, ParameterDirection.Input);
                parametros.Add("@pcPassword", item.FcPassword, DbType.String, ParameterDirection.Input);
                parametros.Add("@piIDCliente", item.FiIdcliente, DbType.Int32, ParameterDirection.Input);

                var result = db.QueryFirst<RequestStatus>(ScriptsDataBase.RegistroUsuarioFamiliar, parametros, commandType: CommandType.StoredProcedure);

                return result;

            }
            catch (Exception e)
            {
                Console.WriteLine(e);

                var result = new RequestStatus();
                result.CodeStatus = 500;
                result.MessageStatus = "Ha ocurrido un error inesperado";
                return result;
            }
        }

        public IEnumerable<ClientesMovilLogin> List()
        {
            throw new NotImplementedException();
        }

        public RequestStatus Update(ClientesMovilLogin item)
        {
            throw new NotImplementedException();
        }


        public RequestStatus CambioImagen(string base64, string nombreArchivo, int piIDUnico)
        {
            try
            {
                byte[] bytes = Convert.FromBase64String(base64);

                using MemoryStream stream = new MemoryStream(bytes);
                using Image image = Image.Load(stream);

                int newWidth = 900;
                int newHeight = 1500;
                image.Mutate(x => x.Resize(newWidth, newHeight));

                string nombreImagen = $"{nombreArchivo}.png";

                string carpetaImagenes = @"C:\inetpub\novanetgroup.com_Orion\Documento\imgAppNovanet";

                Directory.CreateDirectory(carpetaImagenes);

                string rutaImagen = Path.Combine(carpetaImagenes, nombreImagen);

                image.Save(rutaImagen, new PngEncoder());

                byte[] resizedBytes = File.ReadAllBytes(rutaImagen);

                using var db = new SqlConnection(Novanet_Context.ConnectionString);
                var parametros = new DynamicParameters();
                parametros.Add("@piIDUnico", piIDUnico, DbType.Int32, ParameterDirection.Input);
                parametros.Add("@pcURLFotoPersonalizda", nombreImagen, DbType.String, ParameterDirection.Input);
                
                var result = db.QueryFirst<RequestStatus>(ScriptsDataBase.ActualizarImagenPerfilAppMovil, parametros, commandType: CommandType.StoredProcedure);



                return result;
            }
            catch (Exception ex)
            {
                // Manejo de errores
                return new RequestStatus
                {
                    CodeStatus = 500,
                    MessageStatus = ex.Message
                };
            }
        }



    }
}
