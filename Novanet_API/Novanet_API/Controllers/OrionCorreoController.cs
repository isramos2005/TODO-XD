using Microsoft.AspNetCore.Mvc;
using Novanet.BusinessLogic.Service;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Novanet.API.Controllers
{
    [Route("api/Novanet/[controller]")]
    [ApiController]
    public class OrionCorreoController : Controller
    {
        public readonly OrionService _orionService;

        public OrionCorreoController(OrionService orionService)
        {
            _orionService = orionService;
        }

        [HttpPost("Orion_Correo")]
        public async Task<IActionResult> Orion_Correo(string[] emails)
        {

            var request = await _orionService.Orion_Correo(emails);

            return Ok(request);

        }
    }
}
