using Jojo.API.Models;
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
    public class UsuarioController : Controller
    {

        private static string _baseurl;

        public UsuarioController()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _baseurl = builder.GetSection("ApiSettings:BaseUrl").Value;

        }
        [HttpGet("Usuarios/Listado")]
        public async Task<IActionResult> Index()
        {
            List<UsuarioViewModel> listado = new List<UsuarioViewModel>();
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "ListUsuario");
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    listado = JsonConvert.DeserializeObject<List<UsuarioViewModel>>(jsonResponse);

                }
                var responseR = await httpClient.GetAsync(_baseurl + "ListRoles");
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponseR = await responseR.Content.ReadAsStringAsync();
                    JArray jsonArrayR = JArray.Parse(jsonResponseR);
                    ViewBag.roles_Id = new SelectList(jsonArrayR, "role_Id", "role_Descripcion");
                }
                var responseD = await httpClient.GetAsync(_baseurl + "ListEmpleados");
                if (responseD != null && responseD.IsSuccessStatusCode)
                {
                    var jsonResponseD = await responseD.Content.ReadAsStringAsync();
                    JArray jsonArrayD = JArray.Parse(jsonResponseD);
                    ViewBag.empl = new SelectList(jsonArrayD, "empl_Id", "nombreEmpleado");
                }

                return View(listado);
            }


        }

        [HttpPost]
        public async Task<IActionResult> Create(string txtNombreUsuaIn, string txtContraIn, int RdbAdminIn, string CkRolIn, int ddlempl_IdIn)
        {
            UsuarioViewModel usuario = new UsuarioViewModel();
            usuario.user_NombreUsuario = txtNombreUsuaIn;
            usuario.user_Contraseña = txtContraIn;
            usuario.user_Admin = Convert.ToBoolean(RdbAdminIn);
            usuario.role_Id = Convert.ToInt32(CkRolIn);
            usuario.empl_Id = ddlempl_IdIn;
            usuario.user_UserCrea = HttpContext.Session.GetInt32("UsuarioId");

            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(usuario);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "InsertUsuario", content);

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

        public async Task<IActionResult> Details(int id)
        {
            UsuarioViewModel user = new UsuarioViewModel();
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Usuario/Find?id=" + id);
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                    UsuarioViewModel usuario = JsonConvert.DeserializeObject<UsuarioViewModel>(jsonArray[0].ToString());

                    user.user_Id = usuario.user_Id;
                    user.user_NombreUsuario = usuario.user_NombreUsuario;
                    user.NombreEmpleado = usuario.NombreEmpleado;
                    user.role_Descripcion = usuario.role_Descripcion;
                    user.EsAdmin = usuario.EsAdmin;

                        
                    user.empl_Crea = usuario.empl_Crea;
                    user.user_FechaCrea = usuario.user_FechaCrea;
                    user.empl_Modifica = usuario.empl_Modifica;
                    user.user_FechaModifica = usuario.user_FechaModifica;


                }

                return View(user);
            }

        }

        [HttpPost]
        public async Task<IActionResult> Update(int usua_IdEdit, int RdbAdminEd, string CkRolEdit, int ddlempl_IdEdit)
        {
            UsuarioViewModel usuario = new UsuarioViewModel();
            usuario.user_Id = usua_IdEdit;
            usuario.user_Admin = Convert.ToBoolean(RdbAdminEd);
            usuario.role_Id = Convert.ToInt32(CkRolEdit);
            usuario.empl_Id = ddlempl_IdEdit;
            usuario.user_UserModifica = HttpContext.Session.GetInt32("UsuarioId");

            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(usuario);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "UpdateUsuario", content);

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
        public async Task<IActionResult> Delete(int usua_Id)
        {
            UsuarioViewModel usuario = new UsuarioViewModel();
            usuario.user_Id = usua_Id;


            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(usuario);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "DeleteUsuario", content);

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

    }
}

