using Jojo.API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Jojo.WebUI.Controllers
{
    public class LoginController : Controller
    {
        private static string _baseurl;

        public LoginController()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _baseurl = builder.GetSection("ApiSettings:BaseUrl").Value;

        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Index(string txtuser, string txtpass)
        {
            UsuarioViewModel logger = new UsuarioViewModel();

            using (var httpClient = new HttpClient())
            {
                try
                {
                    var response = await httpClient.GetAsync(_baseurl + $"Login?user={txtuser}&pass={txtpass}");
                    if (response.IsSuccessStatusCode)
                    {
                        var jsonResponse = await response.Content.ReadAsStringAsync();

                        JObject jsonObjGet = JObject.Parse(jsonResponse);
                        JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                        UsuarioViewModel user = JsonConvert.DeserializeObject<UsuarioViewModel>(jsonArray[0].ToString());
                        logger.user_Id = user.user_Id;
                        logger.user_Admin = user.user_Admin;
                        logger.empl_Nombres = user.empl_Nombres;
                        logger.empl_Apellidos = user.empl_Apellidos;
                        logger.role_Id = user.role_Id;
                        logger.empl_Id = user.empl_Id;
                    }
                    if (logger.user_Id.ToString() == "null" || logger.user_Id.ToString() == ""||logger.user_Id == 0 )
                    {
                        TempData["MensajeToast"] = "Usuario o Contraseña incorrecta/Usuario no valido";

                        return View("Index");
                    }
                    else
                    {

                        HttpContext.Session.SetInt32("UsuarioId", logger.user_Id);
                        HttpContext.Session.SetString("Nombre", logger.empl_Nombres + " " + logger.empl_Apellidos);
                        HttpContext.Session.SetString("Admin", logger.user_Admin.ToString());
                        HttpContext.Session.SetString("Rol", logger.role_Id.ToString());
                        HttpContext.Session.SetInt32("empl_Id", logger.empl_Id);

                        return RedirectToAction("Index", "Home");
                    }
                }
                catch (Exception ex)
                {
                    _ = ex.Message;
                    TempData["MensajeToast"] = "Usuario o Contraseña incorrecta/Usuario no valido";

                    return View("Index");
                }

            }
        }

    }
}
