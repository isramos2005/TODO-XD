﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Novanet.Entities.Entities;

public partial class PaquetesMaestro
{
    public int FiIdpaquete { get; set; }

    public string FcPaquete { get; set; }

    public decimal FnValorMensual { get; set; }

    public decimal FnTasadeInteresAnual { get; set; }

    public int FiIdusuarioCreador { get; set; }

    public DateTime FdFechaCreacion { get; set; }

    public int FiIdusuarioUltimaModificacion { get; set; }

    public DateTime FdFechaUltimaModificacion { get; set; }

    public string FcToken { get; set; }

    public int? FiEstadoPaquete { get; set; }
}