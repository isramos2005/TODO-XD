﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace SistemaTickets.Entities.Entities;

public partial class RequerimientosBitacora
{
    public int FiIdrequerimiento { get; set; }

    public DateTime FdFechaRegistro { get; set; }

    public int FIdiusuario { get; set; }

    public string FiIdipusuarioSolicitante { get; set; }

    public string FcComentario { get; set; }

    public int? FiIdapp { get; set; }

    public string FcToken { get; set; }
}