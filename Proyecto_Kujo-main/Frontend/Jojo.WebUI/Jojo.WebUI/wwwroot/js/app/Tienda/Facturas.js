$(document).ready(function () {
    $('#DataTable').dataTable({
        "language": {
            "url": "https://cdn.datatables.net/plug-ins/1.13.2/i18n/es-ES.json"
        },

    });


});

$(".EstaListo").click(function () {

    iziToast.info({
        title: '',
        message: 'La Factura ya fue cerrada, no se puede editar este registro',
        position: 'topRight',
    });

});


$(".EliminarFake").click(function () {

    iziToast.info({
        title: '',
        message: 'La factura ha sido cerrada, este registro no se puede eliminar',
        position: 'topRight',
    });

});