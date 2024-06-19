using Jojo.WebUI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Jojo.WebUI.Controllers
{
    public class ReporteController : Controller
    {
        private static string _baseurl;

        public ReporteController()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _baseurl = builder.GetSection("ApiSettings:BaseUrl").Value;

        }


        [HttpGet("Reportes")]
        public async Task<IActionResult> Index()
        {
            List<FacturaViewModel> listado = new List<FacturaViewModel>();

            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Facturas/Reporte");
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    listado = JsonConvert.DeserializeObject<List<FacturaViewModel>>(jsonResponse);
                }

                return View(listado);
            }

        }
    }
}
