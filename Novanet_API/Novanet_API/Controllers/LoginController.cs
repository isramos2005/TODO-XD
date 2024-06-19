using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Novanet.API.Hubs;
using Novanet.API.Models;
using Novanet.BusinessLogic.Service;
using Novanet.DataAccess;
using Novanet.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Novanet.API.Controllers
{


    [Route("api/Novanet/[controller]")]
    [ApiController]
    public class LoginController : Controller
    {
        private readonly AccessService _accessService;

        private IHubContext testHub;


        public LoginController(AccessService accessService)
        {
            _accessService = accessService;
        }

        [HttpGet("Login")]
        public async Task<IActionResult> Login(string Email, string Password)
        {


            var request = await _accessService.Login(Email, Password);
           
            return Ok(request);
    
        }

        

        [HttpGet("PrimerInicio")]
        public IActionResult PrimerInicio(string pcUsuarioAcceso, string pcIdentidadCliente)
        {
            
            var list = _accessService.PrimerInicio(pcUsuarioAcceso, pcIdentidadCliente);

            return Ok(list);
        }


        [HttpGet("IdentidadRegistro")]
        public IActionResult IdentidadRegistro(string pcIdentidadCliente)
        {

            var list = _accessService.IdentidadRegistro(pcIdentidadCliente);

            return Ok(list);
        }


        [HttpGet("LoginApp")]
        public IActionResult LoginApp(string fcUsuarioAcceso, string fcPassword)
        {
            var list = _accessService.LoginApp(fcUsuarioAcceso, fcPassword);

            return Ok(list);
        }


     
    }
}
