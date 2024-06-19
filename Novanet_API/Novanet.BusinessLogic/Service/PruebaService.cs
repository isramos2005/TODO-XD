using Novanet.DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Novanet.DataAccess.Repository.LoginRepository;

namespace Novanet.BusinessLogic.Service
{
    public class PruebaService
    {

        private readonly PruebaRepository _pruebaRepository;


        public PruebaService(PruebaRepository pruebaRepository)
        {
            _pruebaRepository = pruebaRepository;
        }


        public IEnumerable<dynamic> List(int pilDUsuario, int pilDSolicitud)
        {
            try
            {
                var list = _pruebaRepository.List(pilDUsuario, pilDSolicitud );
                return list;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return Enumerable.Empty<dynamic>();
            }
        }

       


    }
}
