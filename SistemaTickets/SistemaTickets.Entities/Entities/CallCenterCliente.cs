﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace SistemaTickets.Entities.Entities;

public partial class CallCenterCliente
{
    public string FcIdentidad { get; set; }

    public string FcPrimerNombre { get; set; }

    public string FcSegundoNombre { get; set; }

    public string FcPrimerApellido { get; set; }

    public string FcSegundoApellido { get; set; }

    public double? FnOferta { get; set; }

    public string FcTelefono { get; set; }

    public string FcDireccion1 { get; set; }

    public string FcDireccion2 { get; set; }

    public string FcUsuario { get; set; }

    public int? FiEstado { get; set; }

    public DateTime? FdFechaUltimaGestion { get; set; }

    public short? FiBaseAnterior { get; set; }

    public short? FiBloqueo { get; set; }

    public short? FiUltimoScore { get; set; }

    public DateTime? FdFechaScoreEquifax { get; set; }

    public double? FnObligaciones { get; set; }
}