using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;


namespace Novanet.BusinessLogic.Service
{
    public class OrionService
    {
        #region Correo

        public async Task<string> Orion_Correo(string[] emails)
        {
            try
            {

                string body = $@"
                <html>
                <head>
                    <link href=""https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"" rel=""stylesheet"" integrity=""sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"" crossorigin=""anonymous"">
                </head>
                <body style=""text-align: center; margin-bottom: 0px;"">
                    <div class=""container"" style=""background-color: #faa61a; padding: 20px; border-radius: 10px;"">
                        <p class=""text-white lead"" style=""color: white;font-size: 18px;"">Nota: Favor no responder este correo</p>
                        <p class=""text-white lead"" style=""color: white;font-size: 18px;""> Gracias.</p>
                        <div class=""container pb-5"" style=""margin-top: 0px; padding: 20px; background-color: #000000; border-radius: 10px;"">
                            <div class=""mx-auto mb-4"" style=""width: 100%; height: auto; overflow: hidden; background-color: #ffffff; margin: auto; border-radius: 10px;"">
                                <img src=""https://novanetgroup.com/wp/telnet/wp-content/img/logo_novanet.png"" class=""img-fluid"" alt=""Logo"" style=""width: 100%; height: auto;"">
                            </div>
                            <h1 class=""display-4 text-white"" style=""border-radius: 10px;color: white;"">Gráficas General de Ventas Novanet</h1>
                            <h3 class=""lead text-white"" style=""border-radius: 10px;color: white;"">Haga clic en el botón de abajo para acceder a Gráficas General Ventas Novanet.</h3>
                            <a href=""https://orion.novanetgroup.com/Reportes/ReportesClientesFinalesInstaladosGlobalPDFExportart?EnviarCorreo=0"" style=""background-color: #faa61a; color: white; padding: 15px 25px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; border-radius: 10px;"">Ver Reporte</a>
                        </div>
                    </div>
                </body>
                </html>";


                using SmtpClient smtpClient = new SmtpClient("mail.miprestadito.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new NetworkCredential("systembot@miprestadito.com", "iPwf@p3q");

                ServicePointManager.ServerCertificateValidationCallback =
                    delegate (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
                    { return true; };

                using MailMessage message = new MailMessage();
                message.From = new MailAddress("systembot@miprestadito.com");
                message.Subject = "Vista Previa Gráficas General Ventas Novanet";
                message.Body = body;
                message.IsBodyHtml = true;

                foreach (string email in emails)
                {
                    message.To.Add(email);
                }

                try
                {
                    await smtpClient.SendMailAsync(message);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al enviar correo: {ex.Message}");
                    throw new Exception("Error en el Envio:", ex);
                }

                return "Finalizado con Éxito";
            }
            catch (Exception ex)
            {
                throw new Exception("Error en el Envio:", ex);
            }
        }
        #endregion
    }
}
