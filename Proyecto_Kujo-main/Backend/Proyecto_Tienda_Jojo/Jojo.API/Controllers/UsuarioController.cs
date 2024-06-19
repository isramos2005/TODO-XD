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
    public class UsuarioController : Controller
    {
        private readonly AccessService _accessService;
        private readonly IMapper _mapper;

        public UsuarioController(AccessService accessService, IMapper mapper)
        {
            _accessService = accessService;
            _mapper = mapper;
        }



        [HttpGet("Login")]
        public IActionResult Find(string user, string pass)
        {
            var result = _accessService.Login(user, pass);
            return Ok(result);
        }


        [HttpGet("ListUsuario")]
        public IActionResult ListUsuario()
        {
            var list = _accessService.ListUsuarios();

            return Ok(list);
        }

        [HttpPost("InsertUsuario")]
        public IActionResult InsertUsuario([FromBody] UsuarioViewModel Usuario)
        {
            var item = _mapper.Map<tbUsuarios>(Usuario);
            var result = _accessService.InsertU(item);
            return Ok(result);
        }


        [HttpPost("UpdateUsuario")]
        public IActionResult UpdateUsuario([FromBody] UsuarioViewModel Usuario)
        {
            var item = _mapper.Map<tbUsuarios>(Usuario);
            var result = _accessService.UpdateU(item);
            return Ok(result);
        }

        [HttpGet("api/Usuario/Find")]
        public IActionResult Find(int id)
        {
            var list = _accessService.FindUsuario(id);
            return Ok(list);
        }


        [HttpPost("DeleteUsuario")]
        public IActionResult DeleteUsuario([FromBody] UsuarioViewModel Usuario)
        {
            var item = _mapper.Map<tbUsuarios>(Usuario);
            var result = _accessService.DeleteU(Usuario.user_Id);
            return Ok(result);
        }

        [HttpGet("ListEmpleados")]
        public IActionResult Empleados()
        {
            var result = _accessService.Empleados();
            return Ok(result);
        }
    }
}
