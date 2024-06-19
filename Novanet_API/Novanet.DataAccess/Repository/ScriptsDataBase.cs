using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Novanet.DataAccess.Repository
{
    public class ScriptsDataBase
    {
        public static string sp_ValidarPrimerInicio                 = "sp_ClientesMovil_ValidarPrimerInicio";

        #region Clientes Precalificados
        public static string Precalificado_DNI                      = "sp_Precalificado_Bandeja_Agentes";
        #endregion

       #region Usuarios
        public static string sp_LoginAppMovil                       = "sp_LoginAppMovilID";
        public static string BuscarCorreoAppMovil                   = "sp_BuscarCorreoAppMovil";
        public static string ActualizarDatosPerfilAppMovil          = "sp_ActualizarDatosPerfilAppMovil";
        public static string ActualizarImagenPerfilAppMovil         = "sp_ActualizarImagenPerfilAppMovil";
        public static string RegistroUsuarioPrincipal               = "sp_RegistroUsuarioPrincipalAppMovil";
        public static string RegistroUsuarioFamiliar                = "sp_RegistroUsuarioFamiliarAppMovil";
        public static string CambiodeContraAppMovil                 = "sp_CambiodeContraAppMovil";
   
        public static string sp_ClienteListar                       = "sp_OrionSolicitud_Detalle_ClienteListar";
        public static string ClientesReferidos_Insertar             = "sp_ClientesReferidosCreditos_Insertar";
        #endregion

        #region Servicios
        public static string sp_InformacionBasica                   = "sp_ClientesMovil_InformacionBasica";
        public static string sp_InformacionRegistrar                = "sp_ClientesMovil_Registrar";
        public static string PagosByCliente                         = "sp_ClientesMovil_EstadodeCuenta";
        public static string Productos_ListaPorCliente              = "sp_Productos_ListaPorCliente";
        public static string ProductosAsolicitud_ListaPorCliente    = "sp_ProductosAsolicitud_ListaPorCliente";
        public static string Solicitudes_AdicionProducto_Listado    = "sp_Solicitudes_AdicionProducto_AppMovil";
        public static string Solicitudes_AdicionProducto_Detalles   = "sp_Solicitudes_AdicionProducto_Detalles";
        public static string SolicitudesAdicionProducto_Insertar    = "sp_SolicitudesAdicionProducto_Insertar_AppMovil";
        #endregion





    }
}
    