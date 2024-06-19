using AutoMapper;
using Jojo.API.Models;
using Jojo.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.API.Extensions
{
    public class MappingProfileExntensions : Profile
    {
        public MappingProfileExntensions()
        {
         
            CreateMap<RolesViewModel, tbRoles>().ReverseMap();
            CreateMap<UsuarioViewModel, tbUsuarios>().ReverseMap();
            CreateMap<PantallaViewModel, tbPantallas>().ReverseMap();
            CreateMap<PantallaPorRolViewModel, tbPantallasPorRol>().ReverseMap();

            CreateMap<ClienteViewModel, tbClientes>().ReverseMap();
            CreateMap<FacturaViewModel, tbFacturas>().ReverseMap();
            CreateMap<ProductoViewModel, tbProductos>().ReverseMap();
            CreateMap<FacturaDetalleViewModel, tbFacturasDetalles>().ReverseMap();

        }

    }
}
