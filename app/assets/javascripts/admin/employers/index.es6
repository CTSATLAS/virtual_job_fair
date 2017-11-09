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

      buttons: [{
        extend: 'csvHtml5',
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6]
        }
      }, {
        extend: 'excelHtml5',
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6]
        }
      }],

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

$(document).on('turbolinks:load', () => window.Admin.Employers.new.init());