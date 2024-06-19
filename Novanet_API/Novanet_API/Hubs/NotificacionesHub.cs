using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;
using System;
using Novanet.API.Models;
using System.Collections.Generic;

namespace Novanet.API.Hubs
{
    public class NotificacionesHub : Hub<IMessageHubClient>
    {
        public async Task SendNotificacion(List<string> argument)
        {
            await Clients.All.SendNotificacion(argument);    
        }
    }
}
