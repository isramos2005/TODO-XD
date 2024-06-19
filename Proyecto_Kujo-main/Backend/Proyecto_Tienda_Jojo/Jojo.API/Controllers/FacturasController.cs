using AutoMapper;
using Jojo.API.Models;
using Jojo.BusinessLogic.Services;
using Jojo.Entities.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.API.Controllers
{
    public class FacturasController : Controller
    {
        private readonly KujoService _kujoService;
        private readonly IMapper _mapper;

        public FacturasController(KujoService kujoService, IMapper mapper)
        {
            _kujoService = kujoService;
            _mapper = mapper;
        }

        [HttpGet("api/Facturas/Listado")]
        public IActionResult Index()
        {
            var list = _kujoService.ListFacturas();
            return Ok(list);
        }

        [HttpGet("api/Facturas/Grafica")]
        public IActionResult Grafica()
        {
            var list = _kujoService.Grafica();
            return Ok(list);
        }

        [HttpGet("api/Facturas/Reporte")]
        public IActionResult Reporte()
        {
            var list = _kujoService.Reporte();
            return Ok(list);
        }

        [HttpGet("api/FacturaDetalles/Listado")]
        public IActionResult Index(int id)
        {
            var list = _kujoService.ListFacturasDetalles(id);
            return Ok(list);
        }

        [HttpGet("api/FacturaDetalles/Detalles")]
        public IActionResult Factura(int id)
        {
            var list = _kujoService.FacturaDetalles(id);
            return Ok(list);
        }

        [HttpPost("api/Facturas/Insert")]
        public IActionResult Insert([FromBody] FacturaViewModel fact)
        {
            var item = _mapper.Map<tbFacturas>(fact);
            var list = _kujoService.InsertFactura(item);
            return Ok(list);
        }

        [HttpPost("api/FacturaDetalles/Insert")]
        public IActionResult Insert([FromBody] FacturaDetalleViewModel fcatd)
        {
            var item = _mapper.Map<tbFacturasDetalles>(fcatd);
            var list = _kujoService.InsertFacturaDetalle(item);
            return Ok(list);
        }

        [HttpGet("api/Facturas/Find")]
        public IActionResult Find(int id)
        {
            var list = _kujoService.FindFactura(id);
            return Ok(list);
        }

        [HttpPost("api/FacturasDetalle/Delete")]
        public IActionResult Delete([FromBody] FacturaDetalleViewModel id)
        {
            var list = _kujoService.DeleteDetalle(id.facd_Id);
            return Ok(list);
        }
    }
}
