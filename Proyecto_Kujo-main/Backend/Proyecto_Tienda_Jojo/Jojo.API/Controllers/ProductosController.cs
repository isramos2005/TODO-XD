using AutoMapper;
using Jojo.API.Models;
using Jojo.BusinessLogic.Services;
using Jojo.Entities.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Jojo.API.Controllers
{
    public class ProductosController : Controller
    {

        private readonly KujoService _kujoService;
        private readonly IMapper _mapper;

        public ProductosController(KujoService kujoService, IMapper mapper)
        {
            _kujoService = kujoService;
            _mapper = mapper;
        }

        [HttpGet("api/Productos/Listado")]
        public IActionResult Index()
        {
            var list = _kujoService.ListProductos();
            return Ok(list);
        }

        [HttpPost("api/Productos/Insert")]
        public IActionResult Insert([FromBody] ProductoViewModel prod)
        {
            var item = _mapper.Map<tbProductos>(prod);
            var list = _kujoService.InsertProducto(item);
            return Ok(list);
        }

        [HttpPost("api/Productos/Update")]
        public IActionResult Update([FromBody] ProductoViewModel prod)
        {
            var item = _mapper.Map<tbProductos>(prod);
            var list = _kujoService.UpdateProducto(item);
            return Ok(list);
        }

        [HttpGet("api/Productos/Find")]
        public IActionResult Find(int id)
            {
            var list = _kujoService.FindProducto(id);
            return Ok(list);
        }

        [HttpPost("api/Productos/Delete")]
        public IActionResult Delete([FromBody] ProductoViewModel id)
        {
            var list = _kujoService.DeleteProducto(id.prod_Id);
            return Ok(list);
        }

        [HttpGet("api/Productos/DDL/Proveedores")]
        public IActionResult DDLProveedores()
        {
            var list = _kujoService.DDLProveedores();
            return Ok(list);
        }

        [HttpGet("api/Productos/DDL/Categorias")]
        public IActionResult DDlCategorias()
        {
            var list = _kujoService.DDlCategorias();
            return Ok(list);
        }

    }
}
