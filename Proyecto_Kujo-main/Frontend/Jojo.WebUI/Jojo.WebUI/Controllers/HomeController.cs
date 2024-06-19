using Jojo.WebUI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Jojo.WebUI.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private static string _baseurl;


        public HomeController(ILogger<HomeController> logger)
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _baseurl = builder.GetSection("ApiSettings:BaseUrl").Value;
            _logger = logger;
        }

        public IActionResult Index()
        {
            string usua_ID = HttpContext.Session.GetString("UsuarioId");
            HttpContext.Session.GetString("Nombre");
            HttpContext.Session.GetString("Admin");
            HttpContext.Session.GetString("Rol");

            if (usua_ID == "" || usua_ID == null)
            {
                HttpContext.Session.SetInt32("UsuarioId", 0);
            }


            return View();
        }


        public async Task<IActionResult> Grafica()
        {

            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Facturas/Grafica");

                if (response.IsSuccessStatusCode)
                {
                    var content = await response.Content.ReadAsStringAsync();
                    var Grafica = JsonConvert.DeserializeObject<List<FacturaViewModel>>(content);

                    return Json(Grafica);
                }
                else
                {
                    return RedirectToAction("Index");

                }
            }

        }


        [HttpPost]
        public async Task<IActionResult> Pantallas(int id)
        {
            PantallaViewModel logger = new PantallaViewModel();


            using (var httpClient = new HttpClient())
            {

                var response = await httpClient.GetAsync(_baseurl + $"Pantallas?id=" + id);
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();

                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                    List<object> ddlItems = new List<object>();
                    foreach (JObject jsonObject in jsonArray)
                    {
                        string pant_Nombre = (string)jsonObject["pant_Nombre"];
                        string pant_Identificador = (string)jsonObject["pant_Identificador"];
                        string pant_href = (string)jsonObject["pant_href"];
                        ddlItems.Add(new { pant_Nombre = pant_Nombre, pant_Identificador = pant_Identificador, pant_href = pant_href });
                    }

                    return Json(ddlItems);
                }
                else
                {
                    return View();
                }
            }
        }

        public IActionResult cls_ss()
        {

            HttpContext.Session.SetInt32("UsuarioId", 0);
            HttpContext.Session.SetString("Nombre", "");
            HttpContext.Session.SetString("Admin", "");
            HttpContext.Session.SetString("Rol", "");

            return RedirectToAction("Index", "Login");
        }


        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
