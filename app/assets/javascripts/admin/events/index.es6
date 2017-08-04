'use strict';

window.Admin = window.Admin || {}
window.Admin.Events = window.Admin.Events || {}

window.Admin.Events.new = {
  init() {
    console.log('intialize Admin.Events.new');
  }
};

$(() => {
  window.Admin.Events.new.init();
});
