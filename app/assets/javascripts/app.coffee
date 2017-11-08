Messenger.options =
  extraClasses: 'messenger-fixed messenger-on-top'
  theme: 'block'

@App =
  init: ->
    @interceptFlashMessages()
    @initDatepicker()
    @initSummernote()
    @bootstrapDropdownFix()

  interceptFlashMessages: ->
    $('.flash').each ->
      type = $(this).data('type')

      type = 'success' if type == 'notice'

      Messenger().post
        message: $(this).text()
        showCloseButton: true
        type: type

  initDatepicker: ->
    ageLimitDate = moment().subtract(14, 'years')

    $('[data-provide="datepicker-date-of-birth"]').daterangepicker
      autoUpdateInput: false
      maxDate: ageLimitDate
      singleDatePicker: true
      showDropdowns: true
      startDate: ageLimitDate
    , (start, end, label) ->
      $(@.element).val(start.format('MM/DD/YYYY'))

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
