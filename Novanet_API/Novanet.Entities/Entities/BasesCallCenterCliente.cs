﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Novanet.Entities.Entities;

public partial class BasesCallCenterCliente
{
    public int FiIdcliente { get; set; }

    public string FcIdentidad { get; set; }

    public string FcNombreCliente { get; set; }

    public string FcTelefonoContacto { get; set; }

    public string FcTelefonosAdicionales { get; set; }

    public string FcCiudad { get; set; }

    public int FiIdultimaGestion { get; set; }

    public string FcComentarioGestion { get; set; }

    public byte FiIdestadoCliente { get; set; }

    public DateTime? FdFechaUltimaGestion { get; set; }

    public int FiIdagenteAsignado { get; set; }

    public string FcToken { get; set; }
}