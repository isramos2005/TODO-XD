using JafetGomez_PruebaTecnica.Datos;
using JafetGomez_PruebaTecnica.Models;
using JafetGomez_PruebaTecnica.Models.Producto;
using Microsoft.AspNetCore.Mvc;


namespace JafetGomez_PruebaTecnica.Controllers
{
    public class ProductoController : Controller
    {

        ProductoDatos _ProductoDatos = new ProductoDatos();
        TipoProductoDatos _TipoProductoDatos = new TipoProductoDatos();
        public IActionResult Index()
        {
            var Listado = _ProductoDatos.Listar();
            return View(Listado);
        }
            
        public JsonResult Select_ProdTip()
        {
            var Listado = _TipoProductoDatos.Listar();
            
            return Json(Listado);
        }

        public JsonResult Insert(ProductosViewModel modelo)
        {
            var confirmacion = "";
            if (ModelState.IsValid)
            {
                confirmacion = "Error";
            }
            else
            {
                var respuesta = _ProductoDatos.Guardar(modelo);
                if (respuesta)
                {
                    confirmacion = "succes";
                }
                else
                {
                    confirmacion = "Error";
                }
            }
            return Json(confirmacion);

        }

        public JsonResult Update(int prod_Id)
        {
            try
            {
                var oproducto = _ProductoDatos.Listar();
                var list = oproducto.FirstOrDefault(a => a.prod_Id == prod_Id);
                if (list == null)
                {
                    return Json("Error");
                }
                else
                {
                    return Json(list);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString()); 
                throw;
            }
        }

        public JsonResult Update_Producto(ProductosModel model)
        {
            try
            {
                var respuesta = _ProductoDatos.Editar(model);
                return Json(respuesta);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
                throw;
            }
        }

        public JsonResult Delete(int prod_Id)
        {
            var respuesta = _ProductoDatos.Eliminar(prod_Id);
            if (respuesta)
            {
                return Json("Eliminado");
            }
            else
            {
                return Json("Error");
            }


        }

    }
}
