using Jojo.BusinessLogic.Services;
using Jojo.DataAccess;
using Jojo.DataAccess.Repository;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Jojo.BusinessLogic
{
    public static class ServiceConfiguration
    {
        public static void DataAccess(this IServiceCollection service, string connectionString)
        {

            service.AddScoped<ClienteRepository>();
            service.AddScoped<FacturaDetalleRepository>();
            service.AddScoped<FacturaRepository>();
            service.AddScoped<ProductoRepository>();
            service.AddScoped<UsuarioRepository>();
            service.AddScoped<PantallaPorRolRepository>();




            JojoTienda_Context.BuildConnectionString(connectionString);
        }

        public static void BusinessLogic(this IServiceCollection service)
        {
            service.AddScoped<KujoService>();
            service.AddScoped<AccessService>();


        }
    }
}
