jQuery(function($) {
    $('.preference').on('click', function() {
        var value = $(this).data('value');
        $('.questionaire-value').val(value);
        $('.questionaire').submit();
    });
});

