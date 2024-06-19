using Novanet.API.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Novanet.API.Hubs
{
    public interface IMessageHubClient
    {
        Task SendNotificacion(List<string> argument);
    }
}
