﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Novanet.Entities.Entities;

public partial class OrionSolicitudDeclinada
{
    public int FiIddeclinada { get; set; }

    public int FiIdsolicitud { get; set; }

    public int FiIdusuarioSolicitante { get; set; }

    public DateTime FdFechaSolicitante { get; set; }

    public string FcComentarioSolicitante { get; set; }

    public int FiIdrazonSolicitante { get; set; }

    public int? FiIdusuarioResolucion { get; set; }

    public DateTime? FdFechaResolucion { get; set; }

    public string FcComentarioResolucion { get; set; }

    public int FiIdestatusResolucion { get; set; }
}