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
    public class FacturasController : Controller
    {
        private static string _baseurl;

        public FacturasController()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _baseurl = builder.GetSection("ApiSettings:BaseUrl").Value;

        }


        [HttpGet("Facturas/Listado")]
        public async Task<IActionResult> Index()
        {
            List<FacturaViewModel> listado = new List<FacturaViewModel>();

            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Facturas/Listado");
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    listado = JsonConvert.DeserializeObject<List<FacturaViewModel>>(jsonResponse);
                }

                return View(listado);
            }

        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {

            List<FacturaDetalleViewModel> listado = new List<FacturaDetalleViewModel>();


            using (var httpClient = new HttpClient())
            {

                var responseprod = await httpClient.GetAsync(_baseurl + "api/Productos/Listado");
                var responseclie = await httpClient.GetAsync(_baseurl + "api/Clientes/Listado");


                if (responseprod.IsSuccessStatusCode)
                {
                    var jsonResponseP = await responseprod.Content.ReadAsStringAsync();
                    JArray jArray = JArray.Parse(jsonResponseP);
                    ViewBag.prod_Id = new SelectList(jArray, "prod_Id", "prod_Descripcion");
                }

                if (responseclie.IsSuccessStatusCode)
                {
                    var jsonResponseC = await responseclie.Content.ReadAsStringAsync();
                    JArray jArray = JArray.Parse(jsonResponseC);
                    ViewBag.clie_Id = new SelectList(jArray, "clie_Id", "nombreCliente");
                }

                if (string.IsNullOrEmpty(HttpContext.Session.GetInt32("NuevoID").ToString()) || string.IsNullOrEmpty(HttpContext.Session.GetInt32("Cliente").ToString()) || (!string.IsNullOrEmpty(HttpContext.Session.GetInt32("Cliente").ToString()) && HttpContext.Session.GetInt32("Cliente") == 0))
                {
                    ViewBag.NuevoId = 0;
                    ViewBag.Subtotal = 0;
                    ViewBag.IVA = 0;
                    ViewBag.Total = 0;

                    var responsetabla = await httpClient.GetAsync(_baseurl + "api/FacturaDetalles/Listado?id=" + 0);
                    if (responsetabla.IsSuccessStatusCode)
                    {
                        var jsonResponse = await responsetabla.Content.ReadAsStringAsync();
                        listado = JsonConvert.DeserializeObject<List<FacturaDetalleViewModel>>(jsonResponse);
                        ViewBag.Detalles = listado;
                    }

                }
                if (!string.IsNullOrEmpty(HttpContext.Session.GetInt32("NuevoID").ToString()) || (!string.IsNullOrEmpty(HttpContext.Session.GetInt32("Cliente").ToString()) && HttpContext.Session.GetInt32("Cliente") != 0))
                {
                    var jsonResponseC = await responseclie.Content.ReadAsStringAsync();
                    JArray jArray = JArray.Parse(jsonResponseC);
                    ViewBag.clie_Id = new SelectList(jArray, "clie_Id", "nombreCliente", HttpContext.Session.GetInt32("Cliente"));
                    ViewBag.NuevoId = HttpContext.Session.GetString("NuevoID");

                    var responsetabla = await httpClient.GetAsync(_baseurl + "api/FacturaDetalles/Listado?id=" + int.Parse(HttpContext.Session.GetString("NuevoID")));
                    if (responsetabla.IsSuccessStatusCode)
                    {
                        var jsonResponse = await responsetabla.Content.ReadAsStringAsync();
                        listado = JsonConvert.DeserializeObject<List<FacturaDetalleViewModel>>(jsonResponse);
                        ViewBag.Detalles = listado;
                    }

                    var responseDetalles = await httpClient.GetAsync(_baseurl + "api/FacturaDetalles/Detalles?id=" + int.Parse(HttpContext.Session.GetString("NuevoID")));
                    if (responsetabla.IsSuccessStatusCode)
                    {
                        var jsonResponse = await responseDetalles.Content.ReadAsStringAsync();
                        JObject jsonObjGet = JObject.Parse(jsonResponse);
                        JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());
                        FacturaViewModel detalles = JsonConvert.DeserializeObject<FacturaViewModel>(jsonArray[0].ToString());
                        ViewBag.Subtotal = detalles.SubTotal;
                        ViewBag.IVA = detalles.IVA;
                        ViewBag.Total = detalles.Total;

                    }
                }
                return View();
            }
        }

        public IActionResult Terminar()
        {

            HttpContext.Session.SetString("NuevoID", "");
            HttpContext.Session.SetInt32("Cliente", 0);


            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> Create(FacturaViewModel fact)
        {
            fact.empl_Id = (int)HttpContext.Session.GetInt32("empl_Id");
            fact.fact_UserCrea = (int)HttpContext.Session.GetInt32("UsuarioId");
            List<FacturaDetalleViewModel> listado = new List<FacturaDetalleViewModel>();

            HttpContext.Session.SetInt32("Cliente", (int)fact.clie_Id);


            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(fact);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "api/Facturas/Insert", content);

                if (response.IsSuccessStatusCode)
                {

                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                    FacturaViewModel factu = JsonConvert.DeserializeObject<FacturaViewModel>(jsonArray[0].ToString());

                    var responseprod = await httpClient.GetAsync(_baseurl + "api/Productos/Listado");
                    var responseclie = await httpClient.GetAsync(_baseurl + "api/Clientes/Listado");
                    var responsetabla = await httpClient.GetAsync(_baseurl + "api/FacturaDetalles/Listado?id=" + 0);


                    if (responseprod.IsSuccessStatusCode)
                    {
                        var jsonResponseP = await responseprod.Content.ReadAsStringAsync();
                        JArray jArray = JArray.Parse(jsonResponseP);
                        ViewBag.prod_Id = new SelectList(jArray, "prod_Id", "prod_Descripcion");
                    }

                    if (responseclie.IsSuccessStatusCode)
                    {
                        var jsonResponseC = await responseclie.Content.ReadAsStringAsync();
                        JArray jArray = JArray.Parse(jsonResponseC);
                        ViewBag.clie_Id = new SelectList(jArray, "clie_Id", "nombreCliente", factu.clie_Id);
                    }

                    if (responsetabla.IsSuccessStatusCode)
                    {
                        var jsonResponseT = await responsetabla.Content.ReadAsStringAsync();
                        listado = JsonConvert.DeserializeObject<List<FacturaDetalleViewModel>>(jsonResponseT);
                        ViewBag.Detalles = listado;
                    }

                    HttpContext.Session.SetString("NuevoID", factu.fact_Id.ToString());
                    ViewBag.Subtotal = 0;
                    ViewBag.IVA = 0;
                    ViewBag.Total = 0;
                    ViewBag.NuevoId = HttpContext.Session.GetString("NuevoID");

                    return View();
                }
                else
                {
                    return View();
                }
            }
        }


        [HttpPost]
        public async Task<IActionResult> CreateFactDet(string NuevaId, int prod_Id, decimal txtPrecio, int txtCantidad)
        {

            FacturaDetalleViewModel factdet = new FacturaDetalleViewModel();
            factdet.fact_Id = Convert.ToInt32(NuevaId);
            factdet.prod_Id = prod_Id;
            factdet.facd_PrecioUnitario = txtPrecio;
            factdet.prod_Cantidad = txtCantidad;
            factdet.facd_UserCrea = (int)HttpContext.Session.GetInt32("UsuarioId");



            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(factdet);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "api/FacturaDetalles/Insert", content);

                if (response.IsSuccessStatusCode)
                {

                    var responseprod = await httpClient.GetAsync(_baseurl + "api/Productos/Listado");
                    var responseclie = await httpClient.GetAsync(_baseurl + "api/Clientes/Listado");


                    if (responseprod.IsSuccessStatusCode)
                    {
                        var jsonResponseP = await responseprod.Content.ReadAsStringAsync();
                        JArray jArray = JArray.Parse(jsonResponseP);
                        ViewBag.prod_Id = new SelectList(jArray, "prod_Id", "prod_Descripcion");
                    }

                    if (responseclie.IsSuccessStatusCode)
                    {
                        var jsonResponseC = await responseclie.Content.ReadAsStringAsync();
                        JArray jArray = JArray.Parse(jsonResponseC);
                        ViewBag.clie_Id = new SelectList(jArray, "clie_Id", "nombreCliente", HttpContext.Session.GetInt32("Cliente"));

                    }

                    ViewBag.NuevoId = HttpContext.Session.GetString("NuevoID");

                    return RedirectToAction("Create", "Facturas");

                }
                else
                {
                    return RedirectToAction("Create", "Facturas");

                }
            }
        }


        [HttpPost]
        public async Task<IActionResult> PrecioProducto(int id)
        {
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Productos/Find?id=" + id);

                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    JObject jsonObj = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObj["data"].ToString());

                    List<object> ddlItems = new List<object>();
                    foreach (JObject jsonObject in jsonArray)
                    {
                        string prod_Precio = (string)jsonObject["prod_Precio"];
                        ddlItems.Add(new { prod_Precio = prod_Precio });
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
        public async Task<IActionResult> DeleteDetails(int idD)
        {
            FacturaDetalleViewModel data = new FacturaDetalleViewModel();
            data.facd_Id = idD;
            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(data);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "api/FacturasDetalle/Delete", content);

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Create", "Facturas");
                }
                else
                {
                    return RedirectToAction("Create", "Facturas");
                }
            }
        }

        [HttpGet("Facturas/Detalles")]
        public async Task<IActionResult> Details(int id)
        {
            FacturaViewModel factura = new FacturaViewModel();
            List<FacturaDetalleViewModel> listado = new List<FacturaDetalleViewModel>();

            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Facturas/Find?id=" + id);
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                    FacturaViewModel fact = JsonConvert.DeserializeObject<FacturaViewModel>(jsonArray[0].ToString());
                    factura.NombreCliente = fact.NombreCliente;
                    factura.NombreEmpleado = fact.NombreEmpleado;
                    factura.fact_Id = fact.fact_Id;
                    factura.fact_fechacompra = fact.fact_fechacompra;
                }

                var responsetabla = await httpClient.GetAsync(_baseurl + "api/FacturaDetalles/Listado?id=" + id);
                if (responsetabla.IsSuccessStatusCode)
                {
                    var jsonResponse = await responsetabla.Content.ReadAsStringAsync();
                    listado = JsonConvert.DeserializeObject<List<FacturaDetalleViewModel>>(jsonResponse);
                    ViewBag.Detalles = listado;
                }

                var responseDetalles = await httpClient.GetAsync(_baseurl + "api/FacturaDetalles/Detalles?id=" + id);
                if (responsetabla.IsSuccessStatusCode)
                {
                    var jsonResponse = await responseDetalles.Content.ReadAsStringAsync();
                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());
                    FacturaViewModel detalles = JsonConvert.DeserializeObject<FacturaViewModel>(jsonArray[0].ToString());
                    ViewBag.Subtotal = detalles.SubTotal;
                    ViewBag.IVA = detalles.IVA;
                    ViewBag.Total = detalles.Total;

                }

                return View(factura);
            }

        }

    }
}
