using Novanet.DataAccess.Repository;
using Novanet.Entities.Entities;
using System;
using System.Buffers.Text;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Novanet.DataAccess.Repository.ServicioRepository;

namespace Novanet.BusinessLogic.Service
{
    public class AppService
    {
        private readonly ServicioRepository _servicioRepository;
        private readonly ClientesPrecalificadosRepository _clientesPrecalificadosRepository;


        public AppService(ServicioRepository servicioRepository, ClientesPrecalificadosRepository clientesPrecalificadosRepository)
        {
            _servicioRepository = servicioRepository;
            _clientesPrecalificadosRepository = clientesPrecalificadosRepository;

        }


        public IEnumerable<dynamic> PagosByCliente(int piIDCliente, int piIDSolicitud)
        {
            try
            {
                var list = _servicioRepository.PagosByCliente(piIDCliente, piIDSolicitud);
                return list;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return Enumerable.Empty<dynamic>();
            }
        }

        public IEnumerable<dynamic> Productos_ListaPorCliente(int piIDSolicitud)
        {
            try
            {
                var list = _servicioRepository.Productos_ListaPorCliente(piIDSolicitud);
                return list;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return Enumerable.Empty<dynamic>();
            }
        }


        public IEnumerable<dynamic> ProductosAsolicitud_ListaPorCliente(int piIDSolicitud)
        {
            try
            {
                var list = _servicioRepository.ProductosAsolicitud_ListaPorCliente(piIDSolicitud);
                return list;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return Enumerable.Empty<dynamic>();
            }
        }

        public IEnumerable<dynamic> Solicitudes_AdicionProducto_Listado(int piIDSolicitud)
        {
            try
            {
                var list = _servicioRepository.Solicitudes_AdicionProducto_Listado(piIDSolicitud);
                return list;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return Enumerable.Empty<dynamic>();
            }
        }

        public IEnumerable<dynamic> Solicitudes_AdicionProducto_Detalles(int piIDAdicionProduto)
        {
            try
            {
                var list = _servicioRepository.Solicitudes_AdicionProducto_Detalles(piIDAdicionProduto);
                return list;
            }
            catch (Exception e)
            {
                Console.Write(e);
                return Enumerable.Empty<dynamic>();
            }
        }

        public ServiceResult SolicitudesAdicionProducto_Insertar(int fiIDSolicitud, string jsonDetalles)
        {
            var result = new ServiceResult();

            try
            {
                var map = _servicioRepository.SolicitudesAdicionProducto_Insertar(fiIDSolicitud, jsonDetalles);

                if (map.CodeStatus == 200)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Success);
                }
                else if (map.CodeStatus == 409)
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Conflict);
                }
                else
                {
                    return result.SetMessage(map.MessageStatus, ServiceResultType.Error);
                }
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }
        }






        public IEnumerable<EquifaxCliente> DNIPrecalificado(string dni)
        {
            try
            {
                var cliente = _clientesPrecalificadosRepository.DNIPrecalificado(dni);
                return cliente;
            }
            catch (Exception e)
            {
                Console.Write(e);
                  return Enumerable.Empty<EquifaxCliente>();
            }
        }


    }
}
