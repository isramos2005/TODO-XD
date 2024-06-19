using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using Novanet.API.Hubs;
using Novanet.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Novanet.API.Controllers
{

    [Route("api/Novanet/[controller]")]
    [ApiController]
    public class SignalRController : ControllerBase
    {


         
        private readonly IMapper _mapper;
        private readonly IHubContext<NotificacionesHub> _hubContext;
        public SignalRController(IHubContext<NotificacionesHub> hubContext)
        {
            _hubContext = hubContext;
        }


        [HttpPost("EnviarNotificacion")]
        public async Task<string> EnviarNotificacion(NotificacionViewModel argument)
        {
            List<object> notificacion = new List<object>();
            string message = argument.message;
            var users = argument.users;

            notificacion.Add(message);
            notificacion.Add(users);

            await _hubContext.Clients.All.SendAsync("SendNotificacion", notificacion);

            return "Notificación enviada exitosamente";
        }

    }
}
