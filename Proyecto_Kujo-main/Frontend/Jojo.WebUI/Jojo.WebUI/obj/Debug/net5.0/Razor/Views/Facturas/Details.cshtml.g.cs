#pragma checksum "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "867bdedb303cca4679a892fe4808ec6068dced8204e36cd78432c82370197cd0"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Facturas_Details), @"mvc.1.0.view", @"/Views/Facturas/Details.cshtml")]
namespace AspNetCore
{
    #line hidden
    using global::System;
    using global::System.Collections.Generic;
    using global::System.Linq;
    using global::System.Threading.Tasks;
    using global::Microsoft.AspNetCore.Mvc;
    using global::Microsoft.AspNetCore.Mvc.Rendering;
    using global::Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\_ViewImports.cshtml"
using Jojo.WebUI;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\_ViewImports.cshtml"
using Jojo.WebUI.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"Sha256", @"867bdedb303cca4679a892fe4808ec6068dced8204e36cd78432c82370197cd0", @"/Views/Facturas/Details.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"Sha256", @"1ea3002d409879bc2a17bff477e27f1591d5468d3d962447ebd912f68daea4ad", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_Facturas_Details : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<Jojo.WebUI.Models.FacturaViewModel>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("btn btn-info"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Index", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\n");
#nullable restore
#line 3 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
  
    ViewData["Title"] = "Details";
    Layout = "~/Views/Shared/_Layout.cshtml";

#line default
#line hidden
#nullable disable
            WriteLiteral("\n<h1>Detalles</h1>\n<div>\n\n    <div class=\"row\">\n        <div class=\"col-sm-3\">\n            <label class=\"font-weight-bold\">Id</label><br />\n            ");
#nullable restore
#line 14 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
       Write(Html.DisplayFor(model => model.fact_Id));

#line default
#line hidden
#nullable disable
            WriteLiteral("\n        </div>\n        <div class=\"col-sm-3\">\n            <label class=\"font-weight-bold\">Cliente</label><br />\n            <label>");
#nullable restore
#line 18 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
              Write(Html.DisplayFor(model => model.NombreCliente));

#line default
#line hidden
#nullable disable
            WriteLiteral("</label>\n        </div>\n        <div class=\"col-sm-3\">\n            <label class=\"font-weight-bold\">Empleado</label><br />\n            <label>");
#nullable restore
#line 22 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
              Write(Html.DisplayFor(model => model.NombreEmpleado));

#line default
#line hidden
#nullable disable
            WriteLiteral("</label>\n        </div>\n        <div class=\"col-sm-3\">\n            <br />\n            <label class=\"font-weight-bold\">Fecha Compra</label><br />\n            ");
#nullable restore
#line 27 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
       Write(Html.DisplayFor(model => model.fact_fechacompra));

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
        </div>
    </div>
</div>

<div class=""mt-5"">
    <table class=""table"" id=""DataTable"">
        <thead class=""bg-dark"">
            <tr>
                <th class=""text-light text-center"">
                    Id
                </th>
                <th class=""text-light text-center"">
                    Producto
                </th>
                <th class=""text-light text-center"">
                    Precio
                </th>
                <th class=""text-light text-center"">
                    Cantidad
                </th>
            </tr>
        </thead>
        <tbody id=""tbodyVentas"">
");
#nullable restore
#line 51 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
             foreach (var item in ViewBag.Detalles)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <tr>\n                    <td>\n                        ");
#nullable restore
#line 55 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
                   Write(item.facd_Id);

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                    </td>\n                    <td>\n                        ");
#nullable restore
#line 58 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
                   Write(item.prod_Descripcion);

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                    </td>\n                    <td>\n                        ");
#nullable restore
#line 61 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
                   Write(item.facd_PrecioUnitario);

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                    </td>\n                    <td>\n                        ");
#nullable restore
#line 64 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
                   Write(item.prod_Cantidad);

#line default
#line hidden
#nullable disable
            WriteLiteral("\n                    </td>\n                </tr>\n");
#nullable restore
#line 67 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("\n        </tbody>\n    </table>\n\n    <div class=\"row mt-2\">\n        <div class=\"col-sm-4\">\n            <label>SubTotal</label>\n            <input class=\"form-control border-dark\" type=\"text\" id=\"txtSubTotal\"");
            BeginWriteAttribute("value", " value=\"", 2221, "\"", 2246, 1);
#nullable restore
#line 75 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
WriteAttributeValue("", 2229, ViewBag.Subtotal, 2229, 17, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" disabled />\n        </div>\n        <div class=\"col-sm-4\">\n            <label>IVA</label>\n            <input class=\"form-control border-dark\" type=\"text\" id=\"txtIVA\"");
            BeginWriteAttribute("value", " value=\"", 2412, "\"", 2432, 1);
#nullable restore
#line 79 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
WriteAttributeValue("", 2420, ViewBag.IVA, 2420, 12, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" disabled />\n        </div>\n        <div class=\"col-sm-4\">\n            <label>Total</label>\n            <input class=\"form-control border-dark\" type=\"text\" id=\"txtTotal\"");
            BeginWriteAttribute("value", " value=\"", 2602, "\"", 2624, 1);
#nullable restore
#line 83 "C:\Users\JSaucedaR\Desktop\Proyecto_Kujo-main\Frontend\Jojo.WebUI\Jojo.WebUI\Views\Facturas\Details.cshtml"
WriteAttributeValue("", 2610, ViewBag.Total, 2610, 14, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" disabled />\n        </div>\n    </div>\n</div>\n\n<div>\n    <br />\n    ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "867bdedb303cca4679a892fe4808ec6068dced8204e36cd78432c82370197cd010493", async() => {
                WriteLiteral("Regresar");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_1.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"
</div>

<script src=""https://code.jquery.com/jquery-3.5.1.js""></script>
<script>
    $(document).ready(function () {
        $('#DataTable').dataTable({
            ""language"": {
                ""url"": ""https://cdn.datatables.net/plug-ins/1.13.2/i18n/es-ES.json""
            },

        });
    });
</script>
");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<Jojo.WebUI.Models.FacturaViewModel> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
