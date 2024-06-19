﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace SistemaTickets.Entities.Entities;

public partial class SrcCliente
{
    public string FcIdcliente { get; set; }

    public string FcCentrodeCosto { get; set; }

    public string FcIdentidad { get; set; }

    public string FcNombreSaf { get; set; }

    public string FcDireccion { get; set; }

    public string FcColonia { get; set; }

    public string FcCiudad { get; set; }

    public string FcTelefonos { get; set; }

    public short FiDiasAtraso { get; set; }

    public short FiCuotasAtraso { get; set; }

    public byte FiCuotasPagadas { get; set; }

    public byte FiCuotasPendientes { get; set; }

    public decimal FnValorCuota { get; set; }

    public decimal FnCapitalOtorgado { get; set; }

    public decimal FnSaldoActual { get; set; }

    public decimal FnCapitalVencido { get; set; }

    public decimal FnInteresesVencidos { get; set; }

    public decimal FnRecargos { get; set; }

    public decimal FnSaldoPonerAlDia { get; set; }

    public decimal FnTotalCuenta { get; set; }

    public DateTime FdUltimoAbono { get; set; }

    public string FcTransaccionUltimoAbono { get; set; }

    public string FcOficial { get; set; }

    public string FcGestorCobros { get; set; }

    public DateTime? FdUltimaGestion { get; set; }
}