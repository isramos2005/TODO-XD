using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Novanet.BusinessLogic.Service;
using System.Collections.Generic;

using static Novanet.DataAccess.Repository.ServicioRepository;

namespace Novanet.API.Controllers
{

    [Route("api/Novanet/[controller]")]
    [ApiController]
    public class ServicioController : Controller
    {

        private readonly AppService _appService;

        public ServicioController(AppService appService)
        {
            _appService = appService;
        }

        [HttpGet("PagosByCliente")]
        public IActionResult PagosByCliente(int piIDCliente, int piIDSolicitud)
        {
            var list = _appService.PagosByCliente(piIDCliente, piIDSolicitud);

            return Ok(list);
        }


        [HttpGet("Productos_ListaPorCliente")]
        public IActionResult Productos_ListaPorCliente(int piIDSolicitud)
        {
            var list = _appService.Productos_ListaPorCliente(piIDSolicitud);

            return Ok(list);
        }

        [HttpGet("ProductosAsolicitud_ListaPorCliente")]
        public IActionResult ProductosAsolicitud_ListaPorCliente(int piIDSolicitud)
        {
            var list = _appService.ProductosAsolicitud_ListaPorCliente(piIDSolicitud);

            return Ok(list);
        }

        [HttpGet("Solicitudes_AdicionProducto_Listado")]
        public IActionResult Solicitudes_AdicionProducto_Listado(int piIDSolicitud)
        {
            var list = _appService.Solicitudes_AdicionProducto_Listado(piIDSolicitud);

            return Ok(list);
        }


        [HttpGet("Solicitudes_AdicionProducto_Detalles")]
        public IActionResult Solicitudes_AdicionProducto_Detalles(int piIDAdicionProduto)
        {
            var list = _appService.Solicitudes_AdicionProducto_Detalles(piIDAdicionProduto);

            return Ok(list);
        }

        [HttpPost("SolicitudesAdicionProducto_Insertar")]
        public IActionResult SolicitudesAdicionProducto_Insertar(SolicitudViewModel solicitudViewModel)
        {
         
            var jsonDetalles = JsonConvert.SerializeObject(solicitudViewModel.jsondetalles);
            
            var result = _appService.SolicitudesAdicionProducto_Insertar(solicitudViewModel.fiIDSolicitud, jsonDetalles);
            return Ok(result);
        }


    }
}
