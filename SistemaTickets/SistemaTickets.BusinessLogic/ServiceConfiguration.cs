using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaTickets.BusinessLogic
{
    public static class ServiceConfiguration
    {
        public static void DataAccess(this IServiceCollection service, string connectionString)
        {
           // service.AddScoped<CategoriaRepository>();
     
            //AndreasContext.BuildConnectionString(connectionString);
        }

        public static void BusinessLogic(this IServiceCollection service)
        {
            //service.AddScoped<MaquService>();
            
        }
    }
}
