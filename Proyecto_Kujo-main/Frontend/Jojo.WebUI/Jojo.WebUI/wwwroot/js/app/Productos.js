$(document).ready(function () {
    $('#DataTable').dataTable({
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.13.2/i18n/es-MX.json"
        },

    });

    var crea = sessionStorage.getItem("Createprod");
    if (crea == "si") {
        iziToast.success({
            title: 'Bien',
            message: 'El registro se ha insertado con éxito',
            position: 'topRight',
        });
    }
    sessionStorage.setItem("Createprod", null);

    var edit = sessionStorage.getItem("Editprod");
    console.log(edit);
    if (edit == "si") {
        iziToast.success({
            title: 'Bien',
            message: 'El registro se ha editado con éxito',
            position: 'topRight',
        });
    }
    sessionStorage.setItem("Editprod", null);

    var elim = sessionStorage.getItem("Elimprod");
    console.log(elim);
    if (edit == "si") {
        iziToast.success({
            title: 'Bien',
            message: 'El registro se ha editado con éxito',
            position: 'topRight',
        });
    }
    sessionStorage.setItem("Editprod", null);
});



function ModalCrear() {

    $("#descripcionI").val("")
    $("#PrecioI").val("")
    $("#CategoriaI").val("")
    $("#ProveedoI").val("")
    $("#stockI").val("")
    $("#ModalCrear").modal("show");
}

function ModalEditar(cadena) {
    var cadenaS = cadena;
    var data = cadenaS.split(',');

    $("#idE").val(data[0])
    $("#descripcionE").val(data[1])
    $("#PrecioE").val(data[2])
    $("#CategoriaE").val(data[3])
    $("#ProveedorE").val(data[4])
    $("#stockE").val(data[5])

    $("#ModalEditar").modal("show");
}

function ModalEditarCerrar() {
    $("#ModalEditar").modal("hide");

}
function ModalDelete(id) {
    $("#idD").val(id);
    $("#ModalDelete").modal("show");
}

function ModalCrearCerrar() {
    $("#ModalCrear").modal("hide");
    $("#descripcionI").val("");
}

function Ingresar() {

    var canInsert = true;

    if ($("#descripcionI").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Descripción es requerido',
            position: 'topRight',
        });
        canInsert = false;

    }
    if ($("#PrecioI").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Precio es requerido',
            position: 'topRight',
        });
        canInsert = false;
    }
    if ($("#CategoriaI").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Categoría es requerido',
            position: 'topRight',
        });
        canInsert = false;
    }
    if ($("#ProveedorI").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Proveedor es requerido',
            position: 'topRight',
        });
        canInsert = false;
    }
    if ($("#stockI").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Stock es requerido',
            position: 'topRight',
        });
        canInsert = false;
    }
    if (canInsert) {
        sessionStorage.setItem("Creaprod", "si");
        $("#FI").submit();
    }
}
function Ingresar2() {

    var canInsert = true;

    if ($("#descripcionE").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Descripción es requerido',
            position: 'topRight',
        });
        canInsert = false;
    }
    if ($("#PrecioE").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Precio es requerido',
            position: 'topRight',
        });
        canInsert = false;
    }
    if ($("#CategoriaE").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Categoría es requerido',
            position: 'topRight',
        });
        canInsert = false;
    }
    if ($("#ProveedorE").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Proveedor es requerido',
            position: 'topRight',
        });
        canInsert = false;
    }
    if ($("#stockE").val() == "") {
        iziToast.warning({
            title: 'Advertencia',
            message: 'El Campo Stock es requerido',
            position: 'topRight',
        });
        canInsert = false;
    }
    if (canInsert) {
        sessionStorage.setItem("Editprod", "si");
        $("#FE").submit();
    }
}


function Ingresar3() {
    sessionStorage.setItem("Elimprod", "si");
    $("#FD").submit();
}

