using System;

namespace Novanet.API.Models
{
    public class UsuariosViewModel
    {
        public string pcIdentidadCliente { get; set; }

        public string pcUsuarioAcceso { get; set; }

        public int FiIdusuario { get; set; }

        public string FcPrimerNombre { get; set; }

        public string FcSegundoNombre { get; set; }

        public string FcPrimerApellido { get; set; }

        public string FcSegundoApellido { get; set; }

        public string FcNombreCorto { get; set; }

        public string FcCentrodeCosto { get; set; }

        public short FiIdpuesto { get; set; }

        public byte FiTipoUsuario { get; set; }

        public byte FiIddepartamento { get; set; }

        public int FiIdjefeInmediato { get; set; }

        public string FcUsuarioDominio { get; set; }

        public byte FiIddominioRed { get; set; }

        public string FcPassword { get; set; }

        public string FcPasswordToken { get; set; }

        public DateTime? FdFechaUltimoCambiodePassword { get; set; }

        public string FcBuzondeCorreo { get; set; }

        public byte FiIddominioCorreo { get; set; }

        public string FcDireccionFisica { get; set; }

        public string FcDocumentoIdentificacion { get; set; }

        public DateTime FdFechaAlta { get; set; }

        public int FiIdusuarioSolicitante { get; set; }

        public int FiIdusuarioCreador { get; set; }

        public int FiEstado { get; set; }

        public DateTime? FdFechaBaja { get; set; }

        public string FcTelefonoMovil { get; set; }

        public string FcToken { get; set; }

        public string FcIdAspnetUser { get; set; }

        public string FcUrlImage { get; set; }

        public int? FiIdempresa { get; set; }

    }
}
