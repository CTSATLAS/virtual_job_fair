'use strict';

window.Admin = window.Admin || {}
window.Admin.Users = window.Admin.Users || {}

window.Admin.Users.edit = {
  init() {
    this.initInputMasks();
    this.initSummernote();
    this.initSelectize();
  },

  initInputMasks() {
    $(':input').inputmask();
  },

  initSelectize() {
    $('[data-provide="selectize"]').selectize({
      delimiter: ',',
      persist: false,
      create: input => ({ value: input, text: input })
    });
  },

  initSummernote() {
    let toolbarConfig = [];

    $('[data-provide="wysiwyg"]').each((index, wysiwyg) => {
      if ($(wysiwyg).data('wysiwyg') == 'simple') {
        toolbarConfig = [
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['font', ['strikethrough']],
          ['fontsize', ['fontsize']],
          ['para', ['ul', 'ol', 'paragraph']],
        ];
      }

      $(wysiwyg).summernote({
        height: 175,
        toolbar: toolbarConfig
      });
    });
  }
};

$(document).on('turbolinks:load ready', () => {
  window.Admin.Users.edit.init();
})
