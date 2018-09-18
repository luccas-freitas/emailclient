$(function () {
    $('#contentModal').modal({
        keyboard: true,
        backdrop: "static",
        show: false,

    }).on('show', function () {

    });

    $(".table").find('tr[data-id]').on('click', function () {
        debugger;

        //do all your operation populate the modal and open the modal now. DOnt need to use show event of modal again

        $('#orderDetails').html($('<b> Id selected: ' + $(this).data('id') + '</b>'));
        $('#orderModal').modal('show');



    });

});