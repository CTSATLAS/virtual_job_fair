@App =
  init: ->
    @initSummernote()

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

$ ->
  window.App.init()
