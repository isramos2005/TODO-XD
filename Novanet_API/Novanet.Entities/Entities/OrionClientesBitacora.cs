﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Novanet.Entities.Entities;

public partial class OrionClientesBitacora
{
    public string FcIdcliente { get; set; }

    public int FiIdusuario { get; set; }

    public string FcBitacora { get; set; }

    public byte FiIdgestion { get; set; }

    public DateTime FdGestion { get; set; }

    public string FcTelefono { get; set; }

    public DateTime? FdFechaVolveraLlamar { get; set; }

    public byte FiOrigenGestion { get; set; }

    public byte FiUbicacionGestion { get; set; }

    public string FcLatitud { get; set; }

    public string FcLongitud { get; set; }

    public byte FiTelefonoContesta { get; set; }

    public byte? FiSmsenviado { get; set; }

    public byte? FiWhatsAppEnviado { get; set; }

    public int FiIdsolicitud { get; set; }
}