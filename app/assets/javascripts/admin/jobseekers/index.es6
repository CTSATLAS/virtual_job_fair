'use strict';

window.Admin = window.Admin || {}
window.Admin.Jobseekers = window.Admin.Jobseekers || {}

window.Admin.Jobseekers.new = {
  init() {
    this.initDatatables();
  },
  
  initDatatables() {
    $('#jobseekers').DataTable({
      dom: 'Bfrtip',

      buttons: [{
        extend: 'csvHtml5',
        exportOptions: {
          columns: [0, 1, 2, 4]
        }
      }, {
        extend: 'excelHtml5',
        exportOptions: {
          columns: [0, 1, 2, 4]
        }
      }],

      // buttons: ['csvHtml5', 'excelHtml5'],

      columnDefs: [{
        targets: 3,
        searchable: false,
        sortable: false
      }, {
        targets: 5,
        searchable: false,
        sortable: false,
        width: '103px'
      }]
    });
  }
};

$(document).on('turbolinks:load', () => window.Admin.Jobseekers.new.init());