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
    public class ClienteController : Controller
    {

        private readonly KujoService _kujoService;
        private readonly IMapper _mapper;

        public ClienteController(KujoService kujoService, IMapper mapper)
        {
            _kujoService = kujoService;
            _mapper = mapper;
        }

        [HttpGet("api/Clientes/Listado")]
        public IActionResult Index()
        {
            var list = _kujoService.ListClientes();
            return Ok(list);
        }

        [HttpPost("api/Clientes/Insert")]
        public IActionResult Insert([FromBody] ClienteViewModel prod)
        {
            var item = _mapper.Map<tbClientes>(prod);
            var list = _kujoService.InsertCliente(item);
            return Ok(list);
        }

        [HttpPost("api/Clientes/Update")]
        public IActionResult Update([FromBody] ClienteViewModel prod)
        {
            var item = _mapper.Map<tbClientes>(prod);
            var list = _kujoService.UpdateCliente(item);
            return Ok(list);
        }

        [HttpGet("api/Clientes/Find")]
        public IActionResult Find(int id)
        {
            var list = _kujoService.FindCliente(id);
            return Ok(list);
        }

        [HttpPost("api/Clientes/Delete")]
        public IActionResult Delete([FromBody] ClienteViewModel id)
        {
            var list = _kujoService.DeleteCliente(id.clie_Id);
            return Ok(list);
        }

        [HttpGet("api/DDL/Departamentos")]
        public IActionResult DDLDepartamentos()
        {
            var list = _kujoService.DDLDepartamentos();
            return Ok(list);
        }

        [HttpGet("api/DDL/Municipios")]
        public IActionResult DDlMunicipios(string dept)
        {
            var list = _kujoService.DDlMunicipios(dept);
            return Ok(list);
        }

        [HttpGet("api/DDL/EstadosCiviles")]
        public IActionResult DDlEstadosCiviles()
        {
            var list = _kujoService.DDlEstadosCiviles();
            return Ok(list);
        }
    }
}
