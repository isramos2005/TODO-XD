﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Novanet.Entities.Entities;

public partial class AspNetRole
{
    public string Id { get; set; }

    public string Name { get; set; }

    public bool Activo { get; set; }

    public virtual ICollection<PrivilegiosPorRol> PrivilegiosPorRols { get; set; } = new List<PrivilegiosPorRol>();

    public virtual ICollection<AspNetUser> Users { get; set; } = new List<AspNetUser>();
}