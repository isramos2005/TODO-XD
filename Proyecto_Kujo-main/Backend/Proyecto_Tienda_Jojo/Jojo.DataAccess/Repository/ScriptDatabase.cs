using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Jojo.DataAccess.Repository
{
    class ScriptDatabase
    {

        #region DLL
        public static string DDL_EstadosCiviles = "gral.UDP_tbEstadosCivilesDDL";
        public static string DDL_Departamentos  = "gral.UDP_tbDepartamentosDDL";
        public static string DDL_Municipios     = "gral.UDP_tbMunicipiosDDL";
        public static string DDL_Proveedores    = "kujo.UDP_tbProveedoresDDL";
        public static string DDL_Categorias     = "kujo.UDP_tbCategoriasDDL";
        public static string DDL_Empleados      = "kujo.UDP_tbEmpleadosDDL";

        #endregion

        #region Login
        public static string UDP_Login = "acce.UDP_tbUsuarios_Login";

        #endregion

        #region Productos
        public static string UDP_tbProducto_INDEX   = "kujo.UDP_tbProducto_INDEX";
        public static string UDP_tbProducto_FIND    = "kujo.UDP_tbProducto_FIND";
        public static string UDP_tbProducto_INSERT  = "kujo.UDP_tbProducto_INSERT";
        public static string UDP_tbProducto_UPDATE  = "kujo.UDP_tbProducto_UPDATE";
        public static string UDP_tbProducto_DELETE  = "kujo.UDP_tbProducto_DELETE";
        #endregion

        #region Clientes

        public static string UDP_tbClientes_INDEX   = "kujo.UDP_tbClientes_INDEX";
        public static string UDP_tbClientes_FIND    = "kujo.UDP_tbClientes_FIND";
        public static string UDP_tbClientes_INSERT  = "kujo.UDP_tbClientes_INSERT";
        public static string UDP_tbClientes_UPDATE  = "kujo.UDP_tbClientes_UPDATE";
        public static string UDP_tbClientes_DELETE  = "kujo.UDP_tbClientes_DELETE";
        #endregion

        #region Facturas
        public static string UDP_tbClientes_DDL    = "kujo.UDP_tbClientes_DDL";
        public static string UDP_tbProductos_DDL   = "kujo.UDP_tbProductos_DDL";
        public static string UDP_tbProductos_PRICE = "kujo.UDP_tbProductos_PRICE";

        public static string UDP_tbFactura_INDEX   = "kujo.UDP_tbFactura_INDEX";
        public static string UDP_tbFacturas_INSERT = "kujo.UDP_tbFacturas_INSERT";
        public static string UDP_tbFactura_FIND    = "kujo.UDP_tbFactura_FIND";
        public static string UDP_tbFacturas_UPDATE = "kujo.UDP_tbFacturas_UPDATE";
        public static string UDP_tbFacturas_DELETE = "kujo.UDP_tbFacturas_DELETE";

        public static string UPD_tbFacturas_Reporte  = "kujo.UPD_tbFacturas_Reporte";
        public static string UPD_tbFacturas_FacturasPorEmpleado = "kujo.UPD_tbFacturas_FacturasPorEmpleado";
        #endregion

        #region Usuarios
        public static string UDP_tbUsuarios_INDEX  = "acce.UDP_tbUsuarios_INDEX";
        public static string UDP_tbUsuarios_FIND   = "acce.UDP_tbUsuarios_FIND";
        public static string UDP_tbUsuarios_Update = "acce.UDP_tbUsuarios_Update";
        public static string UDP_tbUsuarios_Insert = "acce.UDP_tbUsuarios_Insert";
        public static string UDP_tbUsuarios_Delete = "acce.UDP_tbUsuarios_Delete";
        #endregion

        #region PantallasPorRol
        public static string UDP_Menu            = "acce.UDP_tbPantallasPorRol_MENU";
        public static string UDP_tbRoles_INDEX   = "acce.UDP_tbRoles_INDEX";
        public static string UDP_tbRoles_Insert  = "acce.UDP_tbRoles_Insert";
        public static string UDP_tbRoles_Update  = "acce.UDP_tbRoles_Update";
        public static string UDP_tbRoles_Delete  = "acce.UDP_tbRoles_Delete";
        public static string UDP_tbRoles_FIND    = "acce.UDP_tbRoles_FIND";


        public static string UDP_tbPantallasPorRol_Check            = "acce.UDP_tbPantallasPorRol_Check";
        public static string UDP_tbPantallasPorRol_Checked          = "acce.UDP_tbPantallasPorRol_Checked";
        public static string UDP_tbPantallasPorRol_PantallasAgg     = "acce.UDP_tbPantallasPorRol_PantallasAgg";
        public static string UDP_tbPantallasPorRol_PantallasElim    = "acce.UDP_tbPantallasPorRol_PantallasElim";
        #endregion

        #region Facturas Detalles
        public static string UDP_tbDetalles_INDEX             = "kujo.UDP_TbDetalles_Factura";
        public static string UDP_tbFacturasDetalles_INSERT    = "kujo.UDP_tbFacturasDetalles_INSERT";
        public static string UDP_tbFacturasDetalles_UPDATE    = "kujo.UDP_tbFacturasDetalles_UPDATE";
        public static string UDP_tbFacturasDetalles_DELETE    = "kujo.UDP_tbFacturasDetalles_DELETE";
        public static string UDP_tbFacturadetalles_Load       = "kujo.UDP_tbFacturadetalles_Load";

        #endregion

    }
}
