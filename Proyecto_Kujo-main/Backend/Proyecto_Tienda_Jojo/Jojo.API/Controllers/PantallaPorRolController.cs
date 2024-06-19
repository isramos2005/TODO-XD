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
    public class PantallaPorRolController : Controller
    {
        private readonly AccessService _accessService;
        private readonly IMapper _mapper;

        public PantallaPorRolController(AccessService accessService, IMapper mapper)
        {
            _accessService = accessService;
            _mapper = mapper;
        }
        public IActionResult Index()
        {
            return View();
        }


        [HttpGet("Pantallas")]
        public IActionResult Pantallas(int id)
        {
            var result = _accessService.PantallasPorRol(id);
            return Ok(result);
        }

        [HttpGet("ListRoles")]
        public IActionResult Roles()
        {
            var result = _accessService.Roles();
            return Ok(result);
        }

        [HttpGet("api/Roles/Find")]
        public IActionResult Find(int id)
        {
            var result = _accessService.FindRol(id);
            return Ok(result);
        }

        [HttpGet("PantallasCK")]
        public IActionResult Pantallas(string ident)
        {
            var result = _accessService.Pantallas(ident);
            return Ok(result);
        }

        [HttpPost("PantallasAgg")]
        public IActionResult PantallasAgg([FromBody] PantallaPorRolViewModel pr)
        {
            var item = _mapper.Map<tbPantallasPorRol>(pr);
            var result = _accessService.PantallasAgg(item);
            return Ok(result);
        }

        [HttpPost("PantallasElim")]
        public IActionResult PantallasElim([FromBody] PantallaPorRolViewModel pr)
        {

            var result = _accessService.PantallasElim((int)pr.role_Id, (int)pr.pant_Id);
            return Ok(result);
        }

        [HttpGet("PantallasChecked")]
        public IActionResult PantallasChecked(int role_Id)
        {
            var result = _accessService.PantallasChecked(role_Id);
            return Ok(result);
        }

        [HttpPost("InsertRol")]
        public IActionResult InsertRol([FromBody] RolesViewModel rol)
        {
            var item = _mapper.Map<tbRoles>(rol);
            var result = _accessService.InsertR(item);
            return Ok(result);
        }

        [HttpPost("UpdateRol")]
        public IActionResult UpdateRol([FromBody] RolesViewModel rol)
        {
            var item = _mapper.Map<tbRoles>(rol);
            var result = _accessService.UpdateR(item);
            return Ok(result);
        }

        [HttpPost("DeleteRol")]
        public IActionResult DeleteRol([FromBody] RolesViewModel rol)
        {
            var item = _mapper.Map<tbRoles>(rol);
            var result = _accessService.DeleteR(item);
            return Ok(result);
        }
    }
}
