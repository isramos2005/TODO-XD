﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace Jafouan.Entities.Entities
{
    public partial class tbProveedores
    {
        public tbProveedores()
        {
            tbFardosProveedor = new HashSet<tbFardosProveedor>();
        }

        public int prov_Id { get; set; }
        public string prov_Nombres { get; set; }
        public string prov_ApellIdos { get; set; }
        public string prov_Telefeno { get; set; }
        public string muni_Id { get; set; }
        public string prov_Direccion { get; set; }
        public bool? prov_Estado { get; set; }
        public int prov_UserCrea { get; set; }
        public DateTime prov_FechaCreacion { get; set; }
        public int? prov_UserModifica { get; set; }
        public DateTime? prov_FechaModificacion { get; set; }

        public virtual tbMunicipios muni { get; set; }
        public virtual tbUsuarios prov_UserCreaNavigation { get; set; }
        public virtual tbUsuarios prov_UserModificaNavigation { get; set; }
        public virtual ICollection<tbFardosProveedor> tbFardosProveedor { get; set; }
    }
}