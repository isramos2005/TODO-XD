﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace SistemaTickets.Entities.Entities;

public partial class RequerimientosAdjunto
{
    public int FiIdrequerimiento { get; set; }

    public int FiIdunicoAdjunto { get; set; }

    public DateTime FdFechaRegistro { get; set; }

    public int FIdiusuario { get; set; }

    public string FiIdipusuarioSolicitante { get; set; }

    public string FcDescripcionAdjunto { get; set; }

    public string FcNombreArchivo { get; set; }

    public string FcTipoArchivo { get; set; }

    public string FcArchivoAdjunto { get; set; }

    public string FcRutaArchivo { get; set; }

    public string FcUrl { get; set; }

    public string FcToken { get; set; }
}