﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace Jojo.Entities.Entities
{
    public partial class tbDepartamentos
    {
        public tbDepartamentos()
        {
            tbMunicipios = new HashSet<tbMunicipios>();
        }

        public string dept_Id { get; set; }
        public string dept_Descripcion { get; set; }
        public bool? dept_Estado { get; set; }
        public int dept_UserCrea { get; set; }
        public DateTime? dept_FechaCrea { get; set; }
        public int? dept_UserModifica { get; set; }
        public DateTime? dept_FechaModifica { get; set; }

        public virtual tbUsuarios dept_UserCreaNavigation { get; set; }
        public virtual tbUsuarios dept_UserModificaNavigation { get; set; }
        public virtual ICollection<tbMunicipios> tbMunicipios { get; set; }
    }
}