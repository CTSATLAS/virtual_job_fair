'use strict';

window.Admin = window.Admin || {}
window.Admin.Employers = window.Admin.Employers || {}

window.Admin.Employers.new = {
  init() {
    this.initDatatables();
  },

  initDatatables() {
    $('#employers').DataTable({
      dom: 'Bfrtip',

      buttons: ['csvHtml5', 'excelHtml5'],

      columnDefs: [{
        targets: 3,
        searchable: false,
        sortable: false
      }, {
        targets: 7,
        searchable: false,
        sortable: false,
        width: '103px'
      }]
    });
  }
};

$(document).on('turbolinks:load ready', () => {
  window.Admin.Employers.new.init();
})
