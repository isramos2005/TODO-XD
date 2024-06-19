using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Novanet.BusinessLogic.Service;
using Novanet.DataAccess;
using Novanet.DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Novanet.BusinessLogic
{
    public static class ServiceConfiguration
    {
        public static void DataAcces(this IServiceCollection service, string connectionString)
        {
            service.AddScoped<LoginRepository>();
            service.AddScoped<PruebaRepository>();
            service.AddScoped<ServicioRepository>();
            service.AddScoped<UsuarioRepository>();
            service.AddScoped<ClientesPrecalificadosRepository>();





            Novanet_Context.BuildConnectionString(connectionString);
        }

        public static void BussinessLogic(this IServiceCollection service)
        {
            service.AddScoped<AccessService>();
            service.AddScoped<AppService>();
            service.AddScoped<PruebaService>();
            service.AddScoped<OrionService>();



        }
    }


}
