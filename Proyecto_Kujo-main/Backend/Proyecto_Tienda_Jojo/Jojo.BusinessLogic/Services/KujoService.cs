using Jojo.DataAccess.Repository;
using Jojo.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Jojo.BusinessLogic.Services
{
    public class KujoService
    {
        private readonly ProductoRepository _productoRepository;
        private readonly ClienteRepository _clienteRepository;
        private readonly FacturaRepository _facturaRepository;
        private readonly FacturaDetalleRepository _facturaDetalleRepository;

        public KujoService
        (
            ProductoRepository productoRepository,
            ClienteRepository clienteRepository,
            FacturaRepository facturaRepository,
            FacturaDetalleRepository facturaDetalleRepository
        )
        {
            _productoRepository = productoRepository;
            _clienteRepository = clienteRepository;
            _facturaRepository = facturaRepository;
            _facturaDetalleRepository = facturaDetalleRepository;
        }

        #region Productos
        public IEnumerable<tbProductos> ListProductos()
        {
            var result = new ServiceResult();

            try
            {
                var list = _productoRepository.List();
                return ((IEnumerable<tbProductos>)list);
            }
            catch (Exception ex)
            {

                return (IEnumerable<tbProductos>)result.Error(ex.Message);
            }

        }

        public ServiceResult FindProducto(int id)
        {
            var result = new ServiceResult();

            try
            {
                var list = _productoRepository.Find(id);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult DeleteProducto(int id)
        {
            var result = new ServiceResult();

            try
            {
                var list = _productoRepository.Delete(id);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult InsertProducto(tbProductos item)
        {
            var result = new ServiceResult();

            try
            {
                var list = _productoRepository.Insert(item);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult UpdateProducto(tbProductos item)
        {
            var result = new ServiceResult();

            try
            {
                var list = _productoRepository.Update(item);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult DDLProveedores()
        {
            var result = new ServiceResult();
            var list = _productoRepository.DDLProveedores();
            return result.Ok(list);


        }

        public ServiceResult DDlCategorias()
        {
            var result = new ServiceResult();
            var list = _productoRepository.DDlCategorias();
            return result.Ok(list);



        }
        #endregion

        #region Clientes
        public IEnumerable<tbClientes> ListClientes()
        {
            var result = new ServiceResult();

            try
            {
                var list = _clienteRepository.List();
                return ((IEnumerable<tbClientes>)list);
            }
            catch (Exception ex)
            {

                return (IEnumerable<tbClientes>)result.Error(ex.Message);
            }

        }

        public ServiceResult FindCliente(int id)
        {
            var result = new ServiceResult();

            try
            {
                var list = _clienteRepository.Find(id);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult DeleteCliente(int id)
        {
            var result = new ServiceResult();

            try
            {
                var list = _clienteRepository.Delete(id);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult InsertCliente(tbClientes item)
        {
            var result = new ServiceResult();

            try
            {
                var list = _clienteRepository.Insert(item);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult UpdateCliente(tbClientes item)
        {
            var result = new ServiceResult();

            try
            {
                var list = _clienteRepository.Update(item);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult DDLDepartamentos()
        {
            var result = new ServiceResult();
            var list = _clienteRepository.DDLDepartamentos();
            return result.Ok(list);


        }

        public ServiceResult DDlMunicipios(string dept)
        {
            var result = new ServiceResult();
            var list = _clienteRepository.DDLMunicipios(dept);
            return result.Ok(list);
        }

        public ServiceResult DDlEstadosCiviles()
        {
            var result = new ServiceResult();
            var list = _clienteRepository.DDLEstadosCiviles();
            return result.Ok(list);
        }
        #endregion

        #region Facturas

        public IEnumerable<tbFacturas> ListFacturas()
        {
            var result = new ServiceResult();

            try
            {
                var list = _facturaRepository.List();
                return ((IEnumerable<tbFacturas>)list);
            }
            catch (Exception ex)
            {

                return (IEnumerable<tbFacturas>)result.Error(ex.Message);
            }

        }

        public IEnumerable<tbFacturas> Grafica()
        {
            var result = new ServiceResult();

            try
            {
                var list = _facturaRepository.Grafica();
                return ((IEnumerable<tbFacturas>)list);
            }
            catch (Exception ex)
            {

                return (IEnumerable<tbFacturas>)result.Error(ex.Message);
            }

        }

        public IEnumerable<tbFacturas> Reporte()
        {
            var result = new ServiceResult();

            try
            {
                var list = _facturaRepository.Reporte();
                return ((IEnumerable<tbFacturas>)list);
            }
            catch (Exception ex)
            {

                return (IEnumerable<tbFacturas>)result.Error(ex.Message);
            }

        }

        public ServiceResult FindFactura(int id)
        {
            var result = new ServiceResult();

            try
            {
                var list = _facturaRepository.Find(id);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult DeleteDetalle(int id)
        {
            var result = new ServiceResult();

            try
            {
                var list = _facturaRepository.Delete(id);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public ServiceResult InsertFactura(tbFacturas item)
        {
            var result = new ServiceResult();
            try
            {
                 
                var list = _facturaRepository.Insert(item);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }

        public IEnumerable<tbFacturasDetalles> ListFacturasDetalles(int id)
        {
            var result = new ServiceResult();

            try
            {
                var list = _facturaDetalleRepository.List(id);
                return ((IEnumerable<tbFacturasDetalles>)list);
            }
            catch (Exception ex)
            {

                return (IEnumerable<tbFacturasDetalles>)result.Error(ex.Message);
            }

        }

        public ServiceResult FacturaDetalles(int id)
        {
            var result = new ServiceResult();

            try
            {
                var detalle = _facturaDetalleRepository.Detalle(id);
                return result.Ok(detalle);
            }
            catch (Exception ex)
            {

                return result.Error(ex.Message);
            }

        }

        public ServiceResult InsertFacturaDetalle(tbFacturasDetalles item)
        {
            var result = new ServiceResult();
            try
            {

                var list = _facturaDetalleRepository.Insert(item);
                return result.Ok(list);
            }
            catch (Exception ex)
            {
                return result.Error(ex.Message);
            }

        }
        #endregion

    }
}
