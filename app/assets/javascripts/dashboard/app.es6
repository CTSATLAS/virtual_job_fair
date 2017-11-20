'use strict';

window.App = window.App || {}

window.App = {
  init() {
    this.interceptFlashMessages();
  },

  interceptFlashMessages() {
    $('.flash').each(function() {
      let type = $(this).data('type');

      if (type == 'notice') { type = 'success'; }

      new Noty({
        text: $(this).text(),
        type: type
      }).show();
    });
  }
};

Noty.overrideDefaults({
  animation: {
    open: 'animated fadeInRight',
    close: 'animated fadeOutRight'
  },
  closeWith: ['click', 'button'],
  layout: 'topRight',
  theme: 'sunset',
  timeout: 3000
});

$(document).on('turbolinks:load', () => window.App.init())