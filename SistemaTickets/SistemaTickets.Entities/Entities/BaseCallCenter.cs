﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace SistemaTickets.Entities.Entities;

public partial class BaseCallCenter
{
    public string Identidad { get; set; }

    public string PrimerNombre { get; set; }

    public string SegundoNombre { get; set; }

    public string PrimerApp { get; set; }

    public string SegundoApp { get; set; }

    public decimal? CapacidadDePagoSemanal { get; set; }

    public decimal? CapacidadDisponible { get; set; }

    public decimal? MontoUtilizado { get; set; }
}