using AutoMapper;
using Novanet.API.Models;
using Novanet.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace Novanet.Extensions
{
    public class MappingProfileExntensions : Profile
    {
        public MappingProfileExntensions()
        {
            CreateMap<UsuariosViewModel, UsuariosMaestro>().ReverseMap();


        }

    }
}
