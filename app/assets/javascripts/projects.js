$(
    $('.new-resource-add').click(function () {
        $.ajax({
            url: 'resources/new',
            method: 'GET',
            success: function () {
                $('.new-resource-container').append();
            }
        });
    })
);
