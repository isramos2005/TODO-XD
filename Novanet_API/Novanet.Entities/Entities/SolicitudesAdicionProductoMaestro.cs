﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Novanet.Entities.Entities;

public partial class SolicitudesAdicionProductoMaestro
{
    public int FiIdadicionProduto { get; set; }

    public int FiIdsolicitud { get; set; }

    public DateTime? FdFechadeCreacion { get; set; }

    public DateTime? FdFechadeSolicitud { get; set; }

    public virtual OrionSolicitudMaestro FiIdsolicitudNavigation { get; set; }

    public virtual ICollection<SolicitudesAdicionProductoDetalle> SolicitudesAdicionProductoDetalles { get; set; } = new List<SolicitudesAdicionProductoDetalle>();
}