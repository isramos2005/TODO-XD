using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Novanet.BusinessLogic.Service;
using Novanet.DataAccess.Repository;
using System.Collections.Generic;

namespace Novanet.API.Controllers
{

    [Route("api/Novanet/[controller]")]
    [ApiController]
    public class PruebaController : Controller
    {

        private readonly PruebaService _pruebaService;
        
        public PruebaController(PruebaService pruebaService)
        {
            _pruebaService = pruebaService;
        }


        [HttpGet("ListPrueba")]
        public IActionResult ListPrueba(int pilDUsuario, int pilDSolicitud)
        {
            var list = _pruebaService.List(pilDUsuario,pilDSolicitud);

            return Ok(list);
        }
    }
}
