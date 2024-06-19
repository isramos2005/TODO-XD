using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Novanet.BusinessLogic.Service;
using System.Threading.Tasks;

namespace Novanet.API.Controllers
{
    [Route("api/Novanet/[controller]")]
    [ApiController]
    public class ClientesPrecalificadosController : Controller
    {

        private readonly AppService _appService;

        public ClientesPrecalificadosController(AppService appService)
        {
            _appService = appService;
        }

        [HttpGet("DNIPrecalificado")]
        public IActionResult EmailTokenPassword(string dni)
        {

            var request =  _appService.DNIPrecalificado(dni);

            return Ok(request);

        }
    }
}
