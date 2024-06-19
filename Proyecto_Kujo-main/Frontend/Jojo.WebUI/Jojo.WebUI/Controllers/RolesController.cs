using Jojo.WebUI.Models;
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
using System.Text;
using System.Threading.Tasks;

namespace Jojo.WebUI.Controllers
{
    public class RolesController : Controller
    {

        private static string _baseurl;

        public RolesController()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _baseurl = builder.GetSection("ApiSettings:BaseUrl").Value;

        }

        [HttpGet("Roles/Listado")]
        public async Task<IActionResult> Index()
        {
            List<RolesViewModel> listado = new List<RolesViewModel>();
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "ListRoles");
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    listado = JsonConvert.DeserializeObject<List<RolesViewModel>>(jsonResponse);
                }
                return View(listado);
            }
        }


        [HttpPost]
        public async Task<IActionResult> Create(string descripcionI)
        {
            RolesViewModel Rol = new RolesViewModel();
            Rol.role_Descripcion = descripcionI;
            Rol.role_UserCrea = HttpContext.Session.GetInt32("UsuarioId");

            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(Rol);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "InsertRol", content);
                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Index");

                }
            }
        }

        [HttpGet("Roles/Detalles")]
        public async Task<IActionResult> Details(int id)
        {
            RolesViewModel rol = new RolesViewModel();
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Roles/Find?id=" + id);
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                    RolesViewModel producto = JsonConvert.DeserializeObject<RolesViewModel>(jsonArray[0].ToString());

                    rol.role_Id = producto.role_Id;
                    rol.role_Descripcion = producto.role_Descripcion;
    

                    rol.empl_Crea = producto.empl_Crea;
                    rol.role_FechaCrea = producto.role_FechaCrea;
                    rol.empl_Modifica = producto.empl_Modifica;
                    rol.role_FechaModifica = producto.role_FechaModifica;


                }

                return View(rol);
            }

        }


        [HttpPost]
        public async Task<IActionResult> Update(int idE, string descripcionE)
        {
            RolesViewModel Rol = new RolesViewModel();
            Rol.role_Id = idE;
            Rol.role_Descripcion = descripcionE;
            Rol.role_UserModifica = HttpContext.Session.GetInt32("UsuarioId");


            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(Rol);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "UpdateRol", content);

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
            RolesViewModel listado = new RolesViewModel();
            listado.role_Id = idD;

            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(listado);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "DeleteRol", content);
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
        public async Task<IActionResult> PantallasCK(string ident)
        {
            List<PantallaViewModel> listado = new List<PantallaViewModel>();
            using (var httpClient = new HttpClient())
            {

                var response = await httpClient.GetAsync(_baseurl + $"PantallasCK?ident=" + ident);
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();

                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                    List<object> ddlItems = new List<object>();
                    foreach (JObject jsonObject in jsonArray)
                    {
                        string pant_Id = (string)jsonObject["pant_Id"];
                        string pant_Nombre = (string)jsonObject["pant_Nombre"];
                        ddlItems.Add(new { pant_Id = pant_Id, pant_Nombre = pant_Nombre });
                    }

                    return Json(ddlItems);
                }
                else
                {
                    return View();
                }
            }
        }


        [HttpPost]
        public async Task<IActionResult> PantallasChecked(int role_Id)
        {
            List<PantallaViewModel> listado = new List<PantallaViewModel>();
            using (var httpClient = new HttpClient())
            {

                var response = await httpClient.GetAsync(_baseurl + $"PantallasChecked?role_Id=" + role_Id);
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();

                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                    List<object> ddlItems = new List<object>();
                    foreach (JObject jsonObject in jsonArray)
                    {
                        string pant_Id = (string)jsonObject["pant_Id"];
                        ddlItems.Add(new { pant_Id = pant_Id });
                    }

                    return Json(ddlItems);
                }
                else
                {
                    return View();
                }
            }
        }


        [HttpPost]
        public async Task<IActionResult> PantallasAgg(int role_Id, int pant_Id)
        {
            PantallaPorRolViewModel pantrole = new PantallaPorRolViewModel();
            pantrole.role_Id = role_Id;
            pantrole.pant_Id = pant_Id;
            pantrole.pantrol_UserCrea = HttpContext.Session.GetInt32("UsuarioId");

            using (var httpClient = new HttpClient())
            {

                var json = JsonConvert.SerializeObject(pantrole);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "PantallasAgg", content);

                if (response.IsSuccessStatusCode)
                {

                    return Json(1);
                }
                else
                {
                    return Json(0);
                }
            }
        }


        [HttpPost]
        public async Task<IActionResult> PantallasElim(int role_Id, int pant_Id)
        {
            PantallaPorRolViewModel pantrole = new PantallaPorRolViewModel();
            pantrole.role_Id = role_Id;
            pantrole.pant_Id = pant_Id;

            using (var httpClient = new HttpClient())
            {

                var json = JsonConvert.SerializeObject(pantrole);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "PantallasElim", content);

                if (response.IsSuccessStatusCode)
                {

                    return Json(1);
                }
                else
                {
                    return Json(0);
                }
            }
        }


        [HttpPost]
        public async Task<IActionResult> Pantallas(int idR, int idPant)
        {
            List<RolesViewModel> listado = new List<RolesViewModel>();
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "ListPantallas");
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    listado = JsonConvert.DeserializeObject<List<RolesViewModel>>(jsonResponse);
                }
                return View(listado);
            }
        }
    }
}
