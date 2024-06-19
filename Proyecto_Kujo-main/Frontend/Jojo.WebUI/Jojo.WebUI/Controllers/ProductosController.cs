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
    public class ProductosController : Controller
    {
        private static string _baseurl;

        public ProductosController()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _baseurl = builder.GetSection("ApiSettings:BaseUrl").Value;

        }


        [HttpGet("Productos/Listado")]
        public async Task<IActionResult> Index()
        {
            List<ProductoViewModel> listado = new List<ProductoViewModel>();
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Productos/Listado");
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    listado = JsonConvert.DeserializeObject<List<ProductoViewModel>>(jsonResponse);
                }

                var responseprov = await httpClient.GetAsync(_baseurl + "api/Productos/DDL/Proveedores");
                if (responseprov.IsSuccessStatusCode)
                {
                    var jsonResponse = await responseprov.Content.ReadAsStringAsync();
                    JObject json = JObject.Parse(jsonResponse);
                    JArray dataArray = (JArray)json["data"];
                    var data = dataArray.ToObject<List<ProductoViewModel>>();
                    ViewBag.prov = new SelectList(data, "prov_Id", "prov_Nombre");
                }
                var responsecate = await httpClient.GetAsync(_baseurl + "api/Productos/DDL/Categorias");

                if (responsecate.IsSuccessStatusCode)
                {
                    var jsonResponse = await responsecate.Content.ReadAsStringAsync();
                    JObject json = JObject.Parse(jsonResponse);
                    JArray dataArray = (JArray)json["data"];
                    var data = dataArray.ToObject<List<ProductoViewModel>>();
                    ViewBag.cate = new SelectList(data, "cate_Id", "cate_Descripcion");
                }

                return View(listado);
            }

        }

        [HttpGet("Productos/Detalles")]
        public async Task<IActionResult> Details(int id)
        {
            ProductoViewModel prod = new ProductoViewModel();
            using (var httpClient = new HttpClient())
            {
                var response = await httpClient.GetAsync(_baseurl + "api/Productos/Find?id=" + id);
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    JObject jsonObjGet = JObject.Parse(jsonResponse);
                    JArray jsonArray = JArray.Parse(jsonObjGet["data"].ToString());

                    ProductoViewModel producto = JsonConvert.DeserializeObject<ProductoViewModel>(jsonArray[0].ToString());

                    prod.prod_Descripcion = producto.prod_Descripcion;
                    prod.prod_Id = producto.prod_Id;
                    prod.cate_Descripcion = producto.cate_Descripcion;
                    prod.prov_Nombre = producto.prov_Nombre;
                    prod.prod_Precio = producto.prod_Precio;
                    prod.prod_Stock = producto.prod_Stock;

                    prod.empl_Crea = producto.empl_Crea;
                    prod.prod_FechaCreacion = producto.prod_FechaCreacion;
                    prod.empl_Modifica = producto.empl_Modifica;
                    prod.prod_FechaModificacion = producto.prod_FechaModificacion;


                }

                return View(prod);
            }

        }


        [HttpPost]
        public async Task<IActionResult> Create(string descripcionI, string PrecioI, int CategoriaI, int ProveedorI, int stockI)
        {
            ProductoViewModel producto = new ProductoViewModel();

            producto.prod_Descripcion = descripcionI;
            producto.cate_Id = CategoriaI;
            producto.prov_Id = ProveedorI;
            producto.prod_Stock = stockI;
            producto.prod_Precio = decimal.Parse(PrecioI);
            producto.prod_UserCrea = (int)HttpContext.Session.GetInt32("UsuarioId");

            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(producto);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "api/Productos/Insert", content);

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
        public async Task<IActionResult> Update(int idE, string descripcionE, string PrecioE, int CategoriaE, int ProveedorE, int stockE)
        {
            ProductoViewModel producto = new ProductoViewModel();

            producto.prod_Id = idE;
            producto.prod_Descripcion = descripcionE;
            producto.cate_Id = CategoriaE;
            producto.prov_Id = ProveedorE;
            producto.prod_Stock = stockE;
            producto.prod_Precio = decimal.Parse(PrecioE);
            producto.prod_UserModifica = (int)HttpContext.Session.GetInt32("UsuarioId");

            using (var httpClient = new HttpClient())
            {
                var json = JsonConvert.SerializeObject(producto);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "api/Productos/Update", content);

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
            ProductoViewModel producto = new ProductoViewModel();

            producto.prod_Id = idD;

            using (var httpClient = new HttpClient())
            {

                var json = JsonConvert.SerializeObject(producto);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(_baseurl + "api/Productos/Delete" , content);

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
