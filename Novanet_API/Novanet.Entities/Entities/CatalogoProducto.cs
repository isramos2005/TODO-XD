﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Novanet.Entities.Entities;

public partial class CatalogoProducto
{
    public int FiIdgrupoProducto { get; set; }

    public int FiIdproducto { get; set; }

    public string FcProducto { get; set; }

    public decimal FnValordeContado { get; set; }

    public decimal FnValorPaquete1 { get; set; }

    public decimal FnValorPaquete2 { get; set; }

    public decimal FnValorPaquete3 { get; set; }

    public decimal FnValorPaquete4 { get; set; }

    public decimal FnValorPaquete5 { get; set; }

    public byte FiMonedaPaquete1 { get; set; }

    public byte FiMonedaPaquete2 { get; set; }

    public byte FiMonedaPaquete3 { get; set; }

    public byte FiMonedaPaquete4 { get; set; }

    public byte FiMonedaPaquete5 { get; set; }

    public byte FiPagaIsv { get; set; }

    public decimal FnTasadeInteres { get; set; }

    public byte FiRequierePrima { get; set; }

    public decimal FnPorcentajePrimaMinima { get; set; }

    public byte FiRequiereGarantia { get; set; }

    public string FcTipoDeGarantia { get; set; }

    public byte FiRequiereOrigen { get; set; }

    public byte FiRequiereGps { get; set; }

    public decimal FnMontoFinanciarMinimo { get; set; }

    public decimal FnMontoFinanciarMaximo { get; set; }

    public int FiIdtipoDePlazo { get; set; }

    public int FiPlazoMinimo { get; set; }

    public int FiPlazoMaximo { get; set; }

    public int FiCantidadReferenciasMinimas { get; set; }

    public string FcNombreGenerico { get; set; }
}