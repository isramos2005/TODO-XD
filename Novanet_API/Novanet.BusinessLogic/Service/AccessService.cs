using Novanet.DataAccess.Repository;
using Novanet.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using static Novanet.DataAccess.Repository.LoginRepository;

namespace Novanet.BusinessLogic.Service
{


    public class AccessService
    {
        private readonly LoginRepository _loginRepository;

        private readonly UsuarioRepository _usuarioRepository;

        public AccessService(LoginRepository loginRepository, UsuarioRepository usuarioRepository)
        {
            _loginRepository = loginRepository;
            _usuarioRepository = usuarioRepository;
            ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;

        }

        #region LOGIN
        public async Task<string> Login(string Email, string Password)
        {
            try
            {
            var usuario = "";
            var result = new ServiceResult();

            usuario = await _loginRepository.LoginAsync(Email, Password);

            return usuario;

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public IEnumerable<dynamic> PrimerInicio(string pcUsuarioAcceso, string pcIdentidadCliente)
        {
            try
            {
                var list = _loginRepository.PrimerInicio(pcUsuarioAcceso, pcIdentidadCliente);
                return list;
               
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        public IEnumerable<dynamic> LoginApp(string fcUsuarioAcceso, string fcPassword)
        {
            try
            {
                var list = _loginRepository.LoginApp( fcUsuarioAcceso,  fcPassword);
                return list;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return Enumerable.Empty<dynamic>();
            }
        }

        public IEnumerable<dynamic> IdentidadRegistro(string pcIdentidadCliente)
        {
            try
            {
                var list = _loginRepository.IdentidadRegistro(pcIdentidadCliente);
                return list;

            }
            catch (Exception ex)
            {
                throw;
            }
        }



        #endregion


        #region Usuario

        
        public ServiceResult CambioImagen(string base64, string nombreArchivo, int piIDUnico)
        {
            var result = new ServiceResult();

            try
            {
                var map = _usuarioRepository.CambioImagen(base64, nombreArchivo, piIDUnico);

                if (map.CodeStatus == 200)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Success);

                }
                else if (map.CodeStatus == 409)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Conflict);
                }
                else
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Error);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult Insert(ClientesMovilLogin item)
        {
            var result = new ServiceResult();

            try
            {
                var map = _usuarioRepository.Insert(item);

                if (map.CodeStatus == 200)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Success);

                }
                else if (map.CodeStatus == 409)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Conflict);
                }
                else
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Error);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }


        public ServiceResult InsertUsuarioFamiliar(ClientesMovilLogin item)
        {
            var result = new ServiceResult();

            try
            {
                var map = _usuarioRepository.InsertUsuarioFamiliar(item);

                if (map.CodeStatus == 200)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Success);

                }
                else if (map.CodeStatus == 409)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Conflict);
                }
                else
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Error);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }

        public ServiceResult CambioContrasenia(ClientesMovilLogin item)
        {
            var result = new ServiceResult();

            try
            {
                var map = _usuarioRepository.CambioContrasenia(item);

                if (map.CodeStatus == 200)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Success);

                }
                else if (map.CodeStatus == 409)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Conflict);
                }
                else
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Error);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }


        public ServiceResult ReferirCliente(ClientesReferidosCredito item)
        {
            var result = new ServiceResult();

            try
            {
                var map = _usuarioRepository.ReferirCliente(item);

                if (map.CodeStatus == 200)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Success);

                }
                else if (map.CodeStatus == 409)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Conflict);
                }
                else
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Error);
                }

            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }
        }
        #endregion

        #region Correo
        public async Task<string> GenerateAndSendAuthToken(string email)
        {
            try
            {
                string authToken = GenerateAuthToken();

                string body = $@"
                           <html>
                            <head>
                                <link href=""https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"" rel=""stylesheet"" integrity=""sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"" crossorigin=""anonymous"">
                            </head>
                            <body style=""text-align: center; margin-bottom: 0px;"">
                                <div class=""container"" style=""background-color: #ffa41c; padding: 20px; border-radius: 10px;"">
                                   <p class=""text-white lead"" style=""color: white;font-size: 18px;"">Nota: Favor no responder este correo, cualquier consulta al respecto comunicarse con Nosotros via WhatsApp al</p>
                                   <p class=""text-white lead"" style=""color: white;font-size: 18px;"">+504 8908-1273</p>
                                   <p class=""text-white lead"" style=""color: white;font-size: 18px;""> Gracias.</p>
                                <div class=""container pb-5"" style=""margin-top: 0px; padding: 20px; background-color: #000000; border-radius: 10px;"">
                                        <div class=""rounded-circle mx-auto mb-4"" style=""width: 100px; height: 100px; overflow: hidden; background-color: #ffffff; border-radius: 50%; margin: auto"">
                                            <img src=""https://i.ibb.co/1Krw4zT/logo.jpg"" class=""img-fluid"" alt=""Logo"" style=""width: 100%; height: auto;"">
                                        </div>
                                        <h1 class=""display-4 text-white"" style=""border-radius: 10px;color: white;"">Token de Autenticación</h1>
                                        <h3 class=""lead text-white"" style=""border-radius: 10px;color: white;"">Tu token de autenticación es:</h3>
                                        <h2 class=""display-1 font-weight-bold text-white"" style=""border-radius: 10px;color: white;"">{authToken}</h2>
                                    </div>
                                </div>
                            </body>
                            </html>

                            ";

                MailMessage message = new MailMessage("systembot@miprestadito.com", email, "Token de autenticación", body);
                message.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("mail.miprestadito.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new NetworkCredential("systembot@miprestadito.com", "iPwf@p3q");

                await smtpClient.SendMailAsync(message);

                return authToken;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al generar y enviar el token de autenticación.", ex);
            }
        }

        private string GenerateAuthToken()
        {
            Random random = new Random();
            StringBuilder authTokenBuilder = new StringBuilder();

            for (int i = 0; i < 4; i++)
            {
                authTokenBuilder.Append(random.Next(0, 10));
            }

            return authTokenBuilder.ToString();
        }

        public async Task<string> EmailTokenPassword(string email)
        {
            var result = new ServiceResult();

            string authToken = "";
            var correo = _usuarioRepository.FindEmail(email);

                if (correo.CodeStatus > 0)
                {
                authToken = GenerateAuthToken();

                string body = $@"
                           <html>
                            <head>
                                <link href=""https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"" rel=""stylesheet"" integrity=""sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"" crossorigin=""anonymous"">
                            </head>
                            <body style=""text-align: center; margin-bottom: 0px;"">
                                <div class=""container"" style=""background-color: #ffa41c; padding: 20px; border-radius: 10px;"">
                                   <p class=""text-white lead"" style=""color: white;font-size: 18px;"">Nota: Favor no responder este correo, cualquier consulta al respecto comunicarse con Nosotros via WhatsApp al</p>
                                   <p class=""text-white lead"" style=""color: white;font-size: 18px;"">+504 8908-1273</p>
                                   <p class=""text-white lead"" style=""color: white;font-size: 18px;""> Gracias.</p>
                                <div class=""container pb-5"" style=""margin-top: 0px; padding: 20px; background-color: #000000; border-radius: 10px;"">
                                        <div class=""rounded-circle mx-auto mb-4"" style=""width: 100px; height: 100px; overflow: hidden; background-color: #ffffff; border-radius: 50%; margin: auto"">
                                            <img src=""https://i.ibb.co/1Krw4zT/logo.jpg"" class=""img-fluid"" alt=""Logo"" style=""width: 100%; height: auto;"">
                                        </div>
                                        <h1 class=""display-4 text-white"" style=""border-radius: 10px;color: white;"">Token de Cambio de Contraseña</h1>
                                        <h3 class=""lead text-white"" style=""border-radius: 10px;color: white;"">Tu token de cambio de Contraseña es:</h3>
                                        <h2 class=""display-1 font-weight-bold text-white"" style=""border-radius: 10px;color: white;"">{authToken}</h2>
                                    </div>
                                </div>
                            </body>
                            </html>

                            ";

                MailMessage message = new MailMessage("systembot@miprestadito.com", email, "Token de Cambio de Contraseña", body);
                message.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("mail.miprestadito.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new NetworkCredential("systembot@miprestadito.com", "iPwf@p3q");

                await smtpClient.SendMailAsync(message);

                return authToken+" "+correo.CodeStatus.ToString();

                }
                else
                {
                return "No encontrado";

                }
        }
        #endregion
    }
}
