using Jojo.WebUI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Jojo.WebUI.Controllers
{
    public class ClientesController : Controller
    {
        private static string _baseurl;

        public ClientesController()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _baseurl = builder.GetSection("ApiSettings:BaseUrl").Value;

        }


        [HttpGet("Clientes/Listado")]
        public async Task<IActionResult> Index()
        {
            List<ClienteViewModel> listado = new List<ClienteViewModel>();
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Clientes/Listado");
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    listado = JsonConvert.DeserializeObject<List<ClienteViewModel>>(jsonResponse);
                }

                return View(listado);
            }

        }

        [HttpGet("Clientes/Detalles")]
        public async Task<IActionResult> Details(int id)
        {
            ClienteViewModel clie = new ClienteViewModel();
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Clientes/Find?id=" + id);
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                    ClienteViewModel cliente = JsonConvert.DeserializeObject<ClienteViewModel>(jsonArray[0].ToString());

                    clie.clie_Id = cliente.clie_Id;
                    clie.clie_Nombres = cliente.clie_Nombres;
                    clie.clie_ApellIdos = cliente.clie_ApellIdos;
                    clie.clie_FechaNacimiento = cliente.clie_FechaNacimiento;
                    clie.clieSexo = cliente.clieSexo;
                    clie.estc_Descripcion = cliente.estc_Descripcion;
                    clie.clie_Telefeno = cliente.clie_Telefeno;
                    clie.dept_Descripcion = cliente.dept_Descripcion;
                    clie.muni_Descripcion = cliente.muni_Descripcion;
                    clie.clie_Direccion = cliente.clie_Direccion;


                    clie.empl_Crea = cliente.empl_Crea;
                    clie.clie_FechaCreacion = cliente.clie_FechaCreacion;
                    clie.empl_Modifica = cliente.empl_Modifica;
                    clie.clie_FechaModificacion = cliente.clie_FechaModificacion;


                }

                return View(clie);
            }

        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {

            using (var httpClient = new HttpClient())
            {

                var responseEsta = await httpClient.GetAsync(_baseurl + "api/DDL/EstadosCiviles");
                var responsedept = await httpClient.GetAsync(_baseurl + "api/DDL/Departamentos");

                if (responseEsta.IsSuccessStatusCode)
                {
                    var jsonResponseE = await responseEsta.Content.ReadAsStringAsync();
                    JObject jsonObj = JObject.Parse(jsonResponseE);
                    ViewBag.DDLEstc = new SelectList(jsonObj["data"].ToList(), "estc_Id", "estc_Descripcion");
                }
                if (responsedept.IsSuccessStatusCode)
                {
                    var jsonResponseD = await responsedept.Content.ReadAsStringAsync();
                    JObject jsonObj = JObject.Parse(jsonResponseD);
                    ViewBag.dept = new SelectList(jsonObj["data"].ToList(), "dept_Id", "dept_Descripcion");
                }

            }
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(ClienteViewModel clie)
        {

            clie.clie_UserCrea = (int)HttpContext.Session.GetInt32("UsuarioId");

            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(clie);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "api/Clientes/Insert", content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            ClienteViewModel data = new ClienteViewModel();

            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Clientes/Find?id=" + id);

                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();

                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());
                    ClienteViewModel clie = JsonConvert.DeserializeObject<ClienteViewModel>(jsonArray[0].ToString());
                    data.clie_Id = clie.clie_Id;
                    data.clie_Nombres = clie.clie_Nombres;
                    data.clie_ApellIdos = clie.clie_ApellIdos;
                    data.clie_FechaNacimiento = clie.clie_FechaNacimiento;
                    data.clie_Sexo = clie.clie_Sexo;
                    data.clie_Telefeno = clie.clie_Telefeno;
                    data.estc_Id = clie.estc_Id;
                    data.muni_Id = clie.muni_Id;
                    data.dept_Id = clie.dept_Id;
                    data.clie_Direccion = clie.clie_Direccion;

                    var responseEsta = await httpClient.GetAsync(_baseurl + "api/DDL/EstadosCiviles");
                    var responsedept = await httpClient.GetAsync(_baseurl + "api/DDL/Departamentos");
                    var responsemuni = await httpClient.GetAsync(_baseurl + "api/DDL/Municipios?dept=" + data.dept_Id);


                    if (responseEsta.IsSuccessStatusCode)
                    {
                        var jsonResponseE = await responseEsta.Content.ReadAsStringAsync();
                        JObject jsonObj = JObject.Parse(jsonResponseE);
                        ViewBag.DDLEstc = new SelectList(jsonObj["data"].ToList(), "estc_Id", "estc_Descripcion");
                    }
                    if (responsedept.IsSuccessStatusCode)
                    {
                        var jsonResponseD = await responsedept.Content.ReadAsStringAsync();
                        JObject jsonObj = JObject.Parse(jsonResponseD);
                        ViewBag.dept = new SelectList(jsonObj["data"].ToList(), "dept_Id", "dept_Descripcion");
                    }
                    if (responsemuni.IsSuccessStatusCode)
                    {
                        var jsonResponseM = await responsemuni.Content.ReadAsStringAsync();
                        JObject jsonObj = JObject.Parse(jsonResponseM);
                        ViewBag.muni = new SelectList(jsonObj["data"].ToList(), "muni_Id", "muni_Descripcion");
                    }

                }

                return View(data);

            }
        }


        [HttpPost]
        public async Task<IActionResult> Edit(ClienteViewModel clie)
        {

            clie.clie_UserModifica = (int)HttpContext.Session.GetInt32("UsuarioId");

            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(clie);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "api/Clientes/Update", content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int idD)
        {
            ClienteViewModel data = new ClienteViewModel();
            data.clie_Id = idD;
            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(data);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "api/Clientes/Delete",content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }
        }

        [HttpPost]
        public async Task<IActionResult> Munis(string id)
        {
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/DDL/Municipios?dept=" + id);

                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    JObject jsonObj = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObj["data"].ToString());

                    List<object> ddlItems = new List<object>();
                    foreach (JObject jsonObject in jsonArray)
                    {
                        string muni_Id = (string)jsonObject["muni_Id"];
                        string muni_Descripcion = (string)jsonObject["muni_Descripcion"];
                        ddlItems.Add(new { muni_Id = muni_Id, muni_Descripcion = muni_Descripcion });
                    }

                    return Json(ddlItems);
                }
                else
                {
                    return View();
                }
            }
        }
    }
}
