using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Novanet.API.Models;
using Novanet.BusinessLogic.Service;
using Novanet.Entities.Entities;
using System.Threading.Tasks;

namespace Novanet.API.Controllers
{
    [Route("api/Novanet/[controller]")]
    [ApiController]
    public class UsuarioController : Controller
    {
        private readonly AccessService _accessService;

        private IHubContext testHub;

        public UsuarioController(AccessService accessService)
        {
            _accessService = accessService;
        }

        [HttpPost("Insert")]
        public IActionResult Insert(ClientesMovilLogin item)
        {
            var list = _accessService.Insert(item);

            return Ok(list);
        }


        [HttpPost("InsertUsuarioFamiliar")]
        public IActionResult InsertUsuarioFamiliar(ClientesMovilLogin item)
        {
            var list = _accessService.InsertUsuarioFamiliar(item);

            return Ok(list);
        }


        [HttpPost("CambioImagen")]
        public IActionResult CambioImagen(ImagenViewModel imagen)
        {

            var request =  _accessService.CambioImagen(imagen.base64, imagen.nombreArchivo, imagen.piIDUnico);

            return Ok(request);

        }

   

        [HttpPost("EmailToken")]
        public async Task<IActionResult> EmailToken(string email)
        {

            var request = await _accessService.GenerateAndSendAuthToken(email);

            return Ok(request);

        }
        

        [HttpGet("EmailTokenPassword")]
        public async Task<IActionResult> EmailTokenPassword(string email)
        {

            var request = await _accessService.EmailTokenPassword(email);

            return Ok(request);

        }

        [HttpPost("CambioContrasenia")]
        public IActionResult CambioContrasenia(ClientesMovilLogin item)
        {
            var list = _accessService.CambioContrasenia(item);

            return Ok(list);
        }

        [HttpPost("ReferirCliente")]
        public IActionResult ReferirCliente(ClientesReferidosCredito item)
        {
            var list = _accessService.ReferirCliente(item);

            return Ok(list);
        }
    }
}
