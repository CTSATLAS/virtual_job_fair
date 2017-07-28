@App =
  init: ->
    @initSummernote()
    @bootstrapDropdownFix()

  initSummernote: ->
    toolbarConfig = []

    $('[data-provide="wysiwyg"]').each (wysiwyg) ->
      if $(this).data('wysiwyg') == 'simple'
        toolbarConfig = [
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['font', ['strikethrough']],
          ['fontsize', ['fontsize']],
          ['para', ['ul', 'ol', 'paragraph']],
        ]

      $(this).summernote
        height: 175
        toolbar: toolbarConfig

  # I'm not quite sure why this is needed to be honest...
  bootstrapDropdownFix: ->
    $('.dropdown-toggle').dropdown()

$ ->
  window.App.init()
