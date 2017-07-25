window.ParsleyConfig = {
    errorClass: 'has-error',
    successClass: 'has-success',
    classHandler: function(ParsleyField) {
        return ParsleyField.$element.parents('.form-group');
    },
    errorsContainer: function(ParsleyField) {
        return ParsleyField.$element.parents('.form-group');
    },
    errorsWrapper: '<span class="help-block">',
    errorTemplate: '<div></div>'
};

$(document).on("turbolinks:load", function() {
    var form = $('form.has_validations');
    if ( form.length ) {
      var parsley_form = form.parsley();
    }
    $(document).on('turbolinks:before-cache', function() {
        if (parsley_form) {
            parsley_form.destroy();
            parsley_form = null;
        }
    })
});
