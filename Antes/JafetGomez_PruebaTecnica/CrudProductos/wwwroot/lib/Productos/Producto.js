function cerrarmodal() {
    $(`#exampleModal`).modal(`hide`);
    //$(`#modalbody`).modal();
    $(`#modalcambiable`).remove();
}
function modalguardar() {
    $(`#modalcambiable`).remove();
    $(`#exampleModalLabel`).text(`Guardar Producto`);
    body = `
            <div id="modalcambiable">
                    <div class="mb-3">
                        <label class="form-label">Codigo</label>
                        <input id="txtcodigo" type="text" class="form-control" />
                        <span id="spacodigo" class="text-danger"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Nombre</label>
                        <input id="txtnombre" type="text" class="form-control"/>
                        <span id="spanombre" class="text-danger"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tipo Producto</label>
                        <select id="selecttipoprodu" class="form-control"> 
                        </select>
                        <span  id="spatipoprodu" class="text-danger"></span>
                    </div>
                    <div class="modal-footer">
                        <button onclick="cerrarmodal()" type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button onclick="guardar()" type="button" class="btn btn-primary">Guardar</button>
                   </div>
             </div>`;
    $.ajax({
        url: "/Producto/Select_ProdTip",
        type: "post",
        success: function (datas) {
            console.log(datas);

            var option = `<option class="text-center" value="0">Seleccione una opción</option>`;
            datas.forEach(function (data) {
                option += `<option value="${data.pdTi_Id}">${data.pdTi_Codigo}-${data.pdTi_Nombre}</option>`;

            });
            $('#selecttipoprodu').append(option);
        },
        error: function (datae) {
            console.log(`Entro al error`);
            console.log(datae);
        }
    });

    $(`#modalbody`).append(body);
    $(`#exampleModal`).modal(`show`);
}
function guardar() {
    var nombre = $('#txtnombre').val();
    var codigo = $('#txtcodigo').val();
    var tipoprodu = $('#selecttipoprodu').val();

    console.log(tipoprodu);

    if (nombre == "" || codigo == "" || tipoprodu == "") {
        if (nombre == "") {
            $('#spanombre').text('El campo Nombre es requerido');
        } else {
            $('#spanombre').text('');
        }
        if (codigo == "") {
            $('#spacodigo').text('El campo Código es requerido');
        } else {
            $('#spacodigo').text('');
        }
        if (tipoprodu == "") {
            $('#spatipoprodu').text('El campo Tipo Producto es requerido');
        } else {
            $('#spatipoprodu').text('');
        }
    } else {
        $('#spanombre').text('');
        $('#spacodigo').text('');
        $('#spatipoprodu').text('');
        var model = {
            prod_Id: 0, // El controlador asignará un valor al ID
            prod_Codigo: codigo,
            prod_Nombre: nombre,
            PdTi_Id: tipoprodu,
            prod_Estado: true
        };
        console.log(model);
        $.ajax({
            url: "/Producto/Insert",
            type: "post",
            data: { modelo: model },
            complete: function (datac) {
            },
            success: function (datas) {
                //console.log(`Esto trae la data Success = "${datas}"`);
                $('#exampleModal').modal('hide');
                location.href = '/Producto/Index';
            },
            error: function (datae) {
                console.log(`Esto trae la data Error = "${datae}"`);
                console.log(datae);
            }
        });
    }
}


function modaleditar(id) {
    $(`#modalcambiable`).remove();
    if (id == null) {

    } else {
        $.ajax({
            url: "/Producto/Update",
            type: "post",
            data: { prod_Id: id },
            complete: function (datac) {
            },
            success: function (datas) {
                var datos = datas.responseJSON;
                $(`#exampleModalLabel`).text(`Editar Producto`);

                body = `
                            <div id="modalcambiable">
                                    <div class="mb-3">
                                        <label class="form-label">Codigo</label>
                                        <input id="txtcodigo" value="${datas.prod_Codigo}" type="text" class="form-control" />
                                        <span id="spacodigo" class="text-danger"></span>
                                    </div>
                                    <div class="mb-3">
                                        <input id="txtid" value="${datas.prod_Id}" type="hidden" />
                                        <label class="form-label">Nombre</label>
                                        <input id="txtnombre" value="${datas.prod_Nombre}" type="text" class="form-control"/>
                                        <span id="spanombre" class="text-danger"></span>
                                    </div>
                                   <div class="mb-3">
                                        <label class="form-label">Tipo de Producto</label>
                                        <select id="selecttipoprodu" class="form-control"> 
                                        </select>
                                        <span id="spatipoprodu" class="text-danger"></span>
                                   </div>
                                    
                                    <div class="modal-footer">
                                        <button onclick="cerrarmodal()" type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <button onclick="editar()" type="button" class="btn btn-primary">Editar</button>
                                   </div>
                             </div>`;

                $.ajax({
                    url: "/Producto/Select_ProdTip",
                    type: "post",
                    success: function (datas) {
                        var option = `<option class="text-center" value="0">Seleccione una opcion</option>`;
                        datas.forEach(function (data) {
                            option += `<option value="${data.pdTi_Id}">${data.pdTi_Codigo}-${data.pdTi_Nombre}</option>`;
                        });
                        $(`#selecttipoprodu`).append(option);
                        $('#selecttipoprodu').val(datas.pdTi_Id);
                    },
                    error: function (datae) {
                        console.log(`Entro al error`);
                        console.log(datae);
                    }
                });
                $(`#modalbody`).append(body);
                $(`#exampleModal`).modal(`show`);
            },
            error: function (datae) {
                console.log(`esto trae la data errer = ${datae}`);
                console.log(datae);
            }
        });
    }
}   
function editar() {
    var id = $('#txtid').val();
    var nombre = $('#txtnombre').val();
    var codigo = $('#txtcodigo').val();
    var tipopro = $('#selecttipoprodu').val();

    if (nombre == "" || codigo == "" || tipopro == "") {
        if (nombre == "") {
            $('#spanombre').text('El campo Nombre es requerido');
        } else {
            $('#spanombre').text('');
        }
        if (codigo == "") {
            $('#spacodigo').text('El campo Código es requerido');
        } else {
            $('#spacodigo').text('');
        }
        if (tipopro == "") {
            $('#spatipoprodu').text('El campo Tipo Producto es requerido');
        } else {
            $('#spatipoprodu').text('');
        }
    } else {
        $('#spanombre').text('');
        $('#spacodigo').text('');
        $('#spatipoprodu').text('');

        var modelo = {
            prod_Id: id,
            prod_Codigo: codigo,
            prod_Nombre: nombre,
            PdTi_Id: tipopro,
            prod_Estado: true
        };

        $.ajax({
            url: "/Producto/Update_Producto",
            type: "post",
            data: { model: modelo },
            success: function (datas) {
                if (datas == false) {
                } else {
                    location.href = '/Producto/Index';
                }
            },
            error: function (datae) {
                console.log('Error en la solicitud AJAX:', datae);
            }
        });
    }
}

function modaleliminar(id, nombre) {
    $(`#modalcambiable`).remove();
    $(`#exampleModalLabel`).text(`Eliminar Producto`);
    body = `
             <div id="modalcambiable" >
                    <input asp-for="${id}" value="${id}" type="hidden" />
                    <div class="alert alert-danger" role="alert">
                       Desea eliminar este registro?
                    </div>
                    <div class="modal-footer">
                        <button onclick="cerrarmodal()" type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button onclick="eliminar(${id})" type="button" class="btn btn-danger">Eliminar</button>
                    </div>
             </div>`;
    $(`#modalbody`).append(body);
    $(`#exampleModal`).modal(`show`);

}

function eliminar(id) {
    $.ajax({
        url: "/Producto/Delete",
        type: "post",
        data: { prod_Id: id },
        complete: function (datac) {

        },
        success: function (data) {
            //console.log(`Esto trae la data Success = ${data}`);
            $(`#exampleModal`).modal(`hide`);
            
            location.href = `/Producto/Index`;

        },
        error: function (datae) {
            console.log(`Esto trae la data error = ${datae}`);
            console.log(datae);
        }
    });
}