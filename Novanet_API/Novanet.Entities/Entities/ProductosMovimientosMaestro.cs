﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Novanet.Entities.Entities;

public partial class ProductosMovimientosMaestro
{
    public int FiIdmovimientoMaestro { get; set; }

    public string FcNumeroFactura { get; set; }

    public string FcReferenciaFactura { get; set; }

    public string FcDescripcionFactura { get; set; }

    public string FcCai { get; set; }

    public int FiIdtipoMovimiento { get; set; }

    public decimal FnImporteGravado { get; set; }

    public decimal FnImporteExento { get; set; }

    public decimal FnImporteExonerado { get; set; }

    public decimal FnSaldo { get; set; }

    public decimal FnIsv { get; set; }

    public decimal FnTotalFactura { get; set; }

    public DateTime FdFechaCreacion { get; set; }

    public int FiIdusuarioCreacion { get; set; }

    public DateTime FdFechaUltimaModificacion { get; set; }

    public int FiIdusuarioUltimaModificacion { get; set; }

    public string FcToken { get; set; }

    public string FcDocumentoFactura { get; set; }

    public string FcDocumentoExtension { get; set; }

    public int? FiEstadoMovimientoMaestro { get; set; }

    public decimal FnValorCuotaMensual { get; set; }

    public decimal? FnValorCuotaCapital { get; set; }

    public decimal? FnValorCuotaInteres { get; set; }

    public decimal? FnTasaAnualPlana { get; set; }

    public DateTime FdFechaFactura { get; set; }

    public int? FiIdmoneda { get; set; }

    public string FcPartida { get; set; }

    public int? FiIdproveedor { get; set; }

    public bool? FbContabilizar { get; set; }

    public virtual CatalogoProveedore FiIdproveedorNavigation { get; set; }
}