﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Novanet.Entities.Entities;

public partial class MensajeriaMasivaDetalle
{
    public int FiIdmensaje { get; set; }

    public string FcTelefonoDestino { get; set; }

    public string FcMensaje { get; set; }

    public string FcArchivoUrl { get; set; }

    public int FiIdusuarioRemitente { get; set; }

    public DateTime FdFechadeCarga { get; set; }

    public DateTime? FdFechadeEnvio { get; set; }

    public string FcRespuestaWs { get; set; }

    public string FcToken { get; set; }
}